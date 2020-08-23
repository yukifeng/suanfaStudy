//
//  SelectionSort.swift
//  SortAlgor
//
//  Created by 段峰 on 2020/8/7.
//  Copyright © 2020 段峰. All rights reserved.
//

import Foundation

class SelectionSort<T:Comparable>: DFSort<T> {
    init(withArray array:[T]) {
        super.init()
        self.array = array
    }
    
    /// 选择排序
    func secectionSort(){
        guard array.count > 1 else {
            return
        }
        
        for end in (1..<array.count).reversed() {
            /// 最大元素的位置
            var max = 0
            for begin in 1...end {
                cmpCount += 1
                if array[begin] >= array[max] {
                    max = begin
                }
            }
            let temp = array[end]
            array[end] = array[max]
            array[max] = temp
            swapCount += 1
        }
    }
}

extension Array where Element:Comparable{
    mutating func secectionSort(){
        guard self.count > 0 else {
            return
        }
        
        for end in (1..<self.count).reversed() {
            /// 最大元素的位置
            var max = 0
            for begin in 1...end {
                if self[begin] >= self[max] {
                    max = begin
                }
            }
            let temp = self[end]
            self[end] = self[max]
            self[max] = temp
        }
    }
}
