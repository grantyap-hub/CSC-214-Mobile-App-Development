//
//  EditVC.swift
//  Word
//
//  Created by Grant Yap on 11/1/20.
//  Copyright © 2020 Grant Yap. All rights reserved.
//

import UIKit
import CoreData

class EditVC: UIViewController {
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCancel(_ sender: Any) {
        presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func onAdd(_ sender: Any) {
        let context = AppDelegate.cdContext
        if let title = titleField?.text, let password = passwordField?.text {
            if let entity = NSEntityDescription.entity(forEntityName: "Entity", in: context) {
                       let item = NSManagedObject(entity: entity, insertInto: context)
                       item.setValue(title, forKeyPath: "title")
                       item.setValue(password, forKey: "password")
                       do{
                           try context.save()
                       } catch let error as NSError {
                           print("Could not save the item. \(error), \(error.userInfo)")
                       }
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
