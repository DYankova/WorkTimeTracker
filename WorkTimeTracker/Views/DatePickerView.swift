//
//  DatePickerView.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 10.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

class DatePickerView :  AddTextField {
        
    lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        return picker
    }()
    
    lazy var dropdownArrowButton: UIButton = {
        let button = UIButton()
//        button.setImage(R.image.dropdownArrowIcon, for: .normal)
        button.isUserInteractionEnabled = false
        return button
    }()
    
    lazy var textField = AddTextField()
    
    lazy var defaultDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .short
        return formatter
    }()
    
    var dateFormatter: DateFormatter?
    
    private var _selectedDate: Date?
        
        var selectedDate: Date? {
            get {
                return _selectedDate
            }
            set {
                _selectedDate = newValue
                
                if let newValue = newValue {
                    datePicker.date = newValue
                    
                    if let dateFormatter = dateFormatter {
                        textField.text = dateFormatter.string(from: newValue)
                    } else {
                        textField.text = defaultDateFormatter.string(from: newValue)
                    }
                } else {
                    textField.text = nil
                }
            }
        }
        
        var onDateSelected: ((_ date: Date) -> Void)?
        
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.textField.inputView = self.datePicker
//            textField.rightView = dropdownArrowButton
//            textField.leftView = nil
        self.textField.keyboardAccessoryView.doneButton.addTarget(self, action: #selector(dismissKeyboard), for: .touchUpInside)
      }
     
        @objc private func dismissKeyboard() {
            dateChanged()
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        @objc private func dateChanged() {
            let date = datePicker.date
            selectedDate = date
            onDateSelected?(date)
        }
}

class KeyboardAccessoryView: UIView {

    let enabledTintColor = UIColor.white
    let disabledTintColor = UIColor(white: 0.6, alpha: 1)

    lazy var previousButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
//        button.setImage(R.image.upArrow, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 8, left: 20, bottom: 8, right: 10)
        button.tintColor = self.enabledTintColor
        return button
    }()

    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
//        button.setImage(R.image.downArrow, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 20)
        button.tintColor = self.enabledTintColor
        return button
    }()

    lazy var doneButton: UIButton = {
        let button = UIButton()
//        button.titleLabel?.font = R.font.regular(size: 17)
        button.setTitle( "Keyboard_toolbar.done.button" , for: .normal)
        button.setTitleColor(self.enabledTintColor, for: .normal)
        button.setTitleColor(self.disabledTintColor, for: .disabled)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
        
        backgroundColor = .lightGray
        
        addSubview(previousButton)
        addSubview(nextButton)
        addSubview(doneButton)
//
//        previousButton.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//            make.leading.equalToSuperview()
//            make.height.equalTo(40)
//            make.width.equalTo(54)
//        }
//
//        nextButton.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//            make.leading.equalTo(previousButton.snp.trailing)
//            make.height.equalTo(40)
//            make.width.equalTo(54)
//        }
//
//        doneButton.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//            make.trailing.equalToSuperview().defaultInset()
//        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


