//
//  ViewController.swift
//  ColorGameProgrammaticUI
//
//  Created by Amy Alsaydi on 1/28/20.
//  Copyright © 2020 Amy Alsaydi. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    private let colorView = ColorsView()
    private var randomNumArr = [CGFloat]()
    
    override func loadView() {
        view = colorView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        configureNavBar()
        addTargets()
        updateDisplayColor() 
    }
    

    private func addTargets() {
        
        guard let redButton = colorView.colorButtonStack.subviews[0] as? UIButton, let greenButton = colorView.colorButtonStack.subviews[1] as? UIButton, let blueButton = colorView.colorButtonStack.subviews[2] as? UIButton else {
            fatalError("missing button")
        }
          let buttons = [redButton, greenButton, blueButton]
        
        let _ = buttons.map { $0.addTarget(self, action: #selector(colorGuessed(_:)), for: .touchUpInside) }
    }
    
    private func configureNavBar() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
      
        navigationItem.title = "Bomb Color Game"
    }
    
    private func updateDisplayColor() {
        let randRed = CGFloat.random(in: 0...1)
        let randGreen = CGFloat.random(in: 0...1)
        let randBlue = CGFloat.random(in: 0...1)
        
        randomNumArr = [randRed, randGreen, randBlue]
        
        let myColor = UIColor(red: randRed, green: randGreen, blue: randBlue, alpha: 1)
        colorView.colorImageView.backgroundColor = myColor
    }

    private func playAgain(alert: UIAlertAction!) {
        if alert.title == "No" {
        print("User doesnt want to play")
        } else {
            print("User wants to play")
            updateDisplayColor()
        }
        
    }
    
    
    private func checkWin(buttonTag: Int) {
        guard let highestValue = randomNumArr.max() else { return }// at this point i have the highest
        
        let indexOfHighest = randomNumArr.firstIndex(of: highestValue)
        
        if buttonTag == indexOfHighest {
            print("correct keep going")
            
            updateDisplayColor()
        } else {
            print("nope you lose")
            showAlert(title: "You Lose", message: "Would you like to play again?", completion: playAgain(alert:))
        
        }
        
        
    }
    
    @objc
    private func colorGuessed(_ sender: UIButton) {
        checkWin(buttonTag: sender.tag)
        
    }

}

