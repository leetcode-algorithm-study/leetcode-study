class Solution {
public:
    int canCompleteCircuit(vector<int>& gas, vector<int>& cost) {
        auto gasGage = vector<int>(gas.size(), 0);
        int sum = 0;
        for( auto i = 0; i < gas.size(); ++i ) {
            gasGage[i] = gas[i] - cost[i];
            sum += gasGage[i];
        }
        if( sum < 0 ) return -1;
        for( auto i = 0; i < gas.size(); ++i ) {
            if( gasGage[i] < 0 ) continue;
            sum = 0;
            for( auto j = 0; j < gas.size() && sum >= 0; ++j ) {
                auto index = ( i + j ) % gas.size();
                sum += gasGage[index];
            }
            if( sum >= 0 ) return i;
        }
        assert(false);
        return -100;
    }
};