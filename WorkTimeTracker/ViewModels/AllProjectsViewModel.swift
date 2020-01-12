//
//  AllProjectsViewModel.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 10.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

class AllProjectsViewModel: Codable {
    var projects = [ProjectViewModel]()
    
    init() {
        self.projects = Defaults.sharedInstance.decodeProjects()
    }
    
    func addToProjects(project: ProjectViewModel){
        self.projects.append(project)
        Defaults.sharedInstance.encodeProjects(self.projects)
       
    }
    
    func deleteFromProjects(sender: Int){
        self.projects.remove(at: sender)
        Defaults.sharedInstance.encodeProjects(self.projects)
    }
}
