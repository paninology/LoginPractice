//
//  NetworkModel.swift
//  LoginPractice
//
//  Created by yongseok lee on 2022/11/03.
//

import Foundation

struct Login: Codable {
    let token: String
}

struct Profile: Codable {
    let user: User
}

struct User: Codable {
    let photo: String
    let email: String
    let username: String
}

struct UserInfo: Codable {
    let name: String
    let email: String
    let password: String
}
