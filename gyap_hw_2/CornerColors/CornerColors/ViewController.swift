//
//  ViewController.swift
//  CornerColors
//
//  Created by Grant Yap on 9/12/20.
//  Copyright © 2020 Grant Yap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var color1: UIView!
    @IBOutlet weak var color2: UIView!
    @IBOutlet weak var color3: UIView!
    @IBOutlet weak var color4: UIView!
    
    var model1 = CornerColors()
    var model2 = CornerColors()
    var model3 = CornerColors()
    var model4 = CornerColors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        color1.backgroundColor = UIColor.red
        color2.backgroundColor = UIColor.black
        color3.backgroundColor = UIColor.green
        color4.backgroundColor = UIColor.blue
        model2.getColor()
        
        model3.getColor()
        model3.getColor()
        
        model4.getColor()
        model4.getColor()
        model4.getColor()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func ChangeColors(_ sender: Any) {
        color1.backgroundColor = model1.getColor()
        
        color2.backgroundColor = model2.getColor()
        
        color3.backgroundColor = model3.getColor()

        color4.backgroundColor = model4.getColor()

    }
    
}

