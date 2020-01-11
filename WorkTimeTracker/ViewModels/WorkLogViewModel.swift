//
//  WorkLogViewModel.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 10.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

struct WorkLogViewModel : Codable {
    let workLog: WorkLog
    
     init(workLog: WorkLog) {
      self.workLog = workLog
    }
    
    var date: String {
        return  String(workLog.date)
    }
    //TODO
    var hours: Int {
   
        return Int(workLog.hours) ?? 0
    }
    
}
