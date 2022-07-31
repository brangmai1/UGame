//
//  ViewController.swift
//  UGame
//
//  Created by Brang Mai on 7/29/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    
    var targetValue = 0
    var currentValude: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewRound()
        
        // Do any additional setup after loading the view.
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValude = lroundf(slider.value)
        slider.value = Float(currentValude)
        
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
    
    @IBAction func showAlert() {
        let message = "The current value of the slider is: \(currentValude)"
                        + "\nThe target value is: \(targetValue)"
        
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
        
        startNewRound()
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValude = lroundf(slider.value)
        
        
    }


}

