//
//  ViewController.swift
//  WhackAMole
//
//  Created by Dustin Mahone on 6/25/20.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var moleOne: UIImageView!
    @IBOutlet weak var moleTwo: UIImageView!
    @IBOutlet weak var moleThree: UIImageView!
    
    @IBOutlet weak var moleFour: UIImageView!
    @IBOutlet weak var moleFive: UIImageView!
    @IBOutlet weak var moleSix: UIImageView!
    
    @IBOutlet weak var moleSeven: UIImageView!
    @IBOutlet weak var moleEight: UIImageView!
    @IBOutlet weak var moleNine: UIImageView!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet var screenTapped: UITapGestureRecognizer!
    
    //mole image from: Icons made by <a href="https://www.flaticon.com/authors/darius-dan" title="Darius Dan">Darius Dan</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
    
    //hammer image from: Icons made by <a href="https://www.flaticon.com/authors/good-ware" title="Good Ware">Good Ware</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
    
    //whack image from: Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
    
    // MARK: - Constants and Variables
    var score: Int = 0
    var countdown: Int = 10
    var moleArray: [UIImageView] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerLabel.text = "\(countdown)"
        scoreLabel.text = "\(score)"
        
        moleArray = [moleOne, moleTwo, moleThree, moleFour, moleFive, moleSix, moleSeven, moleEight, moleNine]
        
        moleOne.addGestureRecognizer(screenTapped)
        moleTwo.addGestureRecognizer(screenTapped)
        moleThree.addGestureRecognizer(screenTapped)
        
        moleFour.addGestureRecognizer(screenTapped)
        moleFive.addGestureRecognizer(screenTapped)
        moleSix.addGestureRecognizer(screenTapped)
        
        moleSeven.addGestureRecognizer(screenTapped)
        moleEight.addGestureRecognizer(screenTapped)
        moleNine.addGestureRecognizer(screenTapped)
        
    }
    
    // MARK: - Methods
    
    func countdownClock() {
        if countdown > 0 {
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        } else if countdown == 0 {
            // alert view
        }
        
    }
    
    func randomMoles() {
        for mole in moleArray {
            let randomNumber = Int.random(in: 0 ... 10)
            if randomNumber > 2 {
                mole.isHidden = true
            } else {
                mole.isHidden = false
            }
        }
    }
    
    @objc func updateCounter() {
        if countdown > 0 {
            countdown -= 1
            timerLabel.text = "\(countdown)"
            randomMoles()
        }
    }
    
    // MARK: - Actions
    
    @IBAction func playButtonPressed(_ sender: Any) {
        scoreLabel.text = "0"
        randomMoles()
        countdownClock()
        playButton.isHidden = true
    }
    
}

