//
//  UIViewExtension.swift
//  TestApp
//
//  Created by Ihor Zaliskyj on 22.11.2022.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title:String?, message:String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
