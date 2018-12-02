//
//  Day.swift
//  GU Athletics Mindfulness
//
//  Created by Emma Delucchi on 12/2/18.
//  Copyright © 2018 Emma Delucchi. All rights reserved.
//

import Foundation

class Day{
    enum hydration: Int {
        case one = 1
        case two = 2
        case three = 3
        case four = 4
    }
    enum nutrition: Int {
        case one = 1
        case two = 2
        case three = 3
        case four = 4
        case five = 5
    }
    enum percievedStress: Int {
        case one = 1
        case two = 2
        case three = 3
        case four = 4
    }
    enum fatigue: Int {
        case one = 1
        case two = 2
        case three = 3
        case four = 4
    }
    
    var overallReadinessScore: Double
    
    init() {
        overallReadinessScore = 0.0
    }
}
