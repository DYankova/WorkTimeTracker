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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        backgroundColor = Constants.lightGray
        setTitle("Add", for: .normal)
        layer.cornerRadius = 4
        titleLabel?.font = .systemFont(ofSize: 14)
        translatesAutoresizingMaskIntoConstraints = false
   }

}

