//
//  Defaults.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 11.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import Foundation

class Defaults {
    
    static var sharedInstance = Defaults()
    let projectsKey = "projects"
   
    func encodeProjects(_ projects: [ProjectViewModel]) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(projects), forKey: projectsKey)
      }

    func decodeProjects() -> [ProjectViewModel] {
        var decodedProjects : [ProjectViewModel] = []
        if let data = UserDefaults.standard.value(forKey: projectsKey) as? Data {
             decodedProjects = (try? PropertyListDecoder().decode(Array<ProjectViewModel>.self, from: data)) ?? []
        }
        return decodedProjects
    }
    
}

