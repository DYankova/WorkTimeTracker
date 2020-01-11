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
     if let data = UserDefaults.standard.value(forKey:"projects") as? Data {
        let decodedProjects = try? PropertyListDecoder().decode(Array<ProjectViewModel>.self, from: data)
              projects = decodedProjects ?? []
      }
    }
    
    func addToProjects(project: ProjectViewModel){
        self.projects.append(project)
        UserDefaults.standard.set(try? PropertyListEncoder().encode(projects), forKey: "projects")
    }
    
    func deleteFromProjects(sender: Int){
        self.projects.remove(at: sender)
        UserDefaults.standard.set(try? PropertyListEncoder().encode(projects), forKey: "projects")
    }
}
