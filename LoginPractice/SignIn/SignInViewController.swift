//
//  SignInViewController.swift
//  LoginPractice
//
//  Created by yongseok lee on 2022/11/02.
//

import UIKit
import RxSwift
import RxCocoa

class SignInViewController: UIViewController {
    
    let mainView = SignView()
    
    let viewModel = SignInViewModel()
 
    let disposeBag = DisposeBag()
    
    let userInfo = UserInfo(name: "Lee12", email: "Lee12@Lee.com", password: "12345678")
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        bind()

        
    }
    
    func configure() {
        mainView.signInButton.addTarget(self, action: #selector(signInButtonClicked), for: .touchUpInside)
    }
    
    @objc func signInButtonClicked() {
        
        viewModel.userInfo
            .subscribe { value in
                print("userInfo",value)
            }
            .disposed(by: disposeBag)
        
        mainView.signInButton.rx.tap
            .withUnretained(self)
            .bind { (vc,_) in
                print("bind")
                vc.viewModel.userInfo
                    .onNext(vc.userInfo)
            }
            .disposed(by: disposeBag)
        
        viewModel.requetSignIn()

    }
    
   
    func bind() {
        viewModel.userInfo
            .subscribe { value in
                print("ddd")
                print(value.name)
            } onError: { error in
                print(error.localizedDescription)
            }
            .disposed(by: disposeBag)
        
        mainView.userNameTextField.rx.text.orEmpty
            .withUnretained(self)
            .bind { (vc, value) in
                vc.viewModel.userName
                    .onNext(value)
            }
            .disposed(by: disposeBag)
        
        
    }
    
    
}
