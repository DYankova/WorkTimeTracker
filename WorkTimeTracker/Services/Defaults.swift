//
//  Defaults.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 11.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import Foundation
import UIKit

class Defaults {
    static var sharedInstance = Defaults()

    let projects = "projects"
    let workLogs = "worklogs"


    func encodeProjects(_ projects: [ProjectViewModel]) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(projects), forKey: "projects")
      }

  func decodeProjects() -> [ProjectViewModel] {
    var decodedProjects : [ProjectViewModel] = []
    if let data = UserDefaults.standard.value(forKey:"projects") as? Data {
         decodedProjects = (try? PropertyListDecoder().decode(Array<ProjectViewModel>.self, from: data)) ?? []
     
    }
    return decodedProjects
  }
    
}

