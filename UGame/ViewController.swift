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
        
        // Do any additional setup after loading the view.
        
        startNewGame()
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
        var points = 100 - difference
        
        
        let title: String
        if difference == 0 {
            title = "Perfect"
            points += 100
        } else if difference < 5 {
            title = "Pretty close"
            points += 50
        } else if difference < 10 {
            title = "Not too bad"
        } else {
            title = "Not even close"
        }
        
        score += points
        let message = "\nThe target value was \(targetValue)."
                        + "\nYou placed the slider at \(currentValude)."
                        + "\nYou scored \(points) points."
        
        let alert = UIAlertController (
            
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "Dismiss",
            style: .default,
            handler: { _ in
                self.startNewRound()
            })

        alert.addAction(action)
        present(alert, animated: true, completion: nil)
                
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValude = lroundf(slider.value)
    }
    
    
    @IBAction func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
}

