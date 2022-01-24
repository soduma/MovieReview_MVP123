//
//  MovieManager.swift
//  MovieReview_MVP
//
//  Created by 장기화 on 2022/01/20.
//

import Foundation
import Alamofire

protocol MovieManagerProtocol {
    func fetchMovie(from keyword: String, completionHandler: @escaping ([Movie]) -> Void)
}

struct RequestModel: Codable {
    let query: String
}

struct MovieManager: Codable {
    func fetchMovie(from keyword: String, completionHandler: @escaping ([Movie]) -> Void) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/movie.json") else { return }
        
        let parameters = RequestModel(query: keyword)
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": "201FemwuZ7HTebMDK3uG",
            "X-Naver-Client-Secret": "Oqv5e6oDcp"
        ]
        
        AF
            .request(url, method: .get, parameters: parameters, headers: headers)
            .responseDecodable(of: NaverAPI.self) { response in
                switch response.result {
                case .success(let result):
                    completionHandler(result.items)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .resume()
    }
}
