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
    //Test
    func addToProjects(project: ProjectViewModel){
        if !self.projects.contains(project){
            self.projects.append(project)
        }
    }
     //Test
    func deleteFromProjects(sender: Int){
        self.projects.remove(at: sender)
    }
}
