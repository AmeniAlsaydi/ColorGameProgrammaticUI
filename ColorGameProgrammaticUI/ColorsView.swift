//
//  ColorsView.swift
//  ColorGameProgrammaticUI
//
//  Created by Amy Alsaydi on 1/28/20.
//  Copyright © 2020 Amy Alsaydi. All rights reserved.
//

import UIKit

class ColorsView: UIView {

    private lazy var colorImageView: UIImageView = {
       let image = UIImageView()
        image.backgroundColor = .blue
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupImageViewContraints()
    }
    
    private func setupImageViewContraints() {
        
        addSubview(colorImageView)
        
        colorImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            colorImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            colorImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            colorImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            colorImageView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
    }
}
