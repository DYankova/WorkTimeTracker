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

    var navigationController: UINavigationController?
    var viewController : UIViewController?
    
    lazy var projectName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Robonto", size: 20.0)
        label.textColor = UIColor.darkGray
        return label
    }()

    lazy var totalHoursLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Robonto", size: 20)
        label.textColor = UIColor.lightGray
        return label
    }()
  
    lazy var deleteButton: UIButton = {
        let btn = UIButton()
        btn.tintColor = .gray
        btn.setTitleColor(.blue, for: .normal)
        if let image = UIImage(named: "delete") {
            btn.setImage(image, for: .normal)
        }
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    func setupViews() {
        addSubview(projectName)
        addSubview(totalHoursLabel)
        addSubview(deleteButton)
 
        projectName.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        projectName.widthAnchor.constraint(equalToConstant: 250 ).isActive = true
        projectName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        
        deleteButton.topAnchor.constraint(equalTo: projectName.topAnchor).isActive = true
        deleteButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        
        totalHoursLabel.topAnchor.constraint(equalTo: projectName.topAnchor).isActive = true
        totalHoursLabel.rightAnchor.constraint(equalTo: deleteButton.leftAnchor, constant: -20).isActive = true
    }
}

