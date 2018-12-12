//
//  DaysTableViewCell.swift
//  GU Athletics Mindfulness
//
//  Created by Brewer Slack on 12/8/18.
//  Copyright © 2018 Emma Delucchi. All rights reserved.
//

import UIKit

class DaysTableViewCell: UITableViewCell {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var readinessScoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(withDay day: Day){
        let df = DateFormatter()
        df.dateFormat = "MM/dd/yyyy"
        if let date = day.date! as Date? {
            if let name = day.name {
                dateLabel.text = "\(name)-\(df.string(from: date))"
                readinessScoreLabel.text = String(day.overallReadinessScore)
            }
            
        }
        
    }
}
