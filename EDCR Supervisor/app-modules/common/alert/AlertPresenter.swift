//
//  AlertPresenter.swift
//  EDCR Supervisor
//
//  Created by Md Altaf Hoshain Firoj on 28/5/24.
//

import Foundation

import UIKit

class AlertPresenter {
    static func showAlert(on viewController: UIViewController, title: String = "Error", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}
