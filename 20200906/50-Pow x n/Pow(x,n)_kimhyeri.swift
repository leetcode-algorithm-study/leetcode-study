//
//  Pow(x,n).swift
//  LeetCode
//
//  Created by 김혜리 on 2020/09/06.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 50. Pow(x, n)

func myPow(_ x: Double, _ n: Int) -> Double {
    if n == 0 {
        return 1
    }
    
    if n == 1 {
        return x
    }
    
    if n < 0 {
        return myPow(1.0 / x, n * -1)
    } else {
        if n % 2 == 0 {
            let res = myPow(x, n / 2)
            return res * res
        } else {
            return myPow(x, n - 1) * x
        }
    }
}
print(myPow(0.00001, 2147483647))

print(myPow(2.00000,10))
// Output: 1024.00000

print(myPow(2.10000,3))
// Output: 9.26100

print(myPow(2.00000,-2))
// Output: 0.25000
