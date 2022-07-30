//
//  ViewController.swift
//  UGame
//
//  Created by Brang Mai on 7/29/22.
//

import UIKit

class ViewController: UIViewController {
    var currentValude: Int = 50

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAlert() {
        let message = "The current value of the slider is: \(currentValude)"
        
        let alert = UIAlertController (
            title: "Alert Description",
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "Dismiss",
            style: .default,
            handler: nil)

        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValude = lroundf(slider.value)
        
        
    }


}

