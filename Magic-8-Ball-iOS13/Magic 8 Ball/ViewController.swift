//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let ballArray = [#imageLiteral(resourceName: "ball3"),#imageLiteral(resourceName: "ball3"),#imageLiteral(resourceName: "ball1"),#imageLiteral(resourceName: "ball5"),#imageLiteral(resourceName: "ball3")]
    let titleView   = UILabel()
    let imgBall     = UIImageView()
    let btnBall     = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?){
        if motion == .motionShake {
            changeImageBall()
            //show some alert here
        }
    }
    private func configureView(){
        titleView.text  = "Ask me anything"
        imgBall.image   = #imageLiteral(resourceName: "ball4")
        btnBall.setTitle("The answer is...", for: .normal)
        btnBall.setTitleColor(.systemRed, for: .normal)
        titleView.translatesAutoresizingMaskIntoConstraints = false
        imgBall.translatesAutoresizingMaskIntoConstraints = false
        btnBall.translatesAutoresizingMaskIntoConstraints = false
        btnBall.addTarget(self, action: #selector(answerBall), for: .touchDown)
        view.addSubview(titleView)
        view.addSubview(imgBall)
        view.addSubview(btnBall)
        
        NSLayoutConstraint.activate([
            titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            imgBall.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 100),
            imgBall.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnBall.topAnchor.constraint(equalTo: imgBall.bottomAnchor, constant: 50),
            btnBall.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func answerBall(){
        changeImageBall()
    }
    
    private func changeImageBall(){
        imgBall.image = ballArray[Int.random(in: 0...4)]
    }

}

