//
//  driverTableViewController.swift
//  TaxiApp
//
//  Created by Jing Wei Nicholas Lim on 3/26/19.
//  Copyright © 2019 Jing Wei Nicholas Lim. All rights reserved.
//

import UIKit
import os.log

class driverTableViewController: UITableViewController {
    
    var drivers = [driver]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        navigationItem.leftBarButtonItem = editButtonItem
        
        loadSamples()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return drivers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "driverCellIdentifier", for: indexPath) as? driverTableViewCell else {
            fatalError("Did not provide correct reuse identifer")
        }
        let driver = drivers[indexPath.row]

        // Configure the cell...
        cell.nameField.text = driver.name
        cell.imageField.image = driver.photo
        cell.ratingControls.ratingNo = driver.rating
        
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            drivers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender : sender)
        switch (segue.identifier ?? ""){
        case "addDriver" :
            os_log("Adding a new driver", log: OSLog.default, type: .debug)
        case "showDetail" :
            guard let driverDetailViewController = segue.destination as? driverViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedDriverCell = sender as? driverTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedDriverCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedDriver = drivers[indexPath.row]
            driverDetailViewController.driveR = selectedDriver
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
    
    
    @IBAction func unwindToDriverList(sender: UIStoryboardSegue){
           if let sourceViewController = sender.source as? driverViewController, let driveR = sourceViewController.driveR {
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                drivers[selectedIndexPath.row] = driveR
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else {
                let newIndexPath = IndexPath(row: drivers.count, section: 0)
                drivers.append(driveR)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
    
    private func loadSamples(){
        let photo1 = UIImage(named : "Driver1")
        guard let driver1 = driver(photo: photo1, name: "Nicholas Lim", destination: "UConn", rating: 5) else {
            fatalError("Unable to instantiate driver1")
        }
        drivers += [driver1]
    }
}
