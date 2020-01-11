//
//  ProjectsListViewController.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 10.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

class ProjectsListViewController:  UIViewController {
    
    var projectViewModels = AllProjectsViewModel()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
     }()

    lazy var  projectTitleTextField = AddTextView()

    lazy var addBtn = AddButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let data = UserDefaults.standard.value(forKey:"projects") as? Data {
               let songs2 = try? PropertyListDecoder().decode(Array<ProjectViewModel>.self, from: data)
               projectViewModels.projects = songs2 ?? []
           }
//        let visma1 = ProjectViewModel(project: Project(name: "Visma", totalHours: 3), workLogs: [])
//        let visma2 = ProjectViewModel(project: Project(name: "Visma", totalHours: 23), workLogs: [])
//        let visma3 = ProjectViewModel(project: Project(name: "Vismasadasfdfdsafa", totalHours: 31), workLogs: [])
//
//        projectViewModels.addToProjects(project: visma1)
//        projectViewModels.addToProjects(project: visma2)
//        projectViewModels.addToProjects(project: visma3)
        
        view.backgroundColor = .white
        view.addSubview(collectionView)
        view.addSubview(addBtn)
        view.addSubview(projectTitleTextField)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(ProjectCell.self, forCellWithReuseIdentifier: "ProjectCell")
        setupConstraints()
    }
     
    func setupConstraints() {
        addBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        addBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        addBtn.widthAnchor.constraint(equalToConstant: 70).isActive = true
        addBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        addBtn.addTarget(self, action: #selector(clicked), for: UIControl.Event.touchUpInside)
           
        projectTitleTextField.topAnchor.constraint(equalTo: addBtn.topAnchor).isActive = true
        projectTitleTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        projectTitleTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        projectTitleTextField.rightAnchor.constraint(equalTo: addBtn.leftAnchor, constant: -20).isActive = true
       
        collectionView.topAnchor.constraint(equalTo: projectTitleTextField.bottomAnchor, constant: 20).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
        
    @objc func clicked(){
        projectViewModels.addToProjects(project: ProjectViewModel(project: Project(name: projectTitleTextField.text, totalHours : 0), workLogs: []))

        UserDefaults.standard.set(try? PropertyListEncoder().encode(projectViewModels.projects), forKey: "projects")
        collectionView.reloadData()
    }
    
    @objc func deleteRecord(sender: UIButton){
        projectViewModels.deleteFromProjects(sender: sender.tag)
        collectionView.reloadData()

    }
}

extension ProjectsListViewController:  UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return projectViewModels.projects.count
    }
    
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let projectCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjectCell", for: indexPath) as! ProjectCell

        projectCell.projectName.text = projectViewModels.projects[indexPath.item].name
        projectCell.totalHoursLabel.text = String(projectViewModels.projects[indexPath.item].totaHours)
        projectCell.deleteButton.tag = indexPath.item
        projectCell.deleteButton.addTarget(self, action: #selector(deleteRecord(sender:)), for: UIControl.Event.touchUpInside)
        return projectCell
    }
}

extension ProjectsListViewController:  UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: 40)
   }
           
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

       let project = projectViewModels.projects[indexPath.item]
       let controller =  WorkLogsListViewController()
       controller.projectViewModel = project
       self.present(controller, animated: true, completion: nil)
       //        self.navigationController?.pushViewController(controller, animated: true)
       
         print("User tapped on item \(indexPath.row)")
   }
    
  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
          
}
