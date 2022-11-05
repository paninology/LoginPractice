//
//  SignInViewModel.swift
//  LoginPractice
//
//  Created by yongseok lee on 2022/11/03.
//

import Foundation
import RxSwift

class SignInViewModel {
    
    let userInfo = PublishSubject<UserInfo>()
    
    var userName = PublishSubject<String>()
    var email = PublishSubject<String>()
    var password = PublishSubject<String>()
    
    var api = SeSACAPI.signIn(userName: "Lee32", email: "Lee32@Lee.com", password: "12345678")
 
    
    
    func requetSignIn() {
//        let api = SeSACAPI.signIn(userName: , email: , password: )
        APIService.share.requestSeSAC(type: UserInfo.self ,url: api.url, method: .post, headers: api.headers, parameters: api.parameters) { [weak self] response  in
            
            switch response {
                
            case .success(let success):
                self?.userInfo
                    .onNext(success)
            case .failure(let failure):
                print(self?.api.parameters)
                self?.userInfo
                    .onError(failure)
                
            }
        }
    }
    
    func updateUserInfo() {
        let name = "Lee"
        let email = "Lee@Lee.com"
        let password = "12345678"
        
        var userInfo = UserInfo(name: name, email: email, password: password)
        self.userInfo.onNext(userInfo)
        
        
    }
}
