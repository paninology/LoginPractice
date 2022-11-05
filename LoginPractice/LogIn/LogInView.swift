//
//  LogInView.swift
//  LoginPractice
//
//  Created by yongseok lee on 2022/11/05.
//
import UIKit
import SnapKit

class LogInView: BaseView {
    
  
    let emailTextField: CustomTextField = {
        let view = CustomTextField()
        view.placeholder = "이메일을 입력하세요"
        return view
    }()
    
    let passwordTextField: CustomTextField = {
        let view = CustomTextField()
        view.placeholder = "비밀번호를 입력하세요"
        return view
    }()
    
    let validationLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .green
        view.text = "입력이 잘못되었습니다."
        return view
    }()
    
    let logInButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .darkGray
        view.setTitle("Sign In", for: .normal)
        return view
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func configure() {
        [emailTextField, passwordTextField, validationLabel, logInButton].forEach { [weak self] in
            self?.addSubview($0)
        }
        
    }
    
    override func setConstraints() {
  
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(40)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(40)
        }
        
        validationLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(40)
        }
        
        logInButton.snp.makeConstraints { make in
            make.top.equalTo(validationLabel.snp.bottom).offset(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(40)
        }
    }
}
