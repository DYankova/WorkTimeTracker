//
//  DatePickerView.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 10.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

class DatePickerView :  UIDatePicker {
     var textField = UITextField()
//
//    override init(frame: CGRect) {
//             super.init(frame: frame)
//
//         }
//
//         required init?(coder aDecoder: NSCoder) {
//             super.init(coder: aDecoder)
//         }
//
//
//
//    func setup(textField: UITextField){
//        datePickerMode = UIDatePicker.Mode.date
//        let toolbar = UIToolbar();
//        toolbar.sizeToFit()
//        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
//            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
//        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
//
//        toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)
//
//        textField.inputAccessoryView = toolbar
//        textField.inputView = self
//   }
//
//    @objc func donedatePicker(){
//          let formatter = DateFormatter()
//          formatter.dateFormat = "dd-MM-yyyy"
//            textField.text = formatter.string(from: self.date)
////            view.endEditing(true)
//        }
//
//    @objc func cancelDatePicker(){
////          view.endEditing(true)
//     }
}
