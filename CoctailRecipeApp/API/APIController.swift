//
//  APIController.swift
//  CoctailRecipeApp
//
//  Created by İsmail on 9.03.2022.
//

import Foundation

class APIController {
    static let domain = "https://www.thecocktaildb.com/api/json/v1/1/"
    static let allCocktailsURL = domain + "search.php?f=a"
    static let searchByName = domain + "search.php?s=margarita"
    
    static let shared = APIController()
}

extension URLSession {
    enum CustomError: Error {
        case invalidURL
        case invalidData
    }
    
    func request<T: Decodable>(url: URL?, expecting: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = url else {
            completion(.failure(CustomError.invalidURL))
            return
        }
        
        let task = dataTask(with: url) { data, _, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                }
                else {
                    completion(.failure(CustomError.invalidData))
                }
                return
            }
            
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
