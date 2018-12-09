//
//  DayDetailTableViewController.swift
//  GU Athletics Mindfulness
//
//  Created by Brewer Slack on 12/8/18.
//  Copyright © 2018 Emma Delucchi. All rights reserved.
//

import UIKit

class DayDetailTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let sleepHours = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24"]
    
    let rating = ["1", "2", "3", "4", "5"]
    
    @IBOutlet var sleepPicker: UIPickerView!
    @IBOutlet var hydrationPicker: UIPickerView!
    @IBOutlet var nutritionPicker: UIPickerView!
    @IBOutlet var stressPicker: UIPickerView!
    @IBOutlet var fatiguePicker: UIPickerView!
    
    var day: Day? = nil
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        sleepPicker.delegate = self
        sleepPicker.dataSource = self
        
        hydrationPicker.delegate = self
        hydrationPicker.dataSource = self
        
        nutritionPicker.delegate = self
        nutritionPicker.dataSource = self
        
        stressPicker.delegate = self
        stressPicker.dataSource = self
        
        fatiguePicker.delegate = self
        fatiguePicker.dataSource = self
        
        if let day = day {
            setupView(day: day)
        }
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func setupView(day: Day) {
        let sleepInd = day.sleepHours - 1
        let hydrationInd = day.hydration.rawValue - 1
        let nutritionInd = day.nutrition.rawValue - 1
        let stressInd = day.nutrition.rawValue - 1
        let fatigueInd = day.fatigue.rawValue - 1
        
        
        sleepPicker.selectRow(sleepInd, inComponent: 1, animated: true)
        hydrationPicker.selectRow(hydrationInd, inComponent: 1, animated: true)
        nutritionPicker.selectRow(nutritionInd, inComponent: 1, animated: true)
        stressPicker.selectRow(stressInd, inComponent: 1, animated: true)
        fatiguePicker.selectRow(fatigueInd, inComponent: 1, animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return sleepHours.count
        }
        else {
            return rating.count
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return sleepHours[row]
        }
        else {
            return rating[row]
        }
        
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    @IBAction func donePressed(_ sender: Any) {
        // unwind here
    }
}
