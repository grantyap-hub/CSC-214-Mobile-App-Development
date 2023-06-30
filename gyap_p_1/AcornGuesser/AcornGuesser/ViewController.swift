//
//  ViewController.swift
//  Project 1
//
//  Created by Grant Yap on 9/27/20.
//  Copyright © 2020 Grant Yap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var AcornImage: UIImageView!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var scoreL: UILabel!
    @IBOutlet weak var ClosenessLabel: UILabel!
    @IBOutlet weak var closeness: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    
    let acornFinder = AcornGuesser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton?.setTitle(NSLocalizedString("Start", comment: ""), for: .normal)
        ScoreLabel?.text = NSLocalizedString("Score", comment: "")
        scoreL?.text = String(describing: acornFinder.score)
        ClosenessLabel?.text = NSLocalizedString("Closeness", comment: "")
        closeness?.text = String(describing: acornFinder.close)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        acornFinder.gameOver = true
        handleGameOver()
    }
    
    override var prefersStatusBarHidden: Bool { return true }
    
    func handleGameOver(){
        AcornImage?.isHidden = false
        startButton?.isHidden = false
    }
    
   
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        if acornFinder.gameOver {return}
        
        let point = sender.location(in: self.view)
        let (gameOver, score, backgroundColor, close) = acornFinder.tryLocation(point)
        view.backgroundColor = backgroundColor
        scoreL?.text = String(describing: score)
        closeness?.text = String(describing: close)
        if gameOver == true {
            handleGameOver()
        }
    }
    @IBAction func Start(_ sender: UIButton) {
        view.backgroundColor = .yellow
        acornFinder.startGame(with: self.view.frame, acornSize: AcornImage?.frame.size ?? CGSize.zero)
        AcornImage?.center = acornFinder.secretLocation
        AcornImage?.isHidden = true
        startButton?.isHidden = true
    }
    
}

