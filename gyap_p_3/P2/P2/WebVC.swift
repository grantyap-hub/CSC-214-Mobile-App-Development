//
//  WebVC.swift
//  P2
//
//  Created by Grant Yap on 12/6/20.
//  Copyright © 2020 Grant Yap. All rights reserved.
//

import UIKit
import WebKit

class WebVC: UIViewController {

    @IBOutlet weak var ChampionImage: UIImageView!
   
    @IBOutlet weak var wbView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blue
        
        
        loadRequest(count: 2)
        
        ChampionImage.image = UIImage(named: "lol")
        
        ChampionImage.isUserInteractionEnabled = true
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        ChampionImage.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        ChampionImage.addGestureRecognizer(swipeLeft)
        
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        ChampionImage.addGestureRecognizer(swipeDown)
        
        

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func loadRequest(count: integer_t) {
        switch count {
        case 0:
            if let url = URL(string: "https://u.gg/lol/champions/tristana/build") {
                let request = URLRequest(url: url)
                wbView.load(request)
            }
        case 1:
            if let url = URL(string: "https://u.gg/lol/champions/aatrox/build") {
                let request = URLRequest(url: url)
                wbView.load(request)
            }
        case 2:
            if let url = URL(string: "https://u.gg/lol/champions/velkoz/build") {
                let request = URLRequest(url: url)
                wbView.load(request)
            }
        default:
            break
        }
    }
    
    @objc func swipeGesture(sendr: UISwipeGestureRecognizer?) {
        if let swipeGesture = sendr {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                ChampionImage.image = UIImage(named: "trist")
                loadRequest(count: 0)
            case UISwipeGestureRecognizer.Direction.right:
                ChampionImage.image = UIImage(named: "aatrox")
                loadRequest(count: 1)
            case UISwipeGestureRecognizer.Direction.down:
                ChampionImage.image = UIImage(named: "vel")
                loadRequest(count: 2)
            default: break
            }
        }
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
