//
//  Day.swift
//  GU Athletics Mindfulness
//
//  Created by Emma Delucchi on 12/2/18.
//  Copyright © 2018 Emma Delucchi. All rights reserved.
//

import Foundation

enum Rating: Int {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
}

class Day: CustomStringConvertible{
    var hydration: Rating
    var nutrition: Rating
    var percievedStress: Rating
    var fatigue: Rating
    var overallReadinessScore: Double
    
    
    var description: String{
        return "Hydration: \(hydration), Nutrition: \(nutrition), Percieved Stress: \(percievedStress), Fatigue: \(fatigue), Overall Readiness Score: \(overallReadinessScore)"
    }
    
    init(hydration: Rating, nutrition: Rating, percievedStress: Rating, fatigue: Rating) {
        self.hydration = hydration
        self.nutrition = nutrition
        self.percievedStress = percievedStress
        self.fatigue = fatigue
        overallReadinessScore = 0.0
    }
    
    func computeReadinessScore() {
        overallReadinessScore = Double(percievedStress.rawValue + nutrition.rawValue +  hydration.rawValue + fatigue.rawValue)/4.0
    }
}

