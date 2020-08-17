//
//  CountSort.swift
//  SortAlgor
//
//  Created by 段峰 on 2020/8/17.
//  Copyright © 2020 段峰. All rights reserved.
//

import Foundation

/// 计数排序
class CountSort: DFSort<Int> {
    
    init(_ array:inout [Int]) {
        var max = array[0]
        var min = array[0]
        
        // 遍历数组找到最大最小值
        for i in 0..<array.count {
            if array[i] > max {
                max = array[i]
            }
            if array[i] < min {
                min = array[i]
            }
        }
        
        var counts = Array(repeating: 0, count: max - min + 1)
        
        // 遍历array中的数组 放到counts索引位置
        for i in 0..<array.count {
            counts[array[i] - min] += 1
        }
        
        /// 将counts数组的值累加前一索引的值
        for i in 1..<counts.count {
            counts[i] += counts[i - 1]
        }
        
        var newArray = Array(repeating: 0, count: array.count)
        
        for i in (0..<array.count).reversed() {
            counts[array[i] - min] -= 1
            newArray[counts[array[i] - min]] = array[i]
        }
        
        array = newArray
    }
}
