//
//  AddVC.swift
//  P2
//
//  Created by Grant Yap on 10/25/20.
//  Copyright © 2020 Grant Yap. All rights reserved.
//

import UIKit
import CoreData

class AddVC: UIViewController {
    
    @IBOutlet weak var TitleL: UILabel!
    
    @IBOutlet weak var PurposeL: UILabel!
    
    @IBOutlet weak var MileageL: UILabel!
    
    @IBOutlet weak var DurationL: UILabel!
    
    @IBOutlet weak var ContactL: UILabel!
    
    @IBOutlet weak var CancelBtn: UIButton!
    
    @IBOutlet weak var AddBtn: UIButton!
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var purposePicker: UIPickerView!
   
    @IBOutlet weak var mileageLabel: UILabel!
    @IBOutlet weak var mileageStepper: UIStepper!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var durationStepper: UIStepper!
    
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var contactStepper: UIStepper!
    
    var mileage = 0 {
        willSet {
            mileageLabel?.text = newValue.description
        }
    }
    var duration = 0 {
        willSet {
            durationLabel?.text = newValue.description
        }
    }
    var contact = 0 {
        willSet {
            contactLabel?.text = newValue.description
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TitleL.text = NSLocalizedString("Title", comment: "")
        PurposeL.text = NSLocalizedString("Purpose", comment: "")
        MileageL.text = NSLocalizedString("Mileage", comment: "")
        DurationL.text = NSLocalizedString("Duration", comment: "")
        ContactL.text = NSLocalizedString("Contacts", comment: "")
        CancelBtn.setTitle(NSLocalizedString("Cancel", comment: ""), for: .normal)
        AddBtn.setTitle(NSLocalizedString("Add", comment: ""), for: .normal)
        
        mileageStepper?.value = 10
        durationStepper?.value = 5
        contactStepper?.value = 2

        // Do any additional setup after loading the view.
    }
    @IBAction func onMileageChange(_ sender: UIStepper) {
        mileage = Int(sender.value)
    }
    @IBAction func onDurationChange(_ sender: UIStepper) {
        duration = Int(sender.value)
    }
    @IBAction func onContactChange(_ sender: UIStepper) {
        contact = Int(sender.value)
    }
    
    @IBAction func onCancel(_ sender: Any) {
        presentingViewController?.dismiss(animated: true)
    }
    @IBAction func onAdd(_ sender: Any) {
        let context = AppDelegate.cdContext
        if let title = titleField?.text {
             
            if let entity = NSEntityDescription.entity(forEntityName: "Item", in: context) {
                let item = NSManagedObject(entity: entity, insertInto: context)
                item.setValue(title, forKeyPath: "title")
                item.setValue(purposePicker.selectedRow(inComponent: 0), forKey: "purpose")
                item.setValue(Int(mileageStepper.value), forKey: "mileage")
                item.setValue(Int(durationStepper.value), forKey: "duration")
                item.setValue(Int(contactStepper.value), forKey: "contacts")

                do {
                    try context.save()
                } catch let error as NSError {
                    print("Could not save the item. \(error), \(error.userInfo)")
                }
            }
        }

        presentingViewController?.dismiss(animated: true)
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

extension AddVC: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return PurposeType.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return PurposeType(rawValue: row)?.title()
    }
    
    
}
