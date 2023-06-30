//
//  TableViewController.swift
//  EuroToday
//
//  Created by Grant Yap on 11/22/20.
//  Copyright © 2020 Grant Yap. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    let exchangeHelper = ExchangeHelper()
    var codes: [String] = []
    let count = 0
    var exchangeInfo: ExchangeInfo? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        OperationQueue.main.addOperation(){
            if let rates = self.exchangeInfo?.rates {
                self.codes = Array(rates.keys)
                print(rates)
            }
            self.tableView.reloadData()
        }
    }
    var bool = true
    
    @IBAction func Toggle(_ sender: UIBarButtonItem) {
                if bool == true {
                    codes.sort(by: >)
                    bool = false
                } else {
                    codes.sort(by: <)
                    bool = true
                }
                self.tableView.reloadData()
    }
    
    func loadRequest() {
        exchangeHelper.fetchRates() { result in
            switch result {
            case let .Success(exchange):
                self.exchangeInfo = exchange
            case let .Failure(error):
                self.exchangeInfo = ExchangeInfo()
                print("Error: \(error)")
            }
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Euro Today", comment: "")
        loadRequest()
        

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
        return codes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

         guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? TableViewCell else {
                    fatalError("Expected UITableViewCell")
                }
        
        let dateformat = DateFormatter()
        let formatter = NumberFormatter()
        dateformat.dateStyle = .short
        dateformat.timeStyle = .short
        
        cell.LeadingIndexLabel?.text = formatter.string(from: NSNumber(value: indexPath.row + 1))
        cell.LocalizedDateLabel?.text = dateformat.string(from: Date())
        cell.CurrencyCodeLabel?.text = codes[indexPath.row]
        cell.CurrencyValueLabel?.text = formatter.currency(with: (exchangeInfo?.rates?[codes[indexPath.row]])!, code: codes[indexPath.row])
        
    

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
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
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


