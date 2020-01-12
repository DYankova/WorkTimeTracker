//
//  WorkLogViewModel.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 10.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

class WorkLogViewModel : Codable {
    let workLog: WorkLog
    
     init(workLog: WorkLog) {
      self.workLog = workLog
    }
    
    //TODO - into real date
    var date: String {
        return workLog.date
    }
    
    //TODO
    var hours: Double {
        return workLog.hours
    }

}
