//
//  WorkLogsCollectionView.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 10.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

class WorkLogsCollectionView: UIView {
   
     var projectViewModels = AllProjectsViewModel()
  private lazy var flowLayout = UICollectionViewFlowLayout()
        
        private lazy var collectionView: UICollectionView = {
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.register(ProjectCell.self, forCellWithReuseIdentifier: "ProjectCell")
            return collectionView
        }()

      
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            addSubview(collectionView)

            collectionView.backgroundColor = .clear
            collectionView.isScrollEnabled = false
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: topAnchor),
                collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
                collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ])
            

        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
   
    }

    extension WorkLogsCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 6
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let projectCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjectCell", for: indexPath) as! ProjectCell
            
//            let membership = memberships[indexPath.row]
//            cell.configure(with: membership)
            return projectCell
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
  //todo
        }
        
    }

    

