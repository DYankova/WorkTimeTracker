//
//  ProjectsListViewController.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 10.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

class ProjectsListViewController: UIViewController {
    
    var projectViewModels = AllProjectsViewModel()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
     }()

    lazy var  projectTitleTextField = AddTextField()

    lazy var addButton = AddButton()

    lazy var validation = Validation()
  
    override func viewDidLoad() {
        super.viewDidLoad()
            
        view.backgroundColor = Constants.backgroundColor
        
        view.addSubview(projectTitleTextField)
        view.addSubview(addButton)
        view.addSubview(collectionView)
  
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(Cell.self, forCellWithReuseIdentifier: "Cell")
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
   
    func setupConstraints() {
        //TOP CONSTRAINT - CONSTANTS
        addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.topAnchor).isActive = true
        addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Constants.padding).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: Constants.cellHeight).isActive = true
        addButton.addTarget(self, action: #selector(addProject), for: UIControl.Event.touchUpInside)
           
        projectTitleTextField.topAnchor.constraint(equalTo: addButton.topAnchor).isActive = true
        projectTitleTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.padding).isActive = true
        projectTitleTextField.heightAnchor.constraint(equalToConstant:  Constants.cellHeight).isActive = true
        projectTitleTextField.rightAnchor.constraint(equalTo: addButton.leftAnchor, constant: -Constants.padding).isActive = true
       
        collectionView.topAnchor.constraint(equalTo: projectTitleTextField.bottomAnchor, constant: Constants.padding).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
        
    @objc func addProject(){
        if validation.validateName(projectTitleTextField.text ?? ""){
            projectViewModels.addProject(ProjectViewModel(Project(projectTitleTextField.text ?? ""), workLogs: []))
            Defaults.sharedInstance.encodeProjects(projectViewModels.projects)
            collectionView.reloadData()
            addButton.backgroundColor = Constants.lightGray
        } else {
            addButton.backgroundColor = Constants.alertColor
            return
        }
    }
    
    @objc func deleteRecord(sender: UIButton){
        projectViewModels.deleteProject(sender.tag)
        Defaults.sharedInstance.encodeProjects(projectViewModels.projects)
        collectionView.reloadData()
    }
}

extension ProjectsListViewController:  UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return projectViewModels.projects.count
    }
    
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let projectCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
        projectCell.projectName.text = projectViewModels.projects[indexPath.item].name
        projectCell.totalHoursLabel.text = String(projectViewModels.projects[indexPath.item].totaHours)
        projectCell.deleteButton.tag = indexPath.item
        projectCell.deleteButton.addTarget(self, action: #selector(deleteRecord(sender:)), for: UIControl.Event.touchUpInside)
        return projectCell
    }
}

extension ProjectsListViewController:  UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: Constants.cellHeight)
   }
           
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

       let project = projectViewModels.projects[indexPath.item]
       let controller =  WorkLogsListViewController()
       controller.projectViewModel = project
       controller.projectViewModels.projects  = projectViewModels.projects
       controller.modalPresentationStyle = .fullScreen
       self.present(controller, animated: true, completion: nil)
   }
    
  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
   
      // Dispose of any resources that can be recreated.
  }
          
}
