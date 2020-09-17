剑指Offer中题目练习与解析

中文版的Leetcode上面有剑指Offer上全部的题目了，可以参照上面的练习
[https://leetcode-cn.com/problemset/lcof](https://leetcode-cn.com/problemset/lcof)











Tips:
1. Swift中，Int类型是64b。8个字节。
2. **巧用 n \& (n - 1)**：
**(n - 1)解析**： 二进制数字 nn 最右边的 11 变成 00 ，此 11 右边的 00 都变成 11 。
**n \& (n - 1) 解析**： 二进制数字 nn 最右边的 11 变成 00 ，其余不变。
3.^操作的特性：对于两个操作数的每一位，相同结果为00，不同结果为11。那么在计算过程中，成对出现的数字的所有位会两两抵消为00，最终得到的结果就是那个出现了一次的数字。
4.判断数字最后一位是不是1：x&1==1



3.Character字符比较效率比Int比较低

如下代码所示，AC时间是112ms，如果将循环中ascii编码比较变成Character比较，那将是四百多ms。

详见leetcode提交记录：https://leetcode-cn.com/submissions/detail/106586168/

```
class Solution {
    func firstUniqChar(_ s: String) -> Character {
        if s.count == 0 {
            return " "
        }
        var array:Array<Int> = Array.init(repeating: 0, count: 123)
        var indexArray:Array<Int> = []
        
        for item in s {
            let index = Int(item.asciiValue!)
            let value = array[index]
            if value == 0 {
                array[index] += 1
                indexArray.append(index)
            } else if value == 1 {
                array[index] += 1
            }
        }
        for item in indexArray {
            if array[item] == 1 {
                return Character(UnicodeScalar(item)!)
            }
        }
        return " "
    }
}
```

