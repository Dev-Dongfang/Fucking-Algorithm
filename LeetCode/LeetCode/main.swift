//
//  main.swift
//  LeetCode
//
//  Created by Wei Walden on 2018/9/27.
//  Copyright © 2018年 Wei Walden. All rights reserved.
//

import Foundation

print("Hello, World!")

//3.查找最长子串
//print("----------------3----------------")
//print(Problem3Solution1().lengthOfLongestSubstring("aab"))

//5.找出字符串中最长的一个回文字符串
excuteDuration {
    let result5 = Problem5Solution2().longestPalindrome("azwdzwmwcqzgcobeeiphemqbjtxzwkhiqpbrprocbppbxrnsxnwgikiaqutwpftbiinlnpyqstkiqzbggcsdzzjbrkfmhgtnbujzszxsycmvipjtktpebaafycngqasbbhxaeawwmkjcziybxowkaibqnndcjbsoehtamhspnidjylyisiaewmypfyiqtwlmejkpzlieolfdjnxntonnzfgcqlcfpoxcwqctalwrgwhvqvtrpwemxhirpgizjffqgntsmvzldpjfijdncexbwtxnmbnoykxshkqbounzrewkpqjxocvaufnhunsmsazgibxedtopnccriwcfzeomsrrangufkjfzipkmwfbmkarnyyrgdsooosgqlkzvorrrsaveuoxjeajvbdpgxlcrtqomliphnlehgrzgwujogxteyulphhuhwyoyvcxqatfkboahfqhjgujcaapoyqtsdqfwnijlkknuralezqmcryvkankszmzpgqutojoyzsnyfwsyeqqzrlhzbc")
//    let result5 = Problem5Solution2().longestPalindrome("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb")
    print(result5)
}



//7.翻转一个整数
//print(Problem7Solution1().reverse(-2147483648))
//outputInt(Int32.max)

//9.判断一个数字是否是回文
print("----------------9----------------")
print(Problem9Solution1().isPalindrome(12233221))

//11.最大储水量
print("----------------11----------------")
print(Problem11Solution1().maxArea([2,3,4,5,18,17,6]))

//12:罗马数字转字母
/*
 Input: 1994
 Output: "MCMXCIV"
 Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
 */
//print(Problem12Solution1().intToRoman(1994))

//13.字母转罗马数字
//print(Problem13Solution1().romanToInt("MCMXCIV"))

print("----------------14----------------")
print(Problem14Solution1().longestCommonPrefix(["",""]))
//19.
//var head = ListNode(1)
//head.next = ListNode(2)
//head.next?.next = ListNode(3)
//head.next?.next?.next = ListNode(4)
//head.next?.next?.next?.next = ListNode(5)
//var hearPointer = head
//while hearPointer?.next != nil {
//    print(indexPointer?.val)
//    indexPointer = indexPointer?.next
//}
//print("------")
//print("------")
//var indexPointer = Problem19Solution1().removeNthFromEnd(head, 2)
//while indexPointer != nil {
//    print(indexPointer?.val)
//    indexPointer = indexPointer?.next
//}

//print("----------------20----------------")
//print(Problem20Solution1().isValid("([[[{{}}]]{}])"))

print("----------------28----------------")
print(Problem28Solution2().strStr("mississippi", "pi"))

//print("----------------29----------------")
//excuteDuration {
//    print(Problem29Solution2().divide(-2147483648, -1))
//}

//35.二分查找一个数字
//print(Problem35Solution1().searchInsert([1,3], 3))

print("----------------36----------------")
let arr: [[Character]] = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
//print(Problem36Solution1().isValidSudoku(arr))

print("----------------38----------------")
print(Problem38Solution1().countAndSay(5))

print("----------------46----------------")
//print(Problem46Solution3().permute([1,2,3]))

//66.Plus One
excuteDuration {
    let result = Problem66Solution1().plusOne([0])
//    print(result)
}

//67.
print("----------------67----------------")
print(Problem67Solution2().addBinary("110010", "10111"))   //   1001

//69.计算平方根
//print(Problem69Solution1().mySqrt(105))

//70.爬楼梯
excuteDuration {
    let result = Problem70Solution1().climbStairs(10)
//    print(result)
}

//
print("----------------75----------------")
var nums75 = [2,0,2,1,1,0]
Problem75Solution2().sortColors(&nums75)

//78.subsets1
print("----------------78----------------")
print(Problem78Solution1().subsets([1,2,3]))

print("----------------90----------------")
print(Problem90Solution1().subsetsWithDup([4,4,4,1,4]))

print("----------------86----------------")
let node86 = createNode(nodes: [1,4,3,2,5,2])
let node86Result = Problem86Solution1().partition(node86, 3)
printNodeList(node: node86Result)

//43261596, so return 964176192
print("----------------190----------------")
//test:43261596 --> 964176192, 4294967293 --> 3221225471
print(Problem190Solution1().reverseBits(4294967293))

print("----------------201----------------")
print(Problem201Solution1().rangeBitwiseAnd(5, 7))

//206.单链表反转
print("----------------206----------------")
let node206 = createNode(nodes: [1,2,3,4,5])
printNodeList(node: node206)
let result206 = Problem206Solution1().reverseList(node206)
printNodeList(node: result206)

print("----------------338----------------")
print(Problem338Solution2().countBits(5))

//876.求链表中点
print("----------------876----------------")
let node876 = createNode(nodes: [])
printNodeList(node: node876)
let result876 = Problem876Solution1().middleNode(node876)
print(result876?.val)



print("LRUCache")
let cache = LRUCache(2)
cache.put(2, 1)
cache.put(1, 1)
print(cache.get(2))
cache.put(4, 1)
print(cache.get(1))
print(cache.get(2))


//287.Find the duplicate Number
let result = Problem287Solution1().findDuplicate([3,1,3,4,2])
print(result)
print("")

