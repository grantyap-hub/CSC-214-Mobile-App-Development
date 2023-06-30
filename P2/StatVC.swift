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
  
    @IBOutlet weak var TotalMileageL: UILabel!
    
    @IBOutlet weak var TotalDurationL: UILabel!
    
    @IBOutlet weak var TotalContactsL: UILabel!
    
    @IBOutlet weak var TotalMileage: UILabel!
    
    @IBOutlet weak var TotalDuration: UILabel!
    
    @IBOutlet weak var TotalContacts: UILabel!
    @IBOutlet weak var BackBtn: UIButton!
    
    @IBOutlet weak var StatBtn: UIButton!
    
    var diary2: [NSManagedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        readData()
        TotalMileageL.text = NSLocalizedString("Total Mileage", comment: "")
        TotalDurationL.text = NSLocalizedString("Total Duration", comment: "")
        TotalContactsL.text = NSLocalizedString("Total Contacts", comment: "")
        TotalMileage.text = "0"
        TotalDuration.text = "0"
        TotalContacts.text = "0"
        BackBtn.setTitle(NSLocalizedString("Back", comment: ""), for: .normal)
        StatBtn.setTitle(NSLocalizedString("Stat", comment: ""), for: .normal)
        
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
    
    
    @IBAction func onStat(_ sender: UIButton) {
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
