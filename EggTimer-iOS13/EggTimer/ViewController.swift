//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    var player : AVAudioPlayer?
    
    let eggTimes = [
        "Soft"      : 3,
        "Medium"    : 4800,
        "Hard"      : 720
    ]
    var t : Timer?
    
    var count : Int = 0
    var total : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.setProgress(0.0, animated: true)
        
        
    }
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        if count > 0{
            stopTime()
        }
        let hardness = sender.currentTitle!
        
        total = eggTimes[hardness]!
        
        startTime()
        
    }
    
    func startTime(){
        guard t == nil else { return }
        
        t = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    func stopTime(){
        t?.invalidate()
        t = nil
        count = 0
    }
    
    @objc func update(){
        if count < total{
            count = count + 1
            
            let percentege = Float(count) / Float(total)
            
            
            progressView.setProgress(Float(percentege), animated: true)
            
        }else{
            titleLabel.text = "Done!"
            t?.invalidate()
            t = nil
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")!
            
            do {
                player = try AVAudioPlayer(contentsOf: url)
                guard let player = player else { return }
                
                player.prepareToPlay()
                player.play()
                
            } catch let error as NSError {
                print(error.description)
            }
        }
    }
}
