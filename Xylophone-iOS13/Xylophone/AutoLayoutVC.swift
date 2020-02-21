//
//  AutoLayoutVC.swift
//  Xylophone
//
//  Created by Felipe on 19-01-20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class AutoLayoutVC: UIViewController {
    
    var player  : AVAudioPlayer?
    
    let stack   = UIStackView()
    let aView   = UIView()
    let bView   = UIView()
    let cView   = UIView()
    let dView   = UIView()
    let eView   = UIView()
    let fView   = UIView()
    let gView   = UIView()
    let aBtn    = UIButton()
    let bBtn    = UIButton()
    let cBtn    = UIButton()
    let dBtn    = UIButton()
    let eBtn    = UIButton()
    let fBtn    = UIButton()
    let gBtn    = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        // Do any additional setup after loading the view.
    }
    
    
    private func configureLayout(){
        
        
        
        view.addSubview(stack)
        stack.axis          = .vertical
        stack.distribution  = .fillEqually
        stack.alignment     = .fill
        stack.spacing       = 8
        stack.contentMode   = .scaleToFill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.autoresizingMask  = [.flexibleWidth, .flexibleHeight]
        
        stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive     = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive     = true
        stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive     = true
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive     = true
        
        stack.addArrangedSubview(cView)
        stack.addArrangedSubview(dView)
        stack.addArrangedSubview(eView)
        stack.addArrangedSubview(fView)
        stack.addArrangedSubview(gView)
        stack.addArrangedSubview(aView)
        stack.addArrangedSubview(bView)
        
        
        cView.addSubview(cBtn)
        dView.addSubview(dBtn)
        eView.addSubview(eBtn)
        fView.addSubview(fBtn)
        gView.addSubview(gBtn)
        aView.addSubview(aBtn)
        bView.addSubview(bBtn)
        
        aBtn.tag    =   1
        bBtn.tag    =   2
        cBtn.tag    =   3
        dBtn.tag    =   4
        eBtn.tag    =   5
        fBtn.tag    =   6
        gBtn.tag    =   7
        
        aBtn.translatesAutoresizingMaskIntoConstraints = false
        bBtn.translatesAutoresizingMaskIntoConstraints = false
        cBtn.translatesAutoresizingMaskIntoConstraints = false
        dBtn.translatesAutoresizingMaskIntoConstraints = false
        eBtn.translatesAutoresizingMaskIntoConstraints = false
        fBtn.translatesAutoresizingMaskIntoConstraints = false
        gBtn.translatesAutoresizingMaskIntoConstraints = false
        
        aBtn.backgroundColor    =   .systemPurple
        bBtn.backgroundColor    =   .systemRed
        cBtn.backgroundColor    =   .systemBlue
        dBtn.backgroundColor    =   .systemGreen
        eBtn.backgroundColor    =   .systemYellow
        fBtn.backgroundColor    =   .systemTeal
        gBtn.backgroundColor    =   .systemPink
        
        
        aBtn.addTarget(self, action: #selector(pushKey(_:)), for: .touchDown)
        bBtn.addTarget(self, action: #selector(pushKey(_:)), for: .touchDown)
        cBtn.addTarget(self, action: #selector(pushKey(_:)), for: .touchDown)
        dBtn.addTarget(self, action: #selector(pushKey(_:)), for: .touchDown)
        eBtn.addTarget(self, action: #selector(pushKey(_:)), for: .touchDown)
        fBtn.addTarget(self, action: #selector(pushKey(_:)), for: .touchDown)
        gBtn.addTarget(self, action: #selector(pushKey(_:)), for: .touchDown)

        bBtn.leadingAnchor.constraint(equalTo: bView.leadingAnchor, constant: 40).isActive  = true
        bBtn.trailingAnchor.constraint(equalTo: bView.trailingAnchor, constant: -40).isActive  = true
        bBtn.topAnchor.constraint(equalTo: bView.topAnchor, constant: 0).isActive  = true
        bBtn.bottomAnchor.constraint(equalTo: bView.bottomAnchor, constant: 0).isActive  = true
        
        aBtn.leadingAnchor.constraint(equalTo: aView.leadingAnchor, constant: 35).isActive  = true
        aBtn.trailingAnchor.constraint(equalTo: aView.trailingAnchor, constant: -35).isActive  = true
        aBtn.topAnchor.constraint(equalTo: aView.topAnchor, constant: 0).isActive  = true
        aBtn.bottomAnchor.constraint(equalTo: aView.bottomAnchor, constant: 0).isActive  = true
        
        
        gBtn.leadingAnchor.constraint(equalTo: gView.leadingAnchor, constant: 30).isActive  = true
        gBtn.trailingAnchor.constraint(equalTo: gView.trailingAnchor, constant: -30).isActive  = true
        gBtn.topAnchor.constraint(equalTo: gView.topAnchor, constant: 0).isActive  = true
        gBtn.bottomAnchor.constraint(equalTo: gView.bottomAnchor, constant: 0).isActive  = true
        
        fBtn.leadingAnchor.constraint(equalTo: fView.leadingAnchor, constant: 25).isActive  = true
        fBtn.trailingAnchor.constraint(equalTo: fView.trailingAnchor, constant: -25).isActive  = true
        fBtn.topAnchor.constraint(equalTo: fView.topAnchor, constant: 0).isActive  = true
        fBtn.bottomAnchor.constraint(equalTo: fView.bottomAnchor, constant: 0).isActive  = true
        
        eBtn.leadingAnchor.constraint(equalTo: eView.leadingAnchor, constant: 20).isActive  = true
        eBtn.trailingAnchor.constraint(equalTo: eView.trailingAnchor, constant: -20).isActive  = true
        eBtn.topAnchor.constraint(equalTo: eView.topAnchor, constant: 0).isActive  = true
        eBtn.bottomAnchor.constraint(equalTo: eView.bottomAnchor, constant: 0).isActive  = true
        
        dBtn.leadingAnchor.constraint(equalTo: dView.leadingAnchor, constant: 15).isActive  = true
        dBtn.trailingAnchor.constraint(equalTo: dView.trailingAnchor, constant: -15).isActive  = true
        dBtn.topAnchor.constraint(equalTo: dView.topAnchor, constant: 0).isActive  = true
        dBtn.bottomAnchor.constraint(equalTo: dView.bottomAnchor, constant: 0).isActive  = true
        
        cBtn.leadingAnchor.constraint(equalTo: cView.leadingAnchor, constant: 10).isActive  = true
        cBtn.trailingAnchor.constraint(equalTo: cView.trailingAnchor, constant: -10).isActive  = true
        cBtn.topAnchor.constraint(equalTo: cView.topAnchor, constant: 0).isActive  = true
        cBtn.bottomAnchor.constraint(equalTo: cView.bottomAnchor, constant: 0).isActive  = true
    }
    
    
    @objc func pushKey(_ sender: UIButton){
        
        sender.alpha = 0.5

        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
//        OR:
//        let animateOpacity = CABasicAnimation(keyPath: "opacity")
//        let animateOpa     = CASpringAnimation(keyPath: "opacity")
//        animateOpa.fromValue    = 1
//        animateOpa.toValue      = 0
//        animateOpa.damping      = 10
//
//        animateOpacity.duration     =   0.1
//        sender.layer.add(animateOpa, forKey: "buttonPress")
        switch sender.tag {
        case 1:
            playSound("A")
        case 2:
            playSound("B")
        case 3:
            playSound("C")
        case 4:
            playSound("D")
        case 5:
            playSound("E")
        case 6:
            playSound("F")
        case 7:
            playSound("G")
        default:
            print("some error")
        }
    }
    
    func playSound(_ keySound : String) {
        
        let url = Bundle.main.url(forResource: "\(keySound)", withExtension: "wav")!

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
