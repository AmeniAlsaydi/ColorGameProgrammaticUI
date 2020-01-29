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
    private var score = 0
    private var highestScore = 0
    
    override func loadView() {
        view = colorView
    }
    
    override func viewDidLayoutSubviews() {
        
        // make buttons circle
        
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
            score = 0
            // disable buttons ?
        } else {
            print("User wants to play")
            updateDisplayColor()
            score = 0 // reset the score
        }
        
    }
    
    
    private func checkWin(buttonTag: Int) {
        guard let highestValue = randomNumArr.max() else { return }// at this point i have the highest
        
        let indexOfHighest = randomNumArr.firstIndex(of: highestValue)
        
        // check high score:

        if score > highestScore {
            highestScore = score
        }
        
        if buttonTag == indexOfHighest {
            // print("correct keep going")
            score += 1
            colorView.scoreLabel.text = "Score: \(score)"
            
            // add to score
            
            updateDisplayColor()
        } else {
            print("nope you lose")
            colorView.highScoreLabel.text = "Highest Score: \(highestScore)"
            
            showAlert(title: "You Lose", message: "Would you like to play again?", completion: playAgain(alert:))
            
        }
    }
    
    @objc
    private func colorGuessed(_ sender: UIButton) {
        checkWin(buttonTag: sender.tag)
        
    }

}


// Still TODO:

/*
 - display score
 - keep track of highest score
 - fix UI cuz its ugly
 BONUS:
 - had difficulty levels (maybe by having cgfloats that are in a smaller range?)
 */
