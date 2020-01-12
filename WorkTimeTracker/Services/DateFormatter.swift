//
//  DateFormatter.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 12.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

class Formatter: DateFormatter {
    
   static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
}
