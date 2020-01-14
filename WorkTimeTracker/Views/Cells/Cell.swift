//
//  Cell.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 10.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var projectName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Robonto", size: 20)
        label.textColor = Constants.darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var totalHoursLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Robonto", size: 20)
        label.textColor = Constants.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
  
    lazy var deleteButton: UIButton = {
        let btn = UIButton()
        btn.tintColor = Constants.darkGray
        btn.setTitleColor(.blue, for: .normal)
        if let image = UIImage(named: "delete") {
            let tintedImage = image.withRenderingMode(.alwaysTemplate)
            btn.setImage(tintedImage, for: .normal)
            btn.tintColor = Constants.darkGray
        }
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    func setupViews() {
        addSubview(projectName)
        addSubview(totalHoursLabel)
        addSubview(deleteButton)
 
        projectName.topAnchor.constraint(equalTo: topAnchor, constant: Constants.padding).isActive = true
        projectName.widthAnchor.constraint(equalToConstant: 150 ).isActive = true
        projectName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Constants.padding).isActive = true
        
        deleteButton.topAnchor.constraint(equalTo: projectName.topAnchor).isActive = true
        deleteButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -Constants.padding).isActive = true
        
        totalHoursLabel.topAnchor.constraint(equalTo: projectName.topAnchor).isActive = true
        totalHoursLabel.rightAnchor.constraint(equalTo: deleteButton.leftAnchor, constant: -Constants.padding).isActive = true
    }
}

