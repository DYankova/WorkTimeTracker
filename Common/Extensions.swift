//
//  Extensions.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 13.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import Foundation


extension Array {
    func contains<T>(_ obj: T) -> Bool where T : Equatable {
        return self.filter({$0 as? T == obj}).count > 0
    }
}

extension String {
    func toDouble() -> Double {
        return NumberFormatter().number(from: self)?.doubleValue ?? 0.0
    }
}

