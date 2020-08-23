//
//  StableTests.swift
//  SortAlgorTests
//
//  Created by 段峰 on 2020/8/24.
//  Copyright © 2020 段峰. All rights reserved.
//

import XCTest
@testable import SortAlgor

class StableTests: XCTestCase {
    var students:[Student] = []
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBubbleSort() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        createStudents()
        let sort = BubbleSort(withArray: students)
        sort.bubbleSort()
        students = sort.array
        let result = checkArrayIsStable()
        XCTAssert(result, "不稳定")
    }
    
    func testSelectionSort() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        createStudents()
        let sort = SelectionSort(withArray: students)
        sort.secectionSort()
        students = sort.array
        let result = checkArrayIsStable()
        XCTAssert(result, "不稳定")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func createStudents() {
        for i in 0..<300 {
            let stu = Student(age: 10, score: i*10)
            students.append(stu)
            students[0].age = 50
        }
    }
    
    func checkArrayIsStable() -> Bool {
        for i in 1..<students.count {
                let score = students[i].score
                let prevScore = students[i - 1].score
            if score - prevScore != 10 && students[i].age == students[i - 1].age{
                    return false
                }
            }
            return true
    }
}
