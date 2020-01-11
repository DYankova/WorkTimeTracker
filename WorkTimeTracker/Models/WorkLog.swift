//
//  WorkLog.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 10.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

struct WorkLog {
    let projectName : String
    let hours: Int
    let date: Date
    
    init(projectName: String, hours: Int, date: Date) {
        self.projectName = projectName
        self.hours = hours
        self.date = date
    }
}
