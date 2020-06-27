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
    @IBOutlet weak var highScoreLabel: UILabel!
    
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
    
    @IBOutlet var moleOneTapGR: UITapGestureRecognizer!
    @IBOutlet var moleTwoTapGR: UITapGestureRecognizer!
    @IBOutlet var moleThreeTapGR: UITapGestureRecognizer!
    
    
    //mole image from: Icons made by <a href="https://www.flaticon.com/authors/darius-dan" title="Darius Dan">Darius Dan</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
    
    //hammer image from: Icons made by <a href="https://www.flaticon.com/authors/good-ware" title="Good Ware">Good Ware</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
    
    //whack image from: Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
    
    // MARK: - Constants and Variables
    let defaults = UserDefaults.standard
    var score: Int = 0
    var highScore: Int?
    var countdown: Int = 10
    var moleArray: [UIImageView] = []
    var isGameActive = false
    var gameTimer: Timer?
    
    // MARK: - Lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        let topScore = defaults.integer(forKey: "highScore")
        highScore = topScore
        highScoreLabel.text = "\(highScore!)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerLabel.text = "\(countdown)"
        scoreLabel.text = "\(score)"
        
        moleArray = [moleOne, moleTwo, moleThree, moleFour, moleFive, moleSix, moleSeven, moleEight, moleNine]
        
        var tapGestureRecognizer: UITapGestureRecognizer {
            get {
                return UITapGestureRecognizer(target: self, action: #selector(self.didTapScreen(sender:)))
            }
        }
        
        moleOne.addGestureRecognizer(tapGestureRecognizer)
        moleTwo.addGestureRecognizer(tapGestureRecognizer)
        moleThree.addGestureRecognizer(tapGestureRecognizer)
        
        moleFour.addGestureRecognizer(tapGestureRecognizer)
        moleFive.addGestureRecognizer(tapGestureRecognizer)
        moleSix.addGestureRecognizer(tapGestureRecognizer)
        
        moleSeven.addGestureRecognizer(tapGestureRecognizer)
        moleEight.addGestureRecognizer(tapGestureRecognizer)
        moleNine.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    // MARK: - Methods
    
    func countdownClock() {
        if countdown > 0 {
            gameTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        }
    }
    
    func randomMoles() {
        for mole in moleArray {
            let randomNumber = Int.random(in: 0 ... 10)
            if randomNumber > 2 {
                mole.image = nil
            } else {
                mole.image = UIImage(named: "mole.pdf")
                mole.isHidden = false
            }
        }
    }
    
    @objc func updateCounter() {
        if countdown > 0 {
            countdown -= 1
            timerLabel.text = "\(countdown)"
            randomMoles()
        } else {
            gameTimer?.invalidate()
            isGameActive = false
            playButton.isHidden = false
            showAlert()
            
        }
    }
    
    @objc func didTapScreen(sender: UITapGestureRecognizer) {
        guard isGameActive else { return }
        
        if let tappedMole:UIImageView = sender.view as? UIImageView {
            if tappedMole.image == nil {
                tappedMole.image = UIImage(named: "hammer")
            } else {
                tappedMole.image = UIImage(named: "boom")
                score += 1
                scoreLabel.text = "\(score)"
            }
            
        }
    }
    
    func showAlert() {
        var message: String = ""
        if score > highScore! {
            message = "You set a new high score"
            defaults.set(score, forKey: "highScore")
        } else if score == highScore! {
            message = "You tied your best score"
        } else {
            message = "Try again"
        }
        
        let alertController = UIAlertController(title: "Game Over", message:
            "\(message)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        playButton.isHidden = false
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Actions
    
    @IBAction func playButtonPressed(_ sender: Any) {
        scoreLabel.text = "0"
        randomMoles()
        countdownClock()
        playButton.isHidden = true
        isGameActive = true
    }
    
}

