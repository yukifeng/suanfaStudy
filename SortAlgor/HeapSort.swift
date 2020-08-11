//
//  HeapSort.swift
//  SortAlgor
//
//  Created by 段峰 on 2020/8/8.
//  Copyright © 2020 段峰. All rights reserved.
//

import Foundation

/// 堆排序
class HeapSort<T:Comparable>: DFSort<T> {
    var elements:[T] = Array()
    var size = 0
    
    init(withArray array:inout [T]) {
        super.init()
        if array.count == 0 {
            elements = Array()
        }else{
            size = array.count
            for i in 0..<array.count {
                elements.append(array[i])
            }
            heapfiy()
            sort()
        }
        // 排序好的数组覆盖inout参数
        array = elements
    }
    
    private func heapfiy(){
        var i = (size >> 1) - 1
        while i >= 0 {
            siftDown(indexShape: i)
            i -= 1
        }
    }
    
    private func sort(){
        while size > 1 {
            // 第0个最大值交换到数组最后
            let temp = elements[0]
            elements[0] = elements[size - 1]
            elements[size - 1] = temp
            size -= 1
            // 下滤恢复最大堆性质
            siftDown(indexShape: 0)
        }
    }
        
        /// 让index位置的元素下滤
        /// - Parameter index: <#index description#>
        private func siftDown(indexShape:Int){
            var index = indexShape
            let element = elements[index]
            let half = size >> 1
            // 第一个叶子节点的索引 == 非叶子节点的数量
            // index < 第一个叶子节点的索引
            // 必须保证index位置是非叶子节点
            while index < half {
                // index的节点有2种情况
                // 1.只有左子节点
                // 2.同时有左右子节点
                
                // 左子节点
                var leftChildIndex = (index << 1) + 1
                var leftChild = elements[leftChildIndex]
                // 右子节点
                let rightChildIndex = (index << 1) + 2
                // 默认左子节点与父节点进行比较
                if rightChildIndex < size && elements[rightChildIndex] > elements[leftChildIndex] {
                    leftChild = elements[rightChildIndex]
                    leftChildIndex = rightChildIndex
                }
                if element > leftChild {
                    break
                }
                // 将子节点存放到index位置
                elements[index] = leftChild
                // 重新设置index
                index = leftChildIndex
            }
            elements[index] = element
        }
    
}
