//
//  ProjectViewModelTests.swift
//  WorkTimeTrackerTests
//
//  Created by Dilyana Yankova on 13.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import XCTest
@testable import WorkTimeTracker

class ProjectViewModelTests: XCTestCase {

    var projectViewModel: ProjectViewModel!
    
    override func setUp() {
        projectViewModel = ProjectViewModel(Project("TestProject"), workLogs:
            [WorkLog(1.5, "2016/07/27"),
            WorkLog(15, "2017/07/27"),
            WorkLog(3.5, "2018/07/27")])
    }

    override func tearDown() {
       projectViewModel = nil
    }

    func testCalculateTotalHoursWithEmptyWorkLogs(){
        projectViewModel.workLogs = []
        let result = projectViewModel.calculateTotalHours()
         XCTAssertEqual(result, 0)
    }
    
    func testCalculateTotalHoursWithWorkLogs(){
        let result = projectViewModel.calculateTotalHours()
        XCTAssertEqual(result, 20)
    }
   
    func testAddToWorkLogsWhenNotIn(){
        let workLog = WorkLog(1.5, "2019/07/27")
        projectViewModel.addWorkLog(workLog)
        XCTAssertEqual(projectViewModel.workLogs[3].date, workLog.date)
    }
    
    func testAddToWorkLogsWhenExists(){
       let workLog = WorkLog(23, "2016/07/27")
       projectViewModel.addWorkLog(workLog)
       XCTAssertEqual(projectViewModel.workLogs[0].hours, workLog.hours)
   }
    
    func testDeleteFromProjects(){
        projectViewModel.deleteWorkLog(0)
        let dates = projectViewModel.workLogs.map() {$0.date}
        XCTAssertEqual(dates, ["2017/07/27", "2018/07/27"])
   }
    
    func testConvertHoursWhenValidDouble(){
        XCTAssertEqual(projectViewModel.convertHours("0"), 0)
        XCTAssertEqual(projectViewModel.convertHours("1"), 1)
        XCTAssertEqual(projectViewModel.convertHours("23.445"),23.445)
    }
    
    func testConvertHoursWhenInvalidDouble(){
        XCTAssertEqual(projectViewModel.convertHours("0eeefrr"), 0)
        XCTAssertEqual(projectViewModel.convertHours(""), 0)
        XCTAssertEqual(projectViewModel.convertHours("1,3"), 0)
    }
    
}
