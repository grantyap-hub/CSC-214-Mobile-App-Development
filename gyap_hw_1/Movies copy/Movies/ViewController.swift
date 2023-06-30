//
//  ViewController.swift
//  Movies
//
//  Created by Grant Yap on 9/5/20.
//  Copyright © 2020 Grant Yap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let model = Movies()

    @IBOutlet weak var MovieLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        MovieLabel.text = "Apocalypse Now"
    }
    
    

    @IBAction func nextButton(_ sender: Any) {
        MovieLabel.text = model.getMovie()
    }
    
}

