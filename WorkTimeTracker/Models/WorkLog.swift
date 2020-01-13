//
//  WorkLog.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 10.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

struct WorkLog : Codable {
    let hours: Double
    let date: String
    
    init( _ hours: Double, _ date: String) {
        self.hours = hours
        self.date = date
    }
      
}
