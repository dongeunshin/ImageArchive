//
//  NetworkService.swift
//  ImageArchive
//
//  Created by dong eun shin on 2022/07/25.
//

import Foundation

protocol Api{
    func request(completion: @escaping (Result<Codable?, Error>)->())
}

class NetworkService: Api{
    func request(completion: @escaping (Result<Codable?, Error>)->()){
        getRequest { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    private func getRequest(completion: @escaping (Result<Codable?, Error>)->()){
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.unplah.com"
        urlComponents.path = "/photos"
        urlComponents.queryItems = [URLQueryItem(name: "client_id", value: "1"),
                                    URLQueryItem(name: "page", value: "30"),
                                    URLQueryItem(name: "per_page", value: "15")]
        
        let session = URLSession(configuration: .default)
        guard let url = urlComponents.url else { return }
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            guard error == nil, let statusCode = (response as? HTTPURLResponse)?.statusCode,
                  (200..<300).contains(statusCode), let data = data else {
                completion(.failure(error!))
                return
            }
            print(data)
            do{
//                let resultData = try JSONDecoder().decode(.self, from: data)
//                completion(.success(resultData))
            }catch{
                completion(.failure(error))
                return
            }
        }
        dataTask.resume()
    }
}


