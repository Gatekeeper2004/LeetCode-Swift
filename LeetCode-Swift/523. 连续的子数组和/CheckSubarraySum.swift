//
//  CheckSubarraySum.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/2/12.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//前缀和
func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
    if nums.count < 2 {
        return false
    }
        
    var sum = Array<Int>.init(repeating: 0, count: nums.count)
        for i in stride(from: 1, to: nums.count, by: 1) {
            sum[i] = sum[i - 1] + nums[i]
        }
    for start in stride(from: 0, to: nums.count - 1, by: 1) {
        for end in stride(from: start + 1, to: nums.count, by: 1) {
            let summ = sum[end] - sum[start] + nums[start]
            if (summ == k) || (k != 0 && summ % k == 0) {
                print(summ)
                return true
            }
            if(nums[start] == 0 && nums[start + 1] == 0) && k == 0 {
              return true
            }
        }
    }
    return false
}

/*
 public class Solution {
     public boolean checkSubarraySum(int[] nums, int k) {
         int sum = 0;
         HashMap < Integer, Integer > map = new HashMap < > ();
         map.put(0, -1);
         for (int i = 0; i < nums.length; i++) {
             sum += nums[i];
             if (k != 0)
                 sum = sum % k;
             if (map.containsKey(sum)) {
                 if (i - map.get(sum) > 1)
                     return true;
             } else
                 map.put(sum, i);
         }
         return false;
     }
 }

 作者：LeetCode
 链接：https://leetcode-cn.com/problems/continuous-subarray-sum/solution/lian-xu-de-zi-shu-zu-he-by-leetcode/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */
