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
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
    
    var targetValue = 0
    var currentValude = 0
    var score = 0
    var round = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewRound()
                
        // Do any additional setup after loading the view.
    }
    
    func startNewRound() {
        round += 1
        roundLabel.text = String(round)
        
        targetValue = Int.random(in: 1...100)
        currentValude = lroundf(slider.value)
        slider.value = Float(currentValude)
        
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
    }
    
    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValude)
        let points = 100 - difference
        score += points

        
        let message = "The current value of the slider is: \(currentValude)"
                        + "\nThe target value is: \(targetValue)"
                        + "\nThe difference is: \(difference)"
                        + "\nYou scored \(points) points."
        
        let alert = UIAlertController (
            title: "Result",
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

