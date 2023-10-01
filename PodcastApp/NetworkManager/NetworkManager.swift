//
//  NetworkManager.swift
//  PodcastApp
//
//  Created by Aleksandr Rybachev on 29.09.2023.
//

import Foundation
import CryptoKit

enum NetworkError: Error {
    case transportError(Error)
    case serverError(statusCode: Int)
    case noData
    case decodingError(Error)
}

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    /// Метод создает URL
    private func createURL(for endPoint: EndPoint, with query: String? = nil) -> URL? {
        var components = URLComponents()
        components.scheme = API.scheme
        components.host = API.host
        components.path = endPoint.path
        
//        components.queryItems =
        
        return components.url
    }
    
    /// Метод создает REQUEST
    private func getRequest(_ url: URL) -> URLRequest {
        // prep for crypto
        let timeInSeconds: TimeInterval = Date().timeIntervalSince1970
        let apiHeaderTime = Int(timeInSeconds)
        let data4Hash = API.apiKey + API.apiSecret + "\(apiHeaderTime)"
        
        // ======== Hash them to get the Authorization token ========
        let inputData = Data(data4Hash.utf8)
        let hashed = Insecure.SHA1.hash(data: inputData)
        let hashString = hashed.compactMap { String(format: "%02x", $0) }.joined()
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue( "\(apiHeaderTime)", forHTTPHeaderField: "X-Auth-Date")
        request.addValue( API.apiKey, forHTTPHeaderField: "X-Auth-Key")
        request.addValue( hashString, forHTTPHeaderField: "Authorization")
        request.addValue( "SuperPodcastPlayer/1.8", forHTTPHeaderField: "User-Agent")
        
        return request
    }
    
    /// Метод создает TASK
    private func makeTask<T: Codable>(for request: URLRequest, using session: URLSession = .shared, completion: @escaping (Result<T, NetworkError>) -> Void) {
        session.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(.transportError(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decodeData = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodeData))
                }
            } catch {
                completion(.failure(.decodingError(error)))
            }
            
        }.resume()
    }
    
}

// MARK: - PUBLIC METHODS

extension NetworkManager {
    
    // Запрос трендовых подкастов
    func fetchTrendingPodcast(completion: @escaping (Result<SearchedResult, NetworkError>) -> Void) {
        guard let url = createURL(for: .getTrendingPodcast) else { return }
        let request = getRequest(url)
        makeTask(for: request, completion: completion)
    }
    
    // Запрос списка категорий
    func fetchCategoryList(completion: @escaping (Result<SearchedResult, NetworkError>) -> Void) {
        guard let url = createURL(for: .getCategoryList) else { return }
        let request = getRequest(url)
        makeTask(for: request, completion: completion)
    }
    
}
