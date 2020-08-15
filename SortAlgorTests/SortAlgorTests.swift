//
//  SortAlgorTests.swift
//  SortAlgorTests
//
//  Created by 段峰 on 2020/8/7.
//  Copyright © 2020 段峰. All rights reserved.
//

import XCTest
@testable import SortAlgor

class SortAlgorTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test1() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        var array:[Int] = []
        for _ in 0..<3000 {
            array.append(Int(arc4random()%UInt32(10000)))
        }
        
        let sort = BubbleSort(withArray: array)
        sort.bubbleSort()
        isAscOrder(sort.array)
    }
    
    func test2() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        var array:[Int] = []
        for _ in 0..<3000 {
            array.append(Int(arc4random()%UInt32(10000)))
        }
        
        let sort = BubbleSort(withArray: array)
        sort.bubbleSort2()
        isAscOrder(sort.array)
    }
    
    func test3() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        var array:[Int] = []
        for _ in 0..<3000 {
            array.append(Int(arc4random()%UInt32(10000)))
        }
        
        let sort = BubbleSort(withArray: array)
        sort.bubbleSort3()
        isAscOrder(sort.array)
    }
    
    func testSelection() throws {
        var array:[Int] = []
        for _ in 0..<3000 {
            array.append(Int(arc4random()%UInt32(10000)))
        }
        
        let sort = SelectionSort(withArray: array)
        sort.secectionSort()
        isAscOrder(sort.array)
    }
    
    func testHeapSort() throws {
        var array:[Int] = []
        for _ in 0..<3000 {
            array.append(Int(arc4random()%UInt32(10000)))
        }
        
        _ = HeapSort(withArray: &array)
        
        isAscOrder(array)
    }
    
    func testInsertionSort() throws {
        var array:[Int] = []
        for _ in 0..<3000 {
            array.append(Int(arc4random()%UInt32(10000)))
        }
        
        let insert = InsertSort<Int>()
        //        insert.insertSort(&array)
        //        insert.insertSort2(&array)
        insert.insertSort3(&array)
        isAscOrder(array)
    }
    
    func testMergeSort() throws {
        var array:[Int] = []
        for _ in 0..<3000 {
            array.append(Int(arc4random()%UInt32(10000)))
        }
        
        let insert = MergeSort<Int>()
        //        insert.insertSort(&array)
        //        insert.insertSort2(&array)
        insert.mergeSort(&array)
        isAscOrder(array)
    }
    
    func testQuickSort() throws {
        var array:[Int] = []
        for _ in 0..<3000 {
            array.append(Int(arc4random()%UInt32(10000)))
        }
        
        let _ = QuickSort(withArray: &array)
        isAscOrder(array)
    }
    
    func testShellSort() throws {
        var array:[Int] = []
        for _ in 0..<3000 {
            array.append(Int(arc4random()%UInt32(10000)))
        }
        
        let _ = ShellSort(&array)
        isAscOrder(array)
    }
    
    func isAscOrder<T:Comparable>(_ array:[T])  {
        guard array.count > 0 else {
            return
        }
        for i in 0..<array.count-1 {
            XCTAssert(array[i] <= array[i+1], "\(array[i])和\(array[i+1])不通过")
        }
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
