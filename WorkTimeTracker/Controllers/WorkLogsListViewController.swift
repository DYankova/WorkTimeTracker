//
//  WorkLogListViewController.swift
//  WorkTimeTracker
//
//  Created by Dilyana Yankova on 10.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import UIKit

class WorkLogsListViewController:  UIViewController {
    
    var projectViewModel: ProjectViewModel!
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
     }()

    lazy var  projectTitleTextField = AddTextField()
    
    lazy var addBtn = AddButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        let visma1 = WorkLogViewModel(workLog: WorkLog(projectName: projectViewModel.name, hours: 13, date: "21-2-19"))
        let visma2 = WorkLogViewModel(workLog: WorkLog(projectName: projectViewModel.name, hours: 13, date: "21-2-19"))
        let visma3 = WorkLogViewModel(workLog: WorkLog(projectName: projectViewModel.name, hours: 13, date: "21-2-19"))
     
        projectViewModel.addToWorkLogs(workLog: visma1)
        projectViewModel.addToWorkLogs(workLog: visma2)
        projectViewModel.addToWorkLogs(workLog: visma3)
        
        view.backgroundColor = .white
        view.addSubview(collectionView)
        view.addSubview(addBtn)
        view.addSubview(projectTitleTextField)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(ProjectCell.self, forCellWithReuseIdentifier: "ProjectCell")
        setupConstraints()
        
        navigationItem.title = "Partner_lookup.page_title.text"
        setNavigationBar()
    }
    
    func setNavigationBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 15, width: screenSize.width, height: 70))
        let navItem = UINavigationItem(title: projectViewModel.name)
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.close, target: nil, action: #selector(close))
        navItem.leftBarButtonItem = doneItem
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    
    @objc func close() {
       self.dismiss(animated: true, completion: nil)
   }
    func setupConstraints() {
        addBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        addBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        addBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        addBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        addBtn.addTarget(self, action: #selector(clicked), for: UIControl.Event.touchUpInside)
           
        projectTitleTextField.topAnchor.constraint(equalTo: addBtn.topAnchor).isActive = true
        projectTitleTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        projectTitleTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        projectTitleTextField.rightAnchor.constraint(equalTo: addBtn.leftAnchor, constant: -30).isActive = true
       
        collectionView.topAnchor.constraint(equalTo: projectTitleTextField.bottomAnchor, constant: 50).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
        
    @objc func clicked(){
//        projectViewModel.addToWorkLogs(project: ProjectViewModel(project: Project(name: projectTitleTextField.text, totalHours : 0), workLogs: []))
        collectionView.reloadData()
    }
}

extension WorkLogsListViewController:  UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return projectViewModel.workLogs.count
    }
    
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let projectCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjectCell", for: indexPath) as! ProjectCell

    projectCell.projectName.text = projectViewModel.workLogs[indexPath.item].date
    projectCell.totalHoursLabel.text = String(projectViewModel.workLogs[indexPath.item].hours)
        return projectCell
    }
}

extension WorkLogsListViewController:  UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: 40)
   }
           
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

       let project = projectViewModel.workLogs[indexPath.item]
//       let controller =  WorkLogsListViewController()
//       controller.projectViewModel = project
//       self.present(controller, animated: true, completion: nil)
       //        self.navigationController?.pushViewController(controller, animated: true)
       
       
         print("User tapped on item \(indexPath.row)")
   }
    
  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
          
}
