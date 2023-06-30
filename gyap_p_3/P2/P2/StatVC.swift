//
//  StatVC.swift
//  P2
//
//  Created by Grant Yap on 10/25/20.
//  Copyright © 2020 Grant Yap. All rights reserved.
//

import UIKit
import CoreData

class StatVC: UIViewController {
    
    var animationCount = 0
  
    @IBOutlet weak var TotalMileageL: UILabel!
    
    @IBOutlet weak var TotalDurationL: UILabel!
    
    @IBOutlet weak var TotalContactsL: UILabel!
    
    @IBOutlet weak var TotalMileage: UILabel!
    
    @IBOutlet weak var TotalDuration: UILabel!
    
    @IBOutlet weak var TotalContacts: UILabel!
    @IBOutlet weak var BackBtn: UIButton!
    
    @IBOutlet weak var StatBtn: UIButton!
    
    @IBOutlet weak var ChampionImage: UIImageView!
    
    var diary2: [NSManagedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        shakeAnimation()
        readData()
        
        view.backgroundColor = UIColor.yellow
        
        
        TotalMileageL.text = NSLocalizedString("Total Kills", comment: "")
        TotalDurationL.text = NSLocalizedString("Total Deaths", comment: "")
        TotalContactsL.text = NSLocalizedString("Total Assists", comment: "")
        TotalMileage.text = "0"
        TotalDuration.text = "0"
        TotalContacts.text = "0"
        BackBtn.setTitle(NSLocalizedString("Back", comment: ""), for: .normal)
        StatBtn.setTitle(NSLocalizedString("Stat", comment: ""), for: .normal)
        
        
        //image gesture stuff
        ChampionImage.image = UIImage(named: "vel")
        
        ChampionImage.isUserInteractionEnabled = true
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        ChampionImage.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        ChampionImage.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        ChampionImage.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        ChampionImage.addGestureRecognizer(swipeDown)
        // Do any additional setup after loading the view.
    }
    
    func readData() {
        let context = AppDelegate.cdContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Item")
        do {
            diary2 = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch requested item. \(error), \(error.userInfo)")
        }

    }
    
    func gettotalMileage() ->Int{
        var mileage = 0

        for n in diary2 {
            mileage += n.value(forKey: "mileage") as! Int
        }
         return mileage
    }
    
    func getTotalDuration() -> Int {
        var duration = 0
        for n in diary2 {
            duration += n.value(forKey: "duration") as! Int
        }
        return duration
    }
    
    func getTotalContact() -> Int {
        var contact = 0
        for n in diary2 {
            contact += n.value(forKey: "contacts") as! Int
        }
        return contact
    }
    
    func shakeAnimation(){
        
        
        self.ChampionImage?.alpha = 1.0
        UIView.animate(withDuration: 0.7, animations: {
            //self.BoatImg?.rotate(by: -Double.pi / 8, with: CGPoint(x: -0.5, y: 0.5))
            self.ChampionImage?.rotate(by: Double.pi/8, with: CGPoint(x: -0.5, y: 0.5))
        }, completion: { _ in
            UIView.animate(withDuration: 0.7, animations: {
                self.ChampionImage?.rotate(by: -Double.pi / 4, with: CGPoint(x: -0.5, y: 0.5))
            }, completion: { _ in
                UIView.animate(withDuration: 0.7, animations: {
                    self.ChampionImage?.rotate(by: 0.0, with: CGPoint(x: -0.5, y: 0.5))
                }, completion: { _ in
                    self.animationCount -= 1
                    if self.animationCount > 0 {
                        self.shakeAnimation()
                    } else {
                        //self.showButtons(true)
                    }
                    
                })
            })
        })
        
    }
   
    //transitions on top of fade animation
    func fade() {
        ChampionImage?.alpha = 0.1
        UIView.animate(withDuration: 2.4, animations: {
            self.ChampionImage?.alpha = 1.0
        })
       UIView.transition(
           with: ChampionImage,
           duration: 0.8,
           options: [.transitionFlipFromLeft],
           animations: {
            self.ChampionImage
       })
        Timer.scheduledTimer(withTimeInterval: 1.2, repeats: false, block: { _ in
            UIView.transition(
                with: self.ChampionImage,
                duration: 0.4,
                options: [.transitionFlipFromRight],
                animations: {
                    self.ChampionImage
            })
        })
    }
    
    //gesture stuff
    @objc func swipeGesture(sendr: UISwipeGestureRecognizer?) {
        if let swipeGesture = sendr {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                ChampionImage.image = UIImage(named: "vel")
            case UISwipeGestureRecognizer.Direction.left:
                ChampionImage.image = UIImage(named: "trist")
            case UISwipeGestureRecognizer.Direction.up:
                ChampionImage.image = UIImage(named: "aatrox")
            case UISwipeGestureRecognizer.Direction.down:
                ChampionImage.image = UIImage(named: "vel")
            default: break
            }
        }
        
    }
    
    
    @IBAction func onStat(_ sender: UIButton) {
        fade()
        TotalMileage.text = gettotalMileage().description
        TotalDuration.text = getTotalDuration().description
        TotalContacts.text = getTotalContact().description

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
