//
//  main.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/9.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation

print("Hello, World!")


print(Int("-1E-16"))
print(1^5)

do {
    //7 - 重建二叉树
    let rebuildTreeNode = Problem7Solution()
    let tree = rebuildTreeNode.buildTree([3,9,20,15,7], [9,3,15,20,7])
    print(tree?.printDLR(tree))
    print(tree?.printLDR(tree))
    print(tree?.printLRD(tree))
    
}


do {
    //46 -
    print(Problem46Solution().translateNum(506))
}


print(Problem58_2_Solution1().reverseLeftWords("abcdefg", 0))


print(Problem31Solution().validateStackSequences([1,2,3,4,5], [4,5,3,2,1]))


print(Problem53_2_Solution3().missingNumber([1]))
