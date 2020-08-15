//
//  InsertionSort.swift
//  SortAlgor
//
//  Created by 段峰 on 2020/8/12.
//  Copyright © 2020 段峰. All rights reserved.
//

import Foundation

class InsertSort<E:Comparable>:DFSort<E> {
    
    /// 插入排序 依次对比current和上一个索引
    /// - Parameter array: <#array description#>
    func insertSort(_ array:inout [E]){
        for begin in 1..<array.count {
            var current = begin
            while current > 0 && array[current] < array[current - 1] {
                let temp = array[current]
                array[current] = array[current - 1]
                array[current - 1] = temp
                current -= 1
            }
        }
    }
    
    /// 插入排序 元素后移 记录应在的位置一次性插入
    /// - Parameter array: <#array description#>
    func insertSort2(_ array:inout [E]) {
        for begin in 1..<array.count {
            var current = begin
            let element = array[current]
            while current > 0 && element < array[current - 1]{
                array[current] = array[current - 1]
                current -= 1
            }
            array[current] = element
        }
    }
    
    /// 插入排序二分搜索优化 范围是 : [begin,end)
    /// - Parameter array: <#array description#>
    func insertSort3(_ array:inout [E]) {
        self.array = array
        for i in 1..<array.count {
            insert(source: i, dest: search(target: i))
        }
        array = self.array
    }
    
    
    /// 将source位置的元素插入到dest的位置
    /// - Parameters:
    ///   - source: <#source description#>
    ///   - dest: <#dest description#>
    private func insert(source:Int,dest:Int){
        let element = array[source]
        var i = source
        while i > dest {
            array[i] = array[i - 1]
            i -= 1
        }
        array[dest] = element
    }
    
    /// 二分查找元素应插入的位置  范围是[0,target)
    /// - Parameters:
    ///   - array: 数组
    ///   - target: 目标元素索引
    /// - Returns: 元素插入的下标
    private func search(target:Int) -> Int{
        guard array.count > 0 else {
            return 0
        }
        var begin = 0
        var end = target
        
        while begin < end {
            let mid = (begin + end) >> 1
            if array[target] < array[mid]{
                end = mid
            }else {
                begin = mid + 1
            }
        }
        return begin
    }
}

extension Array where Element:Comparable{
    
}
