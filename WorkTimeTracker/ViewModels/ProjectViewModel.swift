//
//  ProjectViewModel.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 10.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

class ProjectViewModel: Codable, Equatable{
   
    let project: Project
    var workLogs : [WorkLogViewModel]
     
    init(_ project: Project, workLogs : [WorkLogViewModel]) {
        self.project = project
        self.workLogs = workLogs
    }
    
    var name: String {
        return project.name
    }
    
    var totaHours: Double {
        return calculateTotalHours(workLogs: workLogs)
    }
     //Test
    func calculateTotalHours(workLogs: [WorkLogViewModel]) -> Double {
        return workLogs.reduce(0) { $0 + $1.hours }
    }
   //Test
    func addToWorkLogs(_ workLog: WorkLogViewModel){
        if let row = self.workLogs.firstIndex(where: {$0.date == workLog.date}) {
//            workLog.hours +=  workLogs[row].hours
            workLogs[row] = workLog
            return
        }

        self.workLogs.append(workLog)
    }
      //Test
    func deleteFromProjects(sender: Int){
        self.workLogs.remove(at: sender)
    }
     //Test
    func convertHours(_ hoursText : String) -> Double {
        return Double(hoursText) ?? 0.0
    }
    
    static func == (lhs: ProjectViewModel, rhs: ProjectViewModel) -> Bool {
        return lhs.name == rhs.name
    }
    
}
