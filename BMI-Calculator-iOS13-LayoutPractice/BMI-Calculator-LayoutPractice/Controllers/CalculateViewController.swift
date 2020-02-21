//
//  ViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculate: CalculateBrain?
    var valueToSend     = ""
    var adviceToSend    = ""
    var colorToSend     = UIColor.white
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let bmi = BMI()
        calculate = CalculateBrain(bmi: bmi)
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        heightLabel.text    = "\(String(format: "%.2f", sender.value))m"
    }
    
    @IBAction func heightSlider(_ sender: UISlider) {
        weightLabel.text    = "\(Int(sender.value))Kg"
    }
    
    @IBAction func btnCalculate(_ sender: UIButton) {
        guard var calculate = calculate else { return }
        valueToSend     = calculate.calculateBmi(height: heightSlider.value, weight: weightSlider.value)
        adviceToSend    = calculate.getAdvice()!
        colorToSend     = calculate.getColor()!
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC                       = segue.destination as! ResultsViewController
            destinationVC.BMI                       = valueToSend
            destinationVC.bgColor                   = colorToSend
            destinationVC.advice                    = adviceToSend
        }
    }
}

