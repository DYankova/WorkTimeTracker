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
    
    lazy var dateTextField: AddTextView = {
        let textField = AddTextView()
        textField.isEditable = false
        return textField
    }()
        
    lazy var workHoursTextField: AddTextView = {
        let textField = AddTextView()
        textField.text = "0h"
        textField.keyboardType = .numberPad
        return textField
    }()
    
    lazy var datePicker = UIDatePicker()
    
    lazy var addBtn = AddButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        let visma1 = WorkLogViewModel(workLog: WorkLog(projectName: projectViewModel.name, hours: "13", date: "21-2-19"))
        let visma2 = WorkLogViewModel(workLog: WorkLog(projectName: projectViewModel.name, hours: "13", date: "21-2-19"))
        let visma3 = WorkLogViewModel(workLog: WorkLog(projectName: projectViewModel.name, hours: "13", date: "21-2-19"))
     
        projectViewModel.addToWorkLogs(workLog: visma1)
        projectViewModel.addToWorkLogs(workLog: visma2)
        projectViewModel.addToWorkLogs(workLog: visma3)
        
        view.backgroundColor = .white
        view.addSubview(collectionView)
        view.addSubview(addBtn)
        view.addSubview(dateTextField)
        view.addSubview(workHoursTextField)
       
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(ProjectCell.self, forCellWithReuseIdentifier: "ProjectCell")
        setupConstraints()
        
        navigationItem.title = "Partner_lookup.page_title.text"
        setNavigationBar()
        showDatePicker()
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
        addBtn.widthAnchor.constraint(equalToConstant: 60).isActive = true
        addBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        addBtn.addTarget(self, action: #selector(addToWorkLogs), for: UIControl.Event.touchUpInside)
        
        workHoursTextField.topAnchor.constraint(equalTo: addBtn.topAnchor).isActive = true
        workHoursTextField.rightAnchor.constraint(equalTo: addBtn.leftAnchor, constant: -10).isActive = true
        workHoursTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        workHoursTextField.widthAnchor.constraint(equalToConstant: 40).isActive = true
                  
        dateTextField.topAnchor.constraint(equalTo: addBtn.topAnchor).isActive = true
        dateTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        dateTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        dateTextField.rightAnchor.constraint(equalTo: workHoursTextField.leftAnchor, constant: -10).isActive = true
       
        collectionView.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 20).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
        
    @objc func addToWorkLogs(){
        projectViewModel.addToWorkLogs(workLog: WorkLogViewModel(workLog: WorkLog(projectName: projectViewModel.name, hours: workHoursTextField.text, date: dateTextField.text)))
        collectionView.reloadData()
    }
    
    @objc func deleteRecord(sender: UIButton){
        projectViewModel.deleteFromProjects(sender: sender.tag)
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
    projectCell.deleteButton.tag = indexPath.item
    projectCell.deleteButton.addTarget(self, action: #selector(deleteRecord(sender:)), for: UIControl.Event.touchUpInside)
        return projectCell
    }
}

extension WorkLogsListViewController:  UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: 40)
   }
           
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         print("User tapped on item \(indexPath.row)")
   }
    
  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
          
}

extension WorkLogsListViewController {
    
     func showDatePicker(){
        datePicker.datePickerMode = UIDatePicker.Mode.date
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));

        toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)

        dateTextField.inputAccessoryView = toolbar
        dateTextField.inputView = datePicker
     }

  @objc func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        dateTextField.text = formatter.string(from: datePicker.date)
       self.view.endEditing(true)
     }

 @objc func cancelDatePicker(){
        self.view.endEditing(true)
      }
}
