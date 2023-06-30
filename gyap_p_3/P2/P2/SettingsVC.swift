//
//  SettingsVC.swift
//  P2
//
//  Created by Grant Yap on 12/6/20.
//  Copyright © 2020 Grant Yap. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet weak var BlueL: UILabel!
    @IBOutlet weak var RedL: UILabel!
    @IBOutlet weak var GreenL: UILabel!
    @IBOutlet weak var PurpleL: UILabel!
    @IBOutlet weak var YellowL: UILabel!
    @IBOutlet weak var PinkL: UILabel!
    
    @IBOutlet weak var BlueBtn: UIButton!
    @IBOutlet weak var RedBtn: UIButton!
    @IBOutlet weak var GreenBtn: UIButton!
    @IBOutlet weak var PurpleBtn: UIButton!
    @IBOutlet weak var YellowBtn: UIButton!
    @IBOutlet weak var PinkBtn: UIButton!
    
    
    
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.purple

        BlueL.text = NSLocalizedString("Blue", comment: "")
        RedL.text = NSLocalizedString("Red", comment: "")
        GreenL.text = NSLocalizedString("Green", comment: "")
        PurpleL.text = NSLocalizedString("Purple", comment: "")
        YellowL.text = NSLocalizedString("Yellow", comment: "")
        PinkL.text = NSLocalizedString("Pink", comment: "")

        BlueBtn.setTitle("Button", for: .normal)
        RedBtn.setTitle("Button", for: .normal)
        GreenBtn.setTitle("Button", for: .normal)
        PurpleBtn.setTitle("Button", for: .normal)
        YellowBtn.setTitle("Button", for: .normal)
        PinkBtn.setTitle("Button", for: .normal)

        
        
        
        defaults.set(UIColor.yellow, forKey: "yellow")
        defaults.set(UIColor.blue, forKey: "blue")
        defaults.set(UIColor.purple, forKey: "purple")
        defaults.set(UIColor.green, forKey: "green")
        defaults.set(UIColor.red, forKey: "red")
        defaults.set(UIColor.systemPink, forKey: "pink")

        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onBlue(_ sender: UIButton) {
        view.backgroundColor = defaults.color(forKey: "blue")
    }
    @IBAction func onRed(_ sender: UIButton) {
        view.backgroundColor = defaults.color(forKey: "red")
    }
    @IBAction func onGreen(_ sender: UIButton) {
        view.backgroundColor = defaults.color(forKey: "green")
    }
    @IBAction func onPurple(_ sender: UIButton) {
        view.backgroundColor = defaults.color(forKey: "purple")
    }
    
    @IBAction func onYellow(_ sender: UIButton) {
        view.backgroundColor = defaults.color(forKey: "yellow")
    }
    
    @IBAction func onPink(_ sender: UIButton) {
        view.backgroundColor = defaults.color(forKey: "pink")
    }
    

    override func viewWillAppear(_ animated: Bool) {
    }
}

extension UserDefaults {
    func set(_ color: UIColor, forKey key: String) {
        if let data = try? NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false){
            self.set(data, forKey: key)
        }
    }
    
    func color(forKey key: String) -> UIColor? {
        if let data = object(forKey: key) as? Data {
            if let color = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? UIColor {
                return color
            }
        }
        return nil
    }
}


