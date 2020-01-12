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
    
    var totaHours: Int {
        return calculateTotalHours(workLogs: workLogs)
    }
    
    
    func calculateTotalHours(workLogs: [WorkLogViewModel]) -> Int {
        return workLogs.reduce(0) { $0 + $1.hours }
    }
  
    func addToWorkLogs(workLog: WorkLogViewModel){
        self.workLogs.append(workLog)
        UserDefaults.standard.set(try? PropertyListEncoder().encode(self), forKey: "workLogs")
    }
     
    func deleteFromProjects(sender: Int){
        self.workLogs.remove(at: sender)
        UserDefaults.standard.set(try? PropertyListEncoder().encode(self), forKey: "workLogs")
    }
}
