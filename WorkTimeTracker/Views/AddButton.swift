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
            setTitle("Save", for: .normal)
           layer.cornerRadius = 4
        //        btn.setTitleColor(.blue, for: .normal)
            titleLabel?.font = UIFont(name: "Robonto", size: 16)
            translatesAutoresizingMaskIntoConstraints = false
       }
    

}

