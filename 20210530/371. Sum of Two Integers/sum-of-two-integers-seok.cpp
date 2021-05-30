//Runtime: 0 ms, faster than 100.00% of C++ online submissions for Sum of Two Integers.
//Memory Usage: 5.8 MB, less than 71.61% of C++ online submissions for Sum of Two Integers.

class Solution {
public:
    int getSum(int a, int b) {
        if(b>0)
        {
            while(b)
            {
                a++;
                b--;
            }
        }
        else
        {
            while(b)
            {
                a--;
                b++;
            }            
        }
        return a;
    }
};
