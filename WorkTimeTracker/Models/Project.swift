//
//  Project.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 10.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

struct Project : Codable {
    let name : String
    let totalHours: Double
    
    init(name: String, totalHours: Double) {
        self.name = name
        self.totalHours = totalHours
    }
}
