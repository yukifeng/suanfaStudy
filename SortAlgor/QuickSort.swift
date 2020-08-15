//
//  QuickSort.swift
//  排序算法
//
//  Created by 段峰 on 2020/8/5.
//  Copyright © 2020 段峰. All rights reserved.
//

import Foundation

class QuickSort<T:Comparable>:DFSort<T> {
    
    init(withArray array:inout [T]) {
        super.init()
        self.array = array
        quickSort(begin: 0, end: array.count)
        array = self.array
    }
    
    func quickSort(begin: Int,end: Int){
        
        guard end - begin > 1 else { return }
        
        let middle = pivotIndex(begin: begin, end: end)
        quickSort(begin: begin, end: middle)
        quickSort(begin: middle + 1, end: end)
    }
    
    
    /// 构造出 [begin, end) 范围的轴点元素
    /// - Parameters:
    ///   - begin: <#begin description#>
    ///   - end: <#end description#>
    /// - Returns: 轴点元素的最终位置
    func pivotIndex(begin b:Int,end e:Int) -> Int {
        var begin = b
        var end = e
        let randomBegin = Int(arc4random() % UInt32(end - begin))
        swap(begin: begin, target: begin + randomBegin)
        // pivot: 轴点元素
        let pivot = array[begin]
        end -= 1
        while begin < end {
            while begin < end {
                if pivot < array[end] {
                    end -= 1
                }else{
                    array[begin] = array[end]
                    begin += 1
                    break
                }
            }
            while begin < end {
                if pivot > array[begin] {
                    begin += 1
                }else{
                    array[end] = array[begin]
                    end -= 1
                    break
                }
            }
        }
        array[begin] = pivot
        return begin
    }
    
    private func swap(begin:Int,target:Int){
        let temp = array[begin]
        array[begin] = array[target]
        array[target] = temp
    }
}
