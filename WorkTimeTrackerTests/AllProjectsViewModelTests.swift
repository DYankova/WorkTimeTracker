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
    
    var testProjects = [ProjectViewModel(Project("First"), workLogs: []),               ProjectViewModel(Project("Second"), workLogs: []), ProjectViewModel(Project("Third"), workLogs: [])]

            
    override func setUp() {
        аllProjectsViewModel = AllProjectsViewModel()
    }

    override func tearDown() {
        аllProjectsViewModel = nil
         
    }

    
   

}
