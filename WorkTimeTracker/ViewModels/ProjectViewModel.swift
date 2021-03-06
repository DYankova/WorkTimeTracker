//
//  ProjectViewModel.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 10.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

class ProjectViewModel: Codable, Equatable {
   
    let project: Project
    var workLogs: [WorkLog]
     
    init(_ project: Project, workLogs : [WorkLog]) {
        self.project = project
        self.workLogs = workLogs
    }
    
    var name: String {
        return project.name
    }
    
    var totaHours: Double {
        return calculateTotalHours()
    }

    func calculateTotalHours() -> Double {
        return self.workLogs.reduce(0) { $0 + $1.hours }
    }

    func addWorkLog(_ workLog: WorkLog) {
        if let row = self.workLogs.firstIndex(where: {$0.date == workLog.date}) {
            workLogs[row] = workLog
        } else {
            self.workLogs.append(workLog)
        }
    }

    func deleteWorkLog(_ sender: Int){
        self.workLogs.remove(at: sender)
    }
    
    func convertHours(_ hoursText : String) -> Double {
        return hoursText.toDouble()
    }
        
    static func == (lhs: ProjectViewModel, rhs: ProjectViewModel) -> Bool {
         return lhs.name == rhs.name
     }
     
}
