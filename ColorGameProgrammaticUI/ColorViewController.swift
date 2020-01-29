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
    
    override func loadView() {
        view = colorView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        configureNavBar()
        addTargets()
        
        
        
        
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
    
    @objc
    private func colorGuessed(_ sender: UIButton) {
        print("tag pressed: \(sender.tag)")
    }

}

