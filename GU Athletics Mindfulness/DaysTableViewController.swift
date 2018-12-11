//
//  DaysTableViewController.swift
//  GU Athletics Mindfulness
//
//  Created by Brewer Slack on 12/8/18.
//  Copyright © 2018 Emma Delucchi. All rights reserved.
//

import UIKit

class DaysTableViewController: UITableViewController {
    
    var days = [Day]()
    var selectedCells = [Int]()
    var editButton = UIBarButtonItem()
    @IBOutlet var addButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        tableView.allowsMultipleSelectionDuringEditing = true
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        if editing {
            selectedCells.removeAll()
            let chartButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showChart))
            self.navigationItem.rightBarButtonItem = chartButton
        } else {
            selectedCells.removeAll()
            self.navigationItem.rightBarButtonItem = addButton
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return days.count
    }
    
    @IBAction func unwindToDaysTableVC(segue: UIStoryboardSegue) {
        print("unwinding")
        
        if let addDayVC = segue.source as? DayDetailTableViewController {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                if let day = addDayVC.day {
                    print("identifier is saveSegue unwinding")
                    days[selectedIndexPath.row] = day
                    tableView.reloadData()
                }
            }
            else if let day = addDayVC.day {
                print("identifier is detailSegue unwinding")
                days.append(day)
                tableView.reloadData()
                // ###########################################################################
                // save to Core data here
            }
        }
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath) as! DaysTableViewCell
        let day = days[indexPath.row]
        cell.update(withDay: day)
        
        // Configure the cell...
        
        return cell
    }
    
    @objc func editButtonPressed() {
        print("we're pressed")
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
     // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
            // Delete the row from the data source
            days.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
         }
     }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCells.append(indexPath.row)
    }
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if selectedCells.contains(indexPath.row) {
            if let index = selectedCells.firstIndex(of: indexPath.row) {
                selectedCells.remove(at: index)
            }
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier{
            if identifier == "detailSegue"{
                if let dayDetailVC = segue.destination as? DayDetailTableViewController {
                    
                    if let indexPath = tableView.indexPathForSelectedRow {
                        let day = days[indexPath.row]
                        dayDetailVC.day = day
                    }
                }
            }
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if tableView.isEditing {
            return false
        }
        else {
            return true
        }
    }
    
    @objc func showChart() {
        // grab selected cell's data and show the chart
        print("showing chart")
    }
    
}
