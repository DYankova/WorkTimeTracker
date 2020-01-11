//
//  WorkLogViewModel.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 10.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

struct WorkLogViewModel {
    let workLog: WorkLog
    
     init(workLog: WorkLog) {
      self.workLog = workLog
    }
    
    var date: String {
        return  String(workLog.date)
    }
    
    var hours: Int {
        return workLog.hours
    }
    
}
