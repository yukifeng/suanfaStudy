//
//  DFSort.swift
//  排序算法
//
//  Created by 段峰 on 2020/8/7.
//  Copyright © 2020 段峰. All rights reserved.
//

import Foundation

class DFSort<T:Comparable> {
    var array:[T] = []
    var cmpCount = 0
    var swapCount = 0
    var expendTime:TimeInterval = 0.0
    var students:[Student] = []
    
    
    init() {
        for i in 0..<30 {
            let stu = Student(age: 10, score: i*10)
            students.append(stu)
        }
    }
    
    func studentSortAfter() -> Bool {
        for i in 1..<students.count {
            let score = students[i].score
            let prevScore = students[i - 1].score
            if score - prevScore != 10 {
                return false
            }
        }
        return true
    }
}


struct Student:Comparable {
    
    var age:Int
    var score:Int
    
    static func < (lhs: Student, rhs: Student) -> Bool {
        return lhs.age < rhs.age
    }
    
}
