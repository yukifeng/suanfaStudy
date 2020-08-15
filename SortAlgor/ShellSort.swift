//
//  ShellSort.swift
//  SortAlgor
//
//  Created by 段峰 on 2020/8/15.
//  Copyright © 2020 段峰. All rights reserved.
//

import Foundation

class ShellSort<E:Comparable>: DFSort<E> {
    init(_ array:inout [E]) {
        super.init()
        self.array = array
//        let stepSequence = shellStepSequence()
        let stepSequence = sedgewickStepSequence()
        for step in stepSequence {
            shellSort(step: step)
        }
        array = self.array
    }
    
    
    /// 希尔排序
    /// - Parameter step: 步长
    private func shellSort(step:Int){
        for col in 0..<step {
            var begin = col + step
            while begin < array.count {
                var cur = begin
                while cur > col && array[cur] < array[cur - step] {
                    let temp = array[cur]
                    array[cur] = array[cur - step]
                    array[cur - step] = temp
                    cur -= step
                }
                begin += step
            }
            
        }
    }
    
    
    /// 定义希尔排序的步长序列(希尔本人给出的步长序列:n/2^k)
    /// - Returns: 返回步长序列
    private func shellStepSequence() -> [Int]{
        var stepSequence = [Int]()
        var count = array.count >> 1
        while count > 0{
            stepSequence.append(count)
            count = count >> 1
        }
        return stepSequence
    }
    
    /// 定义希尔排序的步长序列(目前为止最好的步长序列：1，5，19，41,109...)
    /// - Returns: 返回步长序列
    private func sedgewickStepSequence() -> [Int]{
        var stepSequence = [Int]()
        var k = 0, step = 0
        while true {
            if k % 2 == 0 {
                let p = Int(pow(2.0, Double(k>>1)))
                step = 1 + 9 * (p * p - p)
            }else{
                let p1 = Int(pow(2.0, Double((k - 1) >> 1)))
                let p2 = Int(pow(2.0, Double((k + 1) >> 1)))
                step = 1 + 8 * p1 * p2 - 6 * p2
            }
            if step >= array.count {
                break
            }
            stepSequence.insert(step, at: 0)
            k += 1
        }
        return stepSequence
    }
}
