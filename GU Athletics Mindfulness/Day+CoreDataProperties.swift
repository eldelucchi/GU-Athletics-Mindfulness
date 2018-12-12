//
//  Day+CoreDataProperties.swift
//  GU Athletics Mindfulness
//
//  Created by Brewer Slack on 12/11/18.
//  Copyright © 2018 Emma Delucchi. All rights reserved.
//
//

import Foundation
import CoreData


extension Day {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Day> {
        return NSFetchRequest<Day>(entityName: "Day")
    }

    @NSManaged public var name: String?
    @NSManaged public var perceivedStress: Int16
    @NSManaged public var nutrition: Int16
    @NSManaged public var hydration: Int16
    @NSManaged public var fatigue: Int16
    @NSManaged public var sleepHours: Int16
    @NSManaged public var date: NSDate?
    
    var overallReadinessScore: Double {
        return Double(perceivedStress + nutrition +  hydration + fatigue)/4.0
        }

}
