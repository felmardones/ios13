//
//  ResultsViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Felipe on 05-02-20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var BMI: String?
    var bgColor: UIColor?
    var advice: String?
    @IBOutlet weak var ibmLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor    = bgColor ?? UIColor.white
        adviceLabel.text        = advice
        ibmLabel.text   = BMI
        // Do any additional setup after loading the view.
    }
    @IBAction func recalculatePress(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
