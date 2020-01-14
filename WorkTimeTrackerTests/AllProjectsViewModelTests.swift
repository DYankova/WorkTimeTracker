//
//  AllProjectsViewModelTests.swift
//  WorkTimeTrackerTests
//
//  Created by Dilyana Yankova on 13.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import XCTest
@testable import WorkTimeTracker

class AllProjectsViewModelTests: XCTestCase {

    var аllProjectsViewModel: AllProjectsViewModel!
            
    var testProjects = [ProjectViewModel(Project("First"), workLogs: []),                                                                                                ProjectViewModel(Project("Second"), workLogs: []),
                        ProjectViewModel(Project("Third"), workLogs: [])]

    override func setUp() {
        аllProjectsViewModel =  AllProjectsViewModel()
        аllProjectsViewModel.projects = testProjects
    }

    override func tearDown() {
        аllProjectsViewModel = nil
    }
    
    func testAddProjectWhenNotIn(){
        let projectViewModel = ProjectViewModel(Project("New"), workLogs: [])
        аllProjectsViewModel.addProject(projectViewModel)
        XCTAssertTrue(аllProjectsViewModel.projects.contains(projectViewModel))
    }
      
    func testAddProjectWhenExists(){
         let projectViewModel = ProjectViewModel(Project("First"), workLogs: [])
         аllProjectsViewModel.addProject(projectViewModel)
         XCTAssertEqual(аllProjectsViewModel.projects.count, 3)
    }

    func testDeleteFromProjects(){
        аllProjectsViewModel.deleteProject(0)
        let projectsNames = аllProjectsViewModel.projects.map() {$0.name}
        XCTAssertEqual(projectsNames, ["Second", "Third"])
    }
      
}
