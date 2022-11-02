//
//  CustomTextField.swift
//  LoginPractice
//
//  Created by yongseok lee on 2022/11/02.
//

import UIKit

class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        backgroundColor = .systemPink
        
    }
    
}
