//
//  AddProjectView.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 10.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

class AddButton: UIButton {
    override init(frame: CGRect) {
           super.init(frame: frame)
           setup()
       }

       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
       }
    
       func setup(){
            backgroundColor = .lightGray
            setTitle("Add New", for: .normal)
            layer.cornerRadius = 4
            titleLabel?.font = .systemFont(ofSize: 14)
            translatesAutoresizingMaskIntoConstraints = false
       }

}

