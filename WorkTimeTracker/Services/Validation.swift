//
//  Validator.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 12.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

class Validation {
    
    func validateName(_ name: String) ->Bool {
        let nameRegex = "^[\\w\\s]{2,18}$"
        let trimmedString = name.trimmingCharacters(in: .whitespaces)
        let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        let isValidateName = validateName.evaluate(with: trimmedString)
        return isValidateName
    }
    
    func validateHours(_ hoursString: String) -> Bool {
        let hoursRexef = "^(?:[1-9]\\d*)(?:\\.\\d*)?$"
        let trimmedString = hoursString.trimmingCharacters(in: .whitespaces)
        let validateHours = NSPredicate(format: "SELF MATCHES %@", hoursRexef)
        let isValidHour = validateHours.evaluate(with: trimmedString)
        return isValidHour
    }
    
    func validateDate(_ dateString: String) -> Bool {
        return Formatter.formatter.date(from: dateString) != nil
    }
    
    func validateHoursInADay(_ hoursString : String) -> Bool {
        let dayHours = 24.0
        return hoursString.toDouble() <= dayHours
    }
    
    func validateAddToLogs(_ name: String, _ hoursString : String) -> Bool {
        return validateDate(name) && validateHours(hoursString) && validateHoursInADay(hoursString)
    }
    
}
