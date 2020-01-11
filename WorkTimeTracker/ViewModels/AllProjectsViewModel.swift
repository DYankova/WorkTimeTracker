//
//  AllProjectsViewModel.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 10.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

struct AllProjectsViewModel {
    var projects = [ProjectViewModel]()
    
    mutating func addToProjects(project: ProjectViewModel){
        self.projects.append(project)
    }
    
    mutating func deleteFromProjects(sender: Int){
        self.projects.remove(at: sender)
    }
}
