//
//  APICaller.swift
//  PhotosCollection
//
//  Created by Nodirbek on 27/04/22.
//

import Foundation


struct Constants {
    static let baseURL = "https://api.unsplash.com/search/photos?page=1&client_id=N1wqDVIrlpV24mawPNS8QkA6Nb2KhFpkUZLrkJZ47eg&query="
}

enum APIErrors: Error {
    case failedToGetData
    case failedToGetPhoto
}

final class APICaller {
    static let shared = APICaller()
    
    func getPhotos(query: String, completion: @escaping (Result<[Results], Error>)->Void){
        
        guard let url = URL(string: "\(Constants.baseURL)\(query)") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data,
                  error == nil else {
                completion(.failure(APIErrors.failedToGetData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(PhotoResults.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(APIErrors.failedToGetPhoto))
            }
        }
        task.resume()
    }
}

