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
    
    var buttons = [UIButton]() // use this to disable buttons
    
    
    override func loadView() {
        view = colorView
    }
    
    override func viewDidLayoutSubviews() {
    
        colorView.colorImageView.layer.cornerRadius = colorView.colorImageView.frame.width/13
        colorView.playButton.layer.cornerRadius = colorView.playButton.frame.width/13
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "MyColor")
        configureNavBar()
        addTargets()
        updateDisplayColor()
        colorView.playButton.isEnabled = false
        colorView.playButton.isHidden = true
    }
    

    private func addTargets() {
        
        guard let redButton = colorView.colorButtonStack.subviews[0] as? UIButton, let greenButton = colorView.colorButtonStack.subviews[1] as? UIButton, let blueButton = colorView.colorButtonStack.subviews[2] as? UIButton else {
            fatalError("missing button")
        }
          buttons = [redButton, greenButton, blueButton]
        
        let _ = buttons.map { $0.addTarget(self, action: #selector(colorGuessed(_:)), for: .touchUpInside) }
        
        colorView.playButton.addTarget(self, action: #selector(reset(_sender:)), for: .touchUpInside)
        
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
            score = 0
            colorView.scoreLabel.text = ""
            colorView.colorImageView.image = UIImage(named: "rainbow.png")
            colorView.playButton.isHidden = false

            colorView.playButton.isEnabled = true
            let _ = buttons.map { $0.isEnabled = false }
        } else {
        
            colorView.scoreLabel.text = " ➡️ Score: \(score)"
            updateDisplayColor()
        }
        
    }
    
    
    private func checkWin(buttonTag: Int) {
        guard let highestValue = randomNumArr.max() else { return }
        
        let indexOfHighest = randomNumArr.firstIndex(of: highestValue)
        
        if score > highestScore {
            highestScore = score
        }
        
        if buttonTag == indexOfHighest {
            score += 1
            colorView.scoreLabel.text = " ➡️ Your Score: \(score)"
            
            updateDisplayColor()
        } else {
            colorView.highScoreLabel.text = " ↗️ Highest Score: \(highestScore)"
            score = 0 // reset the score

            
            showAlert(title: "😭 👎🏼 You Lose 😭 👎🏼", message: "Would you like to play again?", completion: playAgain(alert:))
            
        }
    }
    
    @objc
    private func colorGuessed(_ sender: UIButton) {
        checkWin(buttonTag: sender.tag)
        
    }
    
    @objc
    private func reset(_sender: UIButton) {
        // reenable buttons
        print("in here")
        let _ = buttons.map { $0.isEnabled = true }
        
        // produce new color
        updateDisplayColor()
        
        // disable the play again button
        colorView.colorImageView.image = nil
        colorView.playButton.isEnabled = false
        colorView.playButton.isHidden = true
    }

}


// Still TODO:

/*
 - display score ✅
 - keep track of highest score ✅
 - fix UI cuz its ugly ✅
 - add play again button ✅
 
 BONUS:
 - add difficulty levels (maybe by having cgfloats that are in a smaller range?)
 */
