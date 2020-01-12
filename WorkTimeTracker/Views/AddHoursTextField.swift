//
//  AddHoursTextField.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 11.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

class AddHoursTextField : AddTextField {
    
    override init(frame: CGRect) {
       super.init(frame: frame)
        placeholder = "0 h"
   }

   required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
   func addValidations(){
      
   }
    
}
