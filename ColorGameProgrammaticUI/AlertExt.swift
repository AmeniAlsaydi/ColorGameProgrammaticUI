//
//  AlertExt.swift
//  ColorGameProgrammaticUI
//
//  Created by Amy Alsaydi on 1/29/20.
//  Copyright © 2020 Amy Alsaydi. All rights reserved.
//


import UIKit

extension UIViewController {
  func showAlert(title: String, message: String, completion: ((UIAlertAction) -> Void)? = nil) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let yesAction = UIAlertAction(title: "Yes", style: .default, handler: completion)
    let noAction = UIAlertAction(title: "No", style: .default, handler: completion)
    alertController.addAction(yesAction)
    alertController.addAction(noAction)
    present(alertController, animated: true, completion: nil)
  }
}
