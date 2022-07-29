//
//  ViewController.swift
//  UGame
//
//  Created by Brang Mai on 7/29/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAlert() {
        let alert = UIAlertController (
            title: "Alert Description",
            message: "Alert button clicked",
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "Dismiss",
            style: .default,
            handler: nil)

        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }


}

