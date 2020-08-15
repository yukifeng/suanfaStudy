//
//  MergeSort.swift
//  SortAlgor
//
//  Created by 段峰 on 2020/8/13.
//  Copyright © 2020 段峰. All rights reserved.
//

import Foundation

class MergeSort<E:Comparable>: DFSort<E> {
    
    
    /// 归并排序
    /// - Parameter array: <#array description#>
    func mergeSort(_ array:inout [E]) {
        self.array = array
        divide(begin: 0, end: array.count)
        array = self.array
    }
    
    /// 分割数组 范围 [begin,end)
    /// - Parameters:
    ///   - begin: <#begin description#>
    ///   - end: <#end description#>
    private func divide(begin:Int,end:Int){
        guard end - begin > 1 else {
            return
        }
        let mid = (begin + end) >> 1
        divide(begin: begin, end: mid)
        divide(begin: mid, end: end)
        merge(begin: begin, mid: mid, end: end)
    }
    
    /// 将 [begin, mid) 和 [mid, end) 范围的序列合并成一个有序序列
    /// - Parameters:
    ///   - begin: <#begin description#>
    ///   - mid: <#mid description#>
    ///   - end: <#end description#>
    private func merge(begin:Int,mid:Int,end:Int){
        /// 分割后左边数组的拷贝
        // 2,3,5   (2 | 3,4)
        var leftArray:[E] = []
        var li = 0
        var ri = mid
        let le = mid - begin
        let re = end
        /// 指向当前数组需要覆盖的索引
        var ai = begin
        
        for i in li..<le {
            leftArray.append(self.array[begin + i])
        }
        
        while li < le {
            if ri < re && self.array[ri] < leftArray[li] {
                self.array[ai] = self.array[ri]
                ai += 1
                ri += 1
            }else{
                self.array[ai] = leftArray[li]
                ai += 1
                li += 1
            }
        }
    }
}
