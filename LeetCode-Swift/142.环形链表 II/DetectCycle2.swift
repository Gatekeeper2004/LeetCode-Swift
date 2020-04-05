//
//  DetectCycle2.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/1/13.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
/*
func detectCycle2(head: ListNode) -> ListNode {
    
}
*/
//快慢指针
/*
 public class Solution {
     public ListNode detectCycle(ListNode head) {
         ListNode fast = head, slow = head;
         while (true) {
             if (fast == null || fast.next == null) return null;
             fast = fast.next.next;
             slow = slow.next;
             if (fast == slow) break;
         }
         fast = head;
         while (slow != fast) {
             slow = slow.next;
             fast = fast.next;
         }
         return fast;
     }
 }

 作者：jyd
 链接：https://leetcode-cn.com/problems/linked-list-cycle-ii/solution/linked-list-cycle-ii-kuai-man-zhi-zhen-shuang-zhi-/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */
