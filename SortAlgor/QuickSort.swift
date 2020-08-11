//
//  QuickSort.swift
//  排序算法
//
//  Created by 段峰 on 2020/8/5.
//  Copyright © 2020 段峰. All rights reserved.
//

import Foundation

class QuickSort<T:Comparable>:CustomStringConvertible {
    var description: String{
        var r = ""
        for i in 0..<array.count {
            r.append("\(array[i])_")
        }
        return r
    }
    
    var array:[T] = []
    
    init(withArray array:[T]) {
        self.array = array
        var count = array.count
        var b = 0
        sort(begin: &b, end: &count)
    }
    
    func sort(begin:inout Int,end:inout Int){
        
        guard end - begin > 2 else { return }
        
        var mid = pivotIndex(begin: &begin, end: &end)
        var midAddone = mid + 1
        
        sort(begin: &begin, end: &mid)
        sort(begin: &midAddone, end: &end)
        
    }
    
    
    /// 构造出 [begin, end) 范围的轴点元素
    /// - Parameters:
    ///   - begin: <#begin description#>
    ///   - end: <#end description#>
    /// - Returns: 轴点元素的最终位置
    func pivotIndex(begin:inout Int,end:inout Int) -> Int {
//        let randomBegin = Int(arc4random() % UInt32(end - begin))
//        swap(i1: &array[begin], i2: &array[randomBegin])
        end -= 1
        // 备份轴心值
        let pivot = array[begin]
        
        while begin < end {
            // 从右向左遍历对比
            while begin < end {
                if pivot < array[end]{
                    end -= 1
                }else{
                    array[end] = array[begin]
                    begin += 1
                    break
                }
            }
            
            while begin < end {
                // 从左向右遍历对比
                if array[begin] < pivot {
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
    
    func swap( i1:inout T, i2:inout T) {
        let temp = i1
        i1 = i2
        i2 = temp
    }
    
}
