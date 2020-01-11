//
//  AddTextField.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 10.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

class AddTextView : UITextView {
  
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(){
        isEditable = true
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        backgroundColor = .clear
        font = UIFont(name: "Robonto", size: 16)
        layer.cornerRadius = 4
        textColor = .black
        isUserInteractionEnabled = true
        
    }
    
}
