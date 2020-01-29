//
//  ColorsView.swift
//  ColorGameProgrammaticUI
//
//  Created by Amy Alsaydi on 1/28/20.
//  Copyright © 2020 Amy Alsaydi. All rights reserved.
//

import UIKit

class ColorsView: UIView {
    
   public lazy var colorButtonStack: UIStackView = {
      let stack = UIStackView(arrangedSubviews: buttonArray())
      stack.axis = .horizontal
      stack.distribution = .fillEqually
      stack.alignment = .fill
      stack.spacing = 50
      // stack.translatesAutoresizingMaskIntoConstraints = false
      return stack
    }()
    
    
    public lazy var colorImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = updateDisplayColor()
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
        setupStackViewContraints()
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
    
    private func setupStackViewContraints() {
        
        addSubview(colorButtonStack)
        colorButtonStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            colorButtonStack.topAnchor.constraint(equalTo: colorImageView.bottomAnchor, constant: 50),
            colorButtonStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            colorButtonStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            colorButtonStack.heightAnchor.constraint(equalToConstant: 80) ])
    }
    
}

func updateDisplayColor() -> UIColor {
    let randRed = CGFloat.random(in: 0...1)
    let randGreen = CGFloat.random(in: 0...1)
    let randBlue = CGFloat.random(in: 0...1)
    
    // let randomNumArr = [randRed, randGreen, randBlue]
    // let highestValue = randomNumArr.max()
    
    
    let myColor = UIColor(red: randRed, green: randGreen, blue: randBlue, alpha: 1)
    return myColor
}


func buttonArray() -> [UIButton]{
    let redButton = UIButton()
    redButton.backgroundColor = .red
    redButton.tag = 0
    
    let greenButton = UIButton()
    greenButton.backgroundColor = .green
    greenButton.tag = 1
    
    let blueButton = UIButton()
    blueButton.backgroundColor = .blue
    blueButton.tag = 2
    
    
    let buttonArray = [redButton, greenButton, blueButton]
    
    return buttonArray
}
