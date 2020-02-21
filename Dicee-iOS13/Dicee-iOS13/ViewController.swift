//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let imgView = UIImageView()
    let container = UIView()
    let logo = UIImageView()
    let dice = UIImageView()
    let diceSecond = UIImageView()
    let btnRoll = UIButton()
    
    let dices = ["DiceOne","DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
    //or
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configureBackgroundView()
        configureLogoView()
        configureDiceView()

    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?){
        if motion == .motionShake {
            changeDices()
            //show some alert here
        }
    }
    
    private func configureBackgroundView(){
        
        imgView.frame           = view.bounds
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.clipsToBounds   = true
        imgView.contentMode     = .scaleAspectFill
        imgView.center          = view.center
        imgView.image           = #imageLiteral(resourceName: "GreenBackground")
        view.addSubview(imgView)
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0),
            imgView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0),
            imgView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0),
            imgView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0)
        ])
        
    }

    private func configureLogoView(){
        
        logo.image = #imageLiteral(resourceName: "DiceeLogo")
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.contentMode = .center
        logo.bounds = view.bounds
        view.addSubview(logo)

        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10.0),
            logo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0),
            logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0)
        
        ])
        
    }
    
    private func configureDiceView(){
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        dice.translatesAutoresizingMaskIntoConstraints = false
        diceSecond.translatesAutoresizingMaskIntoConstraints = false
        btnRoll.translatesAutoresizingMaskIntoConstraints = false

        container.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        container.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        container.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        
        dice.image = #imageLiteral(resourceName: "DiceSix")
        dice.contentMode = .center
        dice.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        diceSecond.image = #imageLiteral(resourceName: "DiceTwo")
        //or
        //diceSecond.image = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")][1]
        diceSecond.contentMode = .center
        diceSecond.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        container.addSubview(dice)
        container.addSubview(diceSecond)
        container.addSubview(btnRoll)
        btnRoll.addTarget(self, action: #selector(self.onTap), for: .touchDown)
        btnRoll.setTitle("Roll", for: .normal)
        btnRoll.backgroundColor = .systemRed
        NSLayoutConstraint.activate([
            dice.topAnchor.constraint(equalTo: container.topAnchor, constant: 0),
            dice.centerXAnchor.constraint(equalTo: container.centerXAnchor, constant: -100),
            diceSecond.topAnchor.constraint(equalTo: container.topAnchor, constant: 0),
            diceSecond.leftAnchor.constraint(equalTo: dice.rightAnchor, constant: 100 ),
            btnRoll.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -50),
            btnRoll.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            btnRoll.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.5)

        ])
    }
    
    @objc func onTap(_ sender: UIButton?){
        
        changeDices()
    }
    
    func changeDices(){
        let randomNumber = Int.random(in: 0...5)
        let randomNumeberTwo = Int.random(in: 0...5)
        
        dice.image = UIImage(named: dices[randomNumber])
        diceSecond.image = UIImage(named: dices[randomNumeberTwo])
    }
}

