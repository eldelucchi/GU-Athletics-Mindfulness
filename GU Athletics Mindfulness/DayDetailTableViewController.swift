//
//  DayDetailTableViewController.swift
//  GU Athletics Mindfulness
//
//  Created by Brewer Slack on 12/8/18.
//  Copyright © 2018 Emma Delucchi. All rights reserved.
//

import UIKit

class DayDetailTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    let sleepHours = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24"]
    
    let rating = ["1", "2", "3", "4", "5"]
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet var sleepPicker: UIPickerView!
    @IBOutlet var hydrationPicker: UIPickerView!
    @IBOutlet var nutritionPicker: UIPickerView!
    @IBOutlet var stressPicker: UIPickerView!
    @IBOutlet var fatiguePicker: UIPickerView!
    @IBOutlet var nameField: UITextField!
    
    var day: Day? = nil
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        nameField.delegate = self
        
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
            if let name = day.name {
                
                self.navigationItem.title = name
                setupView(day: day)
            }
            
        }
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func setupView(day: Day) {
        if let name = day.name {
            nameField.text = name
        }
        let sleepInd = Int(day.sleepHours - 1)
        let hydrationInd = Int(day.hydration - 1)
        let nutritionInd = Int(day.nutrition - 1)
        let stressInd = Int(day.nutrition - 1)
        let fatigueInd = Int(day.fatigue - 1)
        
        
        sleepPicker.selectRow(sleepInd, inComponent: 0, animated: true)
        hydrationPicker.selectRow(hydrationInd, inComponent: 0, animated: true)
        nutritionPicker.selectRow(nutritionInd, inComponent: 0, animated: true)
        stressPicker.selectRow(stressInd, inComponent: 0, animated: true)
        fatiguePicker.selectRow(fatigueInd, inComponent: 0, animated: true)
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameField.resignFirstResponder()
        return true
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        nameField.resignFirstResponder()
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
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        print("preparing")
        
        let hydration = hydrationPicker.selectedRow(inComponent: 0)
        let nutrition = nutritionPicker.selectedRow(inComponent: 0)
        let perceivedStress = stressPicker.selectedRow(inComponent: 0)
        let fatigue = fatiguePicker.selectedRow(inComponent: 0)
        let sleep = sleepPicker.selectedRow(inComponent: 0)
        
        let newDay = Day(context: context)
        if let name = nameField.text {
            newDay.name = name
            newDay.date = NSDate()
            newDay.hydration = Int16(hydration)
            newDay.nutrition = Int16(nutrition)
            newDay.perceivedStress = Int16(perceivedStress)
            newDay.fatigue = Int16(fatigue)
            newDay.sleepHours = Int16(sleep)
            self.day = newDay
        }
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if nameField.text == "" {
            let title = "Entry Name is Required"
            let message = "Please input an entry name."
            let ac =  UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
            
            ac.addAction(okayAction)
            present(ac, animated: true, completion: nil)
            
            return false
        }
        else {
            return true
        }
    }

}
