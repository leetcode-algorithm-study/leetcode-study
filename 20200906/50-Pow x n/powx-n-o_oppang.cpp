// origin : https://github.com/o-oppang/lets-solve-algorithm
/**
* Implement pow(x, n), which calculates x raised to the power n (i.e. xn).
* 
* Example 1:
* Input: x = 2.00000, n = 10
* Output: 1024.00000

* Example 2:
* Input: x = 2.10000, n = 3
* Output: 9.26100

* Example 3:
* Input: x = 2.00000, n = -2
* Output: 0.25000
* Explanation: 2-2 = 1/22 = 1/4 = 0.25
*/

class Solution {
public:
    double myPow(double x, int n) {
        auto exp = abs(n);
        auto pow = x;
        double retVal = 1.0;
        while( exp > 0 ) {
            if( exp & 0x1 ) {
                retVal *= pow;
            }
            exp = exp >> 1;
            pow *= pow;
        }
        return n > 0 ? retVal : 1.0 / retVal;
    }   
};
// Runtime: 0 ms, faster than 100.00% of C++ online submissions for Pow(x, n).
// Memory Usage: 5.9 MB, less than 66.73% of C++ online submissions for Pow(x, n).