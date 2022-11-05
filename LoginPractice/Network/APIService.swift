//
//  APIService.swift
//  LoginPractice
//
//  Created by yongseok lee on 2022/11/02.
//

import Foundation
import Alamofire

final class APIService {
    
    static let share = APIService()
    private init() {}
    
    func requestSeSAC<T: Decodable>(type: T.Type = T.self, url: URL, method: HTTPMethod, headers: HTTPHeaders, parameters: [String:String], completion : @escaping (Result<T, Error>) ->Void ) {
        
        AF.request(url, method: method, parameters: parameters, headers: headers).responseDecodable(of: T.self) { response in
            switch response.result {
                
            case .success(let data):
                completion(.success(data))
            case .failure(_):
                guard let statusCode = response.response?.statusCode else { return }
                guard let error = SeSACError(rawValue: statusCode) else { return }
                completion(.failure(error))
            }
        }
        
    }
    
    
}
