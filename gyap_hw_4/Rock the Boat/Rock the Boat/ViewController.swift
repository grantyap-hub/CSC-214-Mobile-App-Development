//
//  ViewController.swift
//  Rock the Boat
//
//  Created by Grant Yap on 10/11/20.
//  Copyright © 2020 Grant Yap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnsBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var startbtn: UIButton!
    @IBOutlet weak var resetbtn: UIButton!
    
    
    @IBOutlet weak var BoatImg: UIImageView!
    
    let rtbModel = RTBModel()
    var animationCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startbtn.setTitle(NSLocalizedString("Start", comment: ""), for: .normal)
        resetbtn.setTitle(NSLocalizedString("Reset", comment: ""), for: .normal)
        OnReset(self)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 2.4, animations: {
            self.BoatImg?.alpha = 1.0
        })
    }
    
    func shakeAnimation(){
        self.BoatImg?.alpha = 1.0
        UIView.animate(withDuration: 0.7, animations: {
            //self.BoatImg?.rotate(by: -Double.pi / 8, with: CGPoint(x: -0.5, y: 0.5))
            self.BoatImg?.rotate(by: Double.pi/8, with: CGPoint(x: -0.5, y: 0.5))
        }, completion: { _ in
            UIView.animate(withDuration: 0.7, animations: {
                self.BoatImg?.rotate(by: -Double.pi / 4, with: CGPoint(x: -0.5, y: 0.5))
            }, completion: { _ in
                UIView.animate(withDuration: 0.7, animations: {
                    self.BoatImg?.rotate(by: 0.0, with: CGPoint(x: -0.5, y: 0.5))
                }, completion: { _ in
                    self.animationCount -= 1
                    if self.animationCount > 0 {
                        self.shakeAnimation()
                    } else {
                        self.showButtons(true)
                    }
                    
                })
            })
        })
        
    }
       
    func showButtons(_ show: Bool){
        let delay = show ? 1.4 : 0.0
        let yPos = show ? self.view.frame.height : -self.view.frame.height
        UIView.animate(withDuration: 1.2, delay: delay, options: [.curveEaseInOut], animations: {
            self.btnsBottomConstraint?.constant += yPos
            self.view.layoutIfNeeded()
        })
    }
    
    
    
    @IBAction func OnStart(_ sender: UIButton) {
        animationCount = 3;
        shakeAnimation()
        showButtons(false)
    }
    
    @IBAction func OnReset(_ sender: Any) {
        BoatImg?.alpha = 0.1
        UIView.animate(withDuration: 2.4, animations: {
            self.BoatImg?.alpha = 1.0
        })
    }
    

}

