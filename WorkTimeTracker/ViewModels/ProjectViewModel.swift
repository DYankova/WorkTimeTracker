//
//  ProjectViewModel.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 10.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

struct ProjectViewModel {
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
        //TODO calculate
        return 10
    }
    
    func createProject(){
        
    }
    
    mutating func addToWorkLogs(workLog: WorkLogViewModel){
        self.workLogs.append(workLog)
    }
    
    
    mutating func deleteFromProjects(sender: UIButton, workLog: WorkLogViewModel){
        self.workLogs.remove(at: sender.tag)
    }
}
