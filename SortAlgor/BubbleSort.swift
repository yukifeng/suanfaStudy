//
//  BubbleSort.swift
//  排序算法
//
//  Created by 段峰 on 2020/8/7.
//  Copyright © 2020 段峰. All rights reserved.
//

import Foundation

class BubbleSort<T:Comparable>:DFSort<T>{
    
    init(withArray array:[T]) {
        super.init()
        self.array = array
    }
    
    
    
    /// 普通冒泡排序
    func bubbleSort(){
        guard array.count > 1 else {
            return
        }
        for end in (1...(array.count - 1)).reversed() {
            for begin in 0..<end {
                cmpCount += 1
                if array[begin] > array[begin+1]{
                    swapCount += 1
                    let temp = array[begin]
                    array[begin] = array[begin+1]
                    array[begin+1] = temp
                }
            }
        }
    }
    
    /// 标记一轮循环没有交换时提前退出的优化排序
    func bubbleSort2(){
        guard array.count > 1 else {
            return
        }
        
        for end in (1...(array.count - 1)).reversed() {
            var flag = true
            for begin in 0..<end {
                cmpCount += 1
                if array[begin] > array[begin+1]{
                    swapCount += 1
                    let temp = array[begin]
                    array[begin] = array[begin+1]
                    array[begin+1] = temp
                    flag = false
                }
            }
            if flag == true {
                break
            }
        }
    }
    
    /// 记录最后一次交换的位置
    func bubbleSort3() {
        guard array.count > 1 else {
            return
        }
        
        for var end in (1...(array.count - 1)).reversed() {
            var lastSwapIndex = 1
            for begin in 0..<end {
                cmpCount += 1
                if array[begin] > array[begin+1]{
                    let temp = array[begin]
                    array[begin] = array[begin+1]
                    array[begin+1] = temp
                    lastSwapIndex = begin
                    swapCount += 1
                }
            }
            end = lastSwapIndex
        }
    }
    
    func isStable() -> Bool {
        
        students.bubbleSort()
        
        return super.studentSortAfter()
    }
}

extension Array where Element:Comparable{
    mutating func bubbleSort(){
        for end in (1...(self.count - 1)).reversed() {
            for begin in 0..<end {
                if self[begin] > self[begin+1]{
                    let temp = self[begin]
                    self[begin] = self[begin+1]
                    self[begin+1] = temp
                }
            }
        }
    }
}
