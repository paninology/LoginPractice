//
//  MainView.swift
//  LoginPractice
//
//  Created by yongseok lee on 2022/11/02.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setConstraints() {
        
    }
    
    func configure() {
        
    }
}
