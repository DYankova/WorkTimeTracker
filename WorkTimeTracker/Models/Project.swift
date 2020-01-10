//
//  Project.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 10.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

struct Project {
    let name : String?
    let totalHours: Int?
    
    init(name: String, totalHours: Int) {
        self.name = name
        self.totalHours = totalHours
    }
}
