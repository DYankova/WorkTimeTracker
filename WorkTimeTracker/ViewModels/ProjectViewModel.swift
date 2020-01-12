//
//  ProjectViewModel.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 10.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

class ProjectViewModel: Codable {
    let project: Project
    var workLogs : [WorkLogViewModel]
     
    init(project: Project, workLogs : [WorkLogViewModel]) {
        self.project = project
        self.workLogs = workLogs
    }
    
    var name: String {
        return project.name
    }
    
    var totaHours: Double {
        return calculateTotalHours(workLogs: workLogs)
    }
    
    func calculateTotalHours(workLogs: [WorkLogViewModel]) -> Double {
        return workLogs.reduce(0) { $0 + $1.hours }
    }
  
    func addToWorkLogs(_ workLog: WorkLogViewModel){
        self.workLogs.append(workLog)
    }
     
    func deleteFromProjects(sender: Int){
        self.workLogs.remove(at: sender)
    }
    
    func convertHours(_ hoursText : String) -> Double {
        return Double(hoursText) ?? 0.0
    }
    
}
