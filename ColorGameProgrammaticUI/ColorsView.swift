//
//  ColorsView.swift
//  ColorGameProgrammaticUI
//
//  Created by Amy Alsaydi on 1/28/20.
//  Copyright © 2020 Amy Alsaydi. All rights reserved.
//

import UIKit

class ColorsView: UIView {
    
    public lazy var playButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "MyOtherColor")
        button.setTitle("🔴 🟢 🔵 PLAY AGAIN 🔴 🟢 🔵", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
    
        return button
    }()
    
    public lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "SCORE"
        return label
    }()
    
    public lazy var highScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "HIGH SCORE"
        return label
    }()
    
   public lazy var colorButtonStack: UIStackView = {
      let stack = UIStackView(arrangedSubviews: buttonArray())
      stack.axis = .horizontal
      stack.distribution = .fillEqually
      stack.alignment = .fill
      stack.spacing = 50
      return stack
    }()
    
    
    public lazy var colorImageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.borderWidth = 1.5
        image.layer.borderColor = UIColor.black.cgColor
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
        setupScoreLabelContraints()
        setupHighScoreLabelContraints()
        setupPlayButtonConstraints()
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
    
    private func setupScoreLabelContraints() {
        addSubview(scoreLabel)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: colorButtonStack.bottomAnchor, constant: 50),
            scoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            scoreLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)
        ])
    }
    
    private func setupHighScoreLabelContraints() {
        addSubview(highScoreLabel)
        highScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            highScoreLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 25),
            highScoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            highScoreLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)
        ])
    }
    
    private func setupPlayButtonConstraints() {
        addSubview(playButton)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -70),
            playButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
            playButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05),
            playButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
}

func buttonArray() -> [UIButton]{
    let redButton = UIButton()
    redButton.backgroundColor = .red
    redButton.tag = 0
    redButton.layer.cornerRadius = 30
    
    let greenButton = UIButton()
    greenButton.backgroundColor = .green
    greenButton.tag = 1
    greenButton.layer.cornerRadius = 30
    
    
    let blueButton = UIButton()
    blueButton.backgroundColor = .blue
    blueButton.tag = 2
    blueButton.layer.cornerRadius = 30
    
    
    let buttonArray = [redButton, greenButton, blueButton]
    
    return buttonArray
}
