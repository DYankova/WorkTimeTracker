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
        if !self.projects.contains(obj: project){
            self.projects.append(project)
            Defaults.sharedInstance.encodeProjects(self.projects)
        }
    }
     //Test
    func deleteFromProjects(sender: Int){
        self.projects.remove(at: sender)
        Defaults.sharedInstance.encodeProjects(self.projects)
    }
}

extension Array {
    func contains<T>(obj: T) -> Bool where T : Equatable {
        return self.filter({$0 as? T == obj}).count > 0
    }
}
