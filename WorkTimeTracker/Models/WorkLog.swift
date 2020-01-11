//
//  WorkLog.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 10.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

struct WorkLog : Codable {
    let projectName : String
    let hours: String
    let date: String
    
    init(projectName: String, hours: String, date: String) {
        self.projectName = projectName
        self.hours = hours
        self.date = date
    }
    
    func encode(with aCoder: NSCoder) {
          aCoder.encode(projectName, forKey: "projectName")
          aCoder.encode(hours,    forKey: "hours")
          aCoder.encode(date,    forKey: "date")
         
      }
      
      
}
