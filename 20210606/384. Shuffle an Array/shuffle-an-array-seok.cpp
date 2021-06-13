class Solution {
public:
    vector<int> v;
    vector<int> origin;
    Solution(vector<int>& nums) {
        v = origin = nums;
    }
    
    /** Resets the array to its original configuration and return it. */
    vector<int> reset() {
        return v = origin;
    }
    
    /** Returns a random shuffling of the array. */
    vector<int> shuffle() {
        int n = v.size();
        while(n--)
        {
            int randIdx1 = rand()%origin.size();
            int randIdx2 = rand()%origin.size();
            swap(v[randIdx1],v[randIdx2]);
        }
        
        return v;
    }
};
