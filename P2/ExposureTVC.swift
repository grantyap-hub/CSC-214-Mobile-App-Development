//
//  ExposureTVC.swift
//  P2
//
//  Created by Grant Yap on 10/25/20.
//  Copyright © 2020 Grant Yap. All rights reserved.
//

import UIKit
import CoreData

class ExposureTVC: UITableViewController {
    
    @IBOutlet weak var StatBtn: UIBarButtonItem!
    var diary: [NSManagedObject] = []
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String
        
        
        readData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return diary.count
    }
    
    
        
    func deletionAlert(title: String, completion: @escaping (UIAlertAction) -> Void) {
        
        let alertMsg = "Are you sure you want to delete \(title)? This cannot be undone!"
        let alert = UIAlertController(title: "Warning", message: alertMsg, preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: completion)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:nil)
        
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        
        alert.popoverPresentationController?.permittedArrowDirections = []
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: 0, height: 0)
        
        present(alert, animated: true, completion: nil)
    }
        
    func readData() {
        let context = AppDelegate.cdContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Item")
        do {
            diary = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch requested item. \(error), \(error.userInfo)")
        }
        tableView.reloadData()
    }
    
    func deleteItem(item: Item) {
        let context = AppDelegate.cdContext
        if let _ = diary.firstIndex(of: item)  {
            context.delete(item)
            do {
                try context.save()
            } catch let error as NSError {
                print("Could not delete the item. \(error), \(error.userInfo)")
            }
        }
        readData()
    }
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue){
        readData()
        tableView.reloadData()
    }
        
    @IBAction func onBtn(_ sender: UIBarButtonItem) {
        setEditing(!isEditing, animated:true)
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let item = diary[indexPath.row] as? Item, let title = item.title {
                deletionAlert(title:title) { _ in
                    self.deleteItem(item: item)
                }
            }
    }
        
    
    }
    
    
    @IBAction func onStart(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: NSLocalizedString("Welcome!", comment: ""), message: NSLocalizedString("This app let's you track what you do on common visits, whether exercising, visiting somewhere, or running an errand, please enjoy!", comment: ""), preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("Close", comment: ""), style: .cancel)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryCell", for: indexPath) as? DiaryCell else {
            fatalError("Expected DiaryCell")
        }
        
        if let item = diary[indexPath.row] as? Item {
            cell.update(with: item)
        }
        
//        let item = diary[indexPath.row]
//        cell.textLabel?.text = item.value(forKeyPath: "title") as? String
//
//        if let type = item.value(forKey: "type") as? Int {
//            cell.imageView?.image = PurposeType(rawValue: type)?.image()
//        }

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    

    
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
