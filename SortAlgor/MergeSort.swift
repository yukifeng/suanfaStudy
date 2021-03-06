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
        /// 指向左数组当前需要判断大小的指针的索引
        var li = 0
        /// 指向右数组当前需要判断大小的指针的索引
        var ri = mid
        /// 左数组结束的索引
        let le = mid - begin
        /// 右数组结束的索引
        let re = end
        /// 指向当前数组需要覆盖的索引
        var ai = begin
        
        /// 将左边数组拷贝
        for i in li..<le {
            leftArray.append(self.array[begin + i])
        }
        /**
            合并要注意的几种情况：1.左边先结束，无需做任何操作，即为有序数组
                              2.右边先结束，将左边未转移的有序数组按顺序替换原数组元素
            比较ri和li指向的元素大小，当右侧大ai += 1 ，ri += 1 左侧大ai += 1，li += 1
            ri < re : 判断右边数组已经结束，全部使用左边有序数组替换
         */
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
