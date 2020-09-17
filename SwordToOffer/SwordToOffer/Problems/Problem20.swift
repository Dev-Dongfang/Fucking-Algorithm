//
//  Problem20.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/11.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation



/**
 剑指 Offer 20. 表示数值的字符串
 请实现一个函数用来判断字符串是否表示数值（包括整数和小数）。例如，字符串"+100"、"5e2"、"-123"、"3.1416"、"-1E-16"、"0123"都表示数值，但"12e"、"1a3.14"、"1.2.3"、"+-5"及"12e+5.4"都不是。
 */


/**
 解决方案：
    这个题目没有什么捷径可走，老老实实的划分情况判断就是了。
 */
class Problem20Solution {
    /**
     Java的写法
     class Solution {
         private int index = 0;//全局索引
         private boolean scanUnsignedInteger(String str) {
             //是否包含无符号数
             int before = index;
             while(str.charAt(index) >= '0' && str.charAt(index) <= '9')
                 index++;
             return index > before;
         }
         private boolean scanInteger(String str) {
             //是否包含有符号数
             if(str.charAt(index) == '+' || str.charAt(index) == '-')
                    index++;
             return scanUnsignedInteger(str);
         }
         public boolean isNumber(String s) {
             //空字符串
             if(s == null || s.length() == 0)
                 return false;
             //添加结束标志
             s = s + '|';
             //跳过首部的空格
             while(s.charAt(index) == ' ')
                 index++;
             boolean numeric = scanInteger(s); //是否包含整数部分
             if(s.charAt(index) == '.') {
                 index++;
                 //有小数点，处理小数部分
                 //小数点两边只要有一边有数字就可以，所以用||，
                 //注意scanUnsignedInteger要在前面，否则不会进
                 numeric = scanUnsignedInteger(s) || numeric;
             }
             if((s.charAt(index) == 'E' || s.charAt(index) == 'e')) {
                 index++;
                 //指数部分
                 //e或E的两边都要有数字，所以用&&
                 numeric = numeric && scanInteger(s);
             }
             //跳过尾部空格
             while(s.charAt(index) == ' ')
                 index++;
             return numeric && s.charAt(index) == '|' ;
         }
     }


     */
}
