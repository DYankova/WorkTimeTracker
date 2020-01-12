//
//  DatePicker.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 11.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

class DatePicker : UIDatePicker {
    var formatter : DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MM-yyyy"
            return formatter
    }()
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           setup()
   }

   required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
   func setup(){
       datePickerMode = UIDatePicker.Mode.date
    
   }
    
}
