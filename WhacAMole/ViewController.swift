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
    
    //mole image from: Icons made by <a href="https://www.flaticon.com/authors/darius-dan" title="Darius Dan">Darius Dan</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
    
    //hammer image from: Icons made by <a href="https://www.flaticon.com/authors/good-ware" title="Good Ware">Good Ware</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
    
    //whack image from: Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
    
    // MARK: - Constants and Variables
    var score: Int = 0
    var countdown: Int = 10
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerLabel.text = "\(countdown)"
        scoreLabel.text = "\(score)"
        
    }
    
    // MARK: - Methods
    
    func countdownClock() {
        if countdown > 0 {
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        } else if countdown == 0 {
            // alert view
        }
        
    }
    
    @objc func updateCounter() {
        if countdown > 0 {
            countdown -= 1
            timerLabel.text = "\(countdown)"
        }
    }
    
    // MARK: - Actions
    
    @IBAction func playButtonPressed(_ sender: Any) {
        countdownClock()
        playButton.isHidden = true
    }
    
    
    
    


}

