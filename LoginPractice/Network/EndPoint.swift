//
//  EndPoint.swift
//  LoginPractice
//
//  Created by yongseok lee on 2022/11/02.
//

import Foundation
import Alamofire


enum SeSACAPI {
    case signIn(userName: String, email: String, password: String)
    case login(email: String, password: String)
    case profile
}

extension SeSACAPI {
    
    var url: URL {
        switch self {
        case .signIn:
            return URL(string: "http://api.memolease.com/api/v1/users/signup")!
        case .login:
            return URL(string: "http://api.memolease.com/api/v1/users/login")!
        case .profile:
            return URL(string: "http://api.memolease.com/api/v1/users/me")!
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .signIn, .login :
            return ["Content-Type": "application/x-www-form-urlencoded"]
        case .profile:
            return [
                "Authorizaion": "Bearer \(UserDefaults.standard.string(forKey: "token")!)",
                "Content-Type": "application/x-www-form-urlencoded"
            ]
        }
    }
    
    var parameters: [String: String] {
        switch self {
        case .signIn(let username, let email, let password):
            return [
                "userName": username,
                "email": email,
                "password": password
            ]
        case .login(let email, let password):
            return [
                "email": email,
                "password": password
            ]
        default: return ["":""]
        }
    }
}
