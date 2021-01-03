class Solution {
public:
    int maxProduct(vector<int>& nums) {
        vector<int> candidates;
        auto maximum = INT_MIN;
        for( auto val = nums.begin(); val != nums.end(); ++val ) {
            for( auto& candidate : candidates ) {
                candidate *= *val;
                maximum = max( maximum, candidate );
            }
            candidates.push_back(*val);
            maximum = max( maximum, *val );
        }
        return maximum;
    }
};
// 186 / 187 test cases passed.