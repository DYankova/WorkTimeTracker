//
//  WorkLog.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 10.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

struct WorkLog : Codable {
    let projectName : String
    var hours: Double
    let date: String
    
    init(projectName: String, hours: Double, date: String) {
        self.projectName = projectName
        self.hours = hours
        self.date = date
    }
      
}
