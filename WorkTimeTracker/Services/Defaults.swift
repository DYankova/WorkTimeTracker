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
    static var userDefaults = UserDefaults.standard

    let projects = "projects"
    let workLogs = "worklogs"
    var projectViewModels = AllProjectsViewModel()

    func updatePairsToUserdefaults() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(projectViewModels.projects), forKey: "projects")

      }

  func getPairsFromUserdefaults() {
    if let data = UserDefaults.standard.value(forKey:"projects") as? Data {
          let songs2 = try? PropertyListDecoder().decode(Array<ProjectViewModel>.self, from: data)
          projectViewModels.projects = songs2 ?? []
          }
  }
}

