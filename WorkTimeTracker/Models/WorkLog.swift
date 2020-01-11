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
    let date: String
    
    init(projectName: String, hours: Int, date: String) {
        self.projectName = projectName
        self.hours = hours
        self.date = date
    }
}
