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
    var projectViewModels = AllProjectsViewModel()
    
    lazy var validation = Validation()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
     }()
    
    lazy var dateTextField = AddTextField()
       
    lazy var workHoursTextField :  AddTextField = {
        let textField =  AddTextField()
        textField.placeholder = "0 h"
        return textField
    }()
    
    lazy var projectTitleBar = UINavigationBar()
    
    lazy var datePicker = UIDatePicker()
    
    lazy var addButton = AddButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = .fullScreen
        view.backgroundColor = Constants.backgroundColor
        
        view.addSubview(dateTextField)
        view.addSubview(workHoursTextField)
        view.addSubview(addButton)
        view.addSubview(collectionView)
       
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(Cell.self, forCellWithReuseIdentifier: "Cell")
        
        setNavigationBar()
        setupConstraints()
        showDatePicker()
    }

    func setNavigationBar() {
        let navItem = UINavigationItem(title: projectViewModel.name)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .close, target: nil, action: #selector(close))
        navItem.leftBarButtonItem = doneItem
        projectTitleBar.setItems([navItem], animated: false)
        self.view.addSubview(projectTitleBar)
    }
    
    @objc func close() {
       self.dismiss(animated: true, completion: nil)
    }
    
    func setupConstraints() {
        projectTitleBar.translatesAutoresizingMaskIntoConstraints = false
        projectTitleBar.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.cellHeight).isActive = true
        projectTitleBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        projectTitleBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        projectTitleBar.heightAnchor.constraint(equalToConstant: Constants.cellHeight).isActive = true
        
        addButton.topAnchor.constraint(equalTo: projectTitleBar.bottomAnchor, constant: Constants.padding).isActive = true
        addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Constants.padding).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        addButton.heightAnchor.constraint(equalToConstant:  Constants.cellHeight).isActive = true
        addButton.addTarget(self, action: #selector(addWorkLog), for: .touchUpInside)
        
        workHoursTextField.topAnchor.constraint(equalTo: addButton.topAnchor).isActive = true
        workHoursTextField.rightAnchor.constraint(equalTo: addButton.leftAnchor, constant: -10).isActive = true
        workHoursTextField.heightAnchor.constraint(equalToConstant:  Constants.cellHeight).isActive = true
        workHoursTextField.widthAnchor.constraint(equalToConstant: 40).isActive = true
                  
        dateTextField.topAnchor.constraint(equalTo: addButton.topAnchor).isActive = true
        dateTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.padding).isActive = true
        dateTextField.heightAnchor.constraint(equalToConstant:  Constants.cellHeight).isActive = true
        dateTextField.rightAnchor.constraint(equalTo: workHoursTextField.leftAnchor, constant: -10).isActive = true
       
        collectionView.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: Constants.padding).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
        
    @objc func addWorkLog(){
        if validation.validateAddToLogs(dateTextField.text ?? "", workHoursTextField.text ?? ""){
            projectViewModel.addWorkLog( WorkLog( projectViewModel.convertHours(workHoursTextField.text ?? ""), dateTextField.text ?? ""))
            Defaults.sharedInstance.encodeProjects(projectViewModels.projects)
            collectionView.reloadData()
            addButton.backgroundColor = Constants.lightGray
        } else {
            addButton.backgroundColor = Constants.alertColor
            return
        }
    }
    
    @objc func deleteRecord(sender: UIButton){
        projectViewModel.deleteWorkLog(sender.tag)
        Defaults.sharedInstance.encodeProjects(projectViewModels.projects)
        collectionView.reloadData()
    }
}

extension WorkLogsListViewController:  UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return projectViewModel.workLogs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let wotkLogCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
        wotkLogCell.projectName.text = projectViewModel.workLogs[indexPath.item].date
        wotkLogCell.totalHoursLabel.text = String(projectViewModel.workLogs[indexPath.item].hours)
        wotkLogCell.deleteButton.tag = indexPath.item
        wotkLogCell.deleteButton.addTarget(self, action: #selector(deleteRecord(sender:)), for: .touchUpInside)
        return wotkLogCell
    }
}

extension WorkLogsListViewController:  UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width, height:  Constants.cellHeight)
   }
 
  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
}

extension WorkLogsListViewController {
    
     func showDatePicker(){
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector (dateChanged(datePicker:)), for: .allEvents)
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));

        toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)

        dateTextField.inputAccessoryView = toolbar
        dateTextField.inputView = datePicker
     }

   @objc func dateChanged(datePicker: UIDatePicker){
        dateTextField.text = Formatter.formatter.string(from: datePicker.date)
    }
    
  @objc func donedatePicker(){
        dateTextField.text = Formatter.formatter.string(from: datePicker.date)
        self.view.endEditing(true)
 }

 @objc func cancelDatePicker(){
        self.view.endEditing(true)
      }
}
