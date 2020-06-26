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
    
    //mole image from: Icons made by <a href="https://www.flaticon.com/authors/darius-dan" title="Darius Dan">Darius Dan</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
    
    //hammer image from: Icons made by <a href="https://www.flaticon.com/authors/good-ware" title="Good Ware">Good Ware</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
    
    //boom image from: Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
    
    // MARK: - Constants and Variables
    var score: Int = 0
    var countdown: Int = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerLabel.text = "\(countdown)"
        scoreLabel.text = "\(score)"
        
    }
    
    func countdownClock() {
        
    }
    


}

