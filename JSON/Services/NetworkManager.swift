//
//  NetworkManager.swift
//  JSON
//
//  Created by Armen Madoyan on 09.11.2022.
//

import Foundation
import Alamofire

//enum NetworkError: Error {
//    case invalidURL
//    case noData
//    case decodingError
//}

enum Link: String {
    case productURL = "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchProducts(from url: String, completion: @escaping (Result<[Product], AFError>) -> Void ) {
            AF.request(url)
                .validate()
                .responseJSON { dataResponse in
                    switch dataResponse.result {
                    case .success(let value):
                        let products = Product.getProducts(from: value)
                        completion(.success(products))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
    }
    
    func fetchData(from url: String, completion: @escaping (Result<Data, AFError>) -> Void ) {
        AF.request(url)
            .validate()
            .responseData { dataResponse in
                switch dataResponse.result {
                case .success(let imageData):
                    completion(.success(imageData))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    
//    func fetchImage(from url: String, complition: @escaping(Result<Data, NetworkError>) -> Void) {
//        guard let url = URL(string: url) else {
//            complition(.failure(.invalidURL))
//            return
//        }
//        DispatchQueue.global().async {
//            guard let imageData = try? Data(contentsOf: url) else {
//                complition(.failure(.noData))
//                return }
//            DispatchQueue.main.async {
//                complition(.success(imageData))
//            }
//        }
//    }
//
//    func fetch<T: Decodable>(_ type: T.Type, from url: String, complition: @escaping(Result<T, NetworkError>) -> Void) {
//        guard let url = URL(string: url) else {
//            complition(.failure(.invalidURL))
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data else {
//                complition(.failure(.noData))
//                print(error?.localizedDescription ?? " No error discription")
//                return
//            }
//
//            do {
//                let type = try JSONDecoder().decode(T.self, from: data)
//                DispatchQueue.main.async {
//                    complition(.success(type))
//                }
//            }catch let error {
//                print(error.localizedDescription)
//            }
//        }.resume()
//    }
}
