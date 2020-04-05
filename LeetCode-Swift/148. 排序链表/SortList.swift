//
//  SortList.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/12/12.
//  Copyright © 2019 yidingw. All rights reserved.
//

import Foundation

/**
* 参考：Sort List——经典（链表中的归并排序） https://www.cnblogs.com/qiaozhoulin/p/4585401.html
*
* 归并排序法：在动手之前一直觉得空间复杂度为常量不太可能，因为原来使用归并时，都是 O(N)的，
* 需要复制出相等的空间来进行赋值归并。对于链表，实际上是可以实现常数空间占用的（链表的归并
* 排序不需要额外的空间）。利用归并的思想，递归地将当前链表分为两段，然后merge，分两段的方
* 法是使用 fast-slow 法，用两个指针，一个每次走两步，一个走一步，知道快的走到了末尾，然后
* 慢的所在位置就是中间位置，这样就分成了两段。merge时，把两段头部节点值比较，用一个 p 指向
* 较小的，且记录第一个节点，然后 两段的头一步一步向后走，p也一直向后走，总是指向较小节点，
* 直至其中一个头为NULL，处理剩下的元素。最后返回记录的头即可。
*
* 主要考察3个知识点，
* 知识点1：归并排序的整体思想
* 知识点2：找到一个链表的中间节点的方法
* 知识点3：合并两个已排好序的链表为一个新的有序链表
*/

func sortList(_ head: ListNode?) -> ListNode? {
    if head == nil {
        return head
    }
    return mergeSort(head: head)
}

fileprivate func mergeSort(head: ListNode?) -> ListNode? {
    if (head?.next == nil) || (head == nil) {
        return head
    }
    var fastP = head
    var slowP = head
    var dummyTail:ListNode?
    while (fastP != nil) && (fastP?.next != nil)  {
        dummyTail = slowP
        slowP = slowP?.next
        fastP = fastP?.next?.next
    }
    
    dummyTail?.next = nil
    
    let leftNode = mergeSort(head: head)
    let rightNode = mergeSort(head: slowP)
    return merge(leftNode: leftNode, rightNode: rightNode)
}

fileprivate func merge(leftNode: ListNode?, rightNode: ListNode?) -> ListNode? {
    let dummyHead = ListNode(0)
    var point:ListNode?
    point = dummyHead
    var list1 = leftNode
    var list2 = rightNode
    
    while (list1 != nil) && (list2 != nil) {
        if list1!.val < list2!.val {
            point?.next = list1
            point = point?.next
            list1 = list1?.next
        } else {
            point?.next = list2
            point = point?.next
            list2 = list2?.next
        }
    }
    
    if list1 == nil {
        point?.next = list2
    } else {
        point?.next = list1
    }
    return dummyHead.next
}

