class Solution {
public:
    string largestNumber(vector<int>& nums) {
         std::sort(nums.begin(), nums.end(), [](int i, int j){
             auto ipj = to_string(i) + to_string(j);
             auto jpi = to_string(j) + to_string(i);
             for(auto iter = 0; iter < ipj.size(); ++iter) {
                 if( ipj[iter] != jpi[iter] ) {
                     return ipj[iter] > jpi[iter];
                 }
             }
             return false;
         });
        
        stringstream ss;
        auto init = false;
        for( auto& num : nums ) {
            if( num == 0 && init == false ) continue;
            ss << to_string( num );
            init = true;
        }
        auto str = ss.str();
        return str.empty() ? "0" : ss.str(); 
    }
};
// Runtime: 12 ms, faster than 55.02% of C++ online submissions for Largest Number.
// Memory Usage: 11.1 MB, less than 90.09% of C++ online submissions for Largest Number.
