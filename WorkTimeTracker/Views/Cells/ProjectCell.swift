//
//  ProjectCell.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 10.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

class ProjectCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var projectName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Robonto", size: 20.0)
        label.textColor = UIColor.black
        return label
    }()

    lazy var totalHoursLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Robonto", size: 14)
        label.textColor = UIColor.lightGray
        return label
    }()
  
    lazy var deleteButton: UIButton = {
        let btn = UIButton()
        btn.tintColor = .clear
        btn.setTitleColor(.blue, for: .normal)
        btn.setTitle("X", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    func setupViews() {
        addSubview(projectName)
        addSubview(totalHoursLabel)
        addSubview(deleteButton)

        projectName.heightAnchor.constraint(equalToConstant: 30).isActive = true
        projectName.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true

        totalHoursLabel.topAnchor.constraint(equalTo: projectName.bottomAnchor, constant: 5).isActive = true

//        codeLabelCuote.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor).isActive = true
//
//        nameLabelCuote.topAnchor.constraint(equalTo: codeLabelBase.bottomAnchor, constant: 5).isActive = true
//        nameLabelCuote.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor).isActive = true
//
//        deleteButton.topAnchor.constraint(equalTo: codeLabelBase.topAnchor, constant: 15).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        deleteButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        deleteButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
