// origin - https://github.com/o-oppang/lets-solve-algorithm
/**
 * Given a collection of intervals, merge all overlapping intervals.
 * 
 * Example 1:
 * 
 * Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
 * Output: [[1,6],[8,10],[15,18]]
 * Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
 * Example 2:
 * 
 * Input: intervals = [[1,4],[4,5]]
 * Output: [[1,5]]
 * Explanation: Intervals [1,4] and [4,5] are considered overlapping.
 * NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
 * 
 *  
 * 
 * Constraints:
 * 
 * intervals[i][0] <= intervals[i][1]
 **/

class Solution {
public:
    vector<vector<int>> merge(vector<vector<int>>& intervals) {
        vector<vector<int>> destVectors;
        for( auto& target : intervals ) {
            bool isMerge = tryMerge(destVectors, target);
            if( !isMerge ) destVectors.push_back( target );
        }
        
        return destVectors;
    }
    
    bool tryMerge(vector<vector<int>>& destVectors, vector<int>& target) {
        bool updated = false;
        for( auto destIter = destVectors.begin(); destIter != destVectors.end(); ++destIter ) {
            auto dest = *destIter;
            if( dest[0] == target[0] && dest[1] == target[1] ) return true;
            
            if( ( dest[0] >= target[0] && dest[0] <= target[1] ) ||
              ( dest[1] >= target[0] && dest[1] <= target[1] ) ||
              ( dest[0] < target[0] && dest[1] > target[1] )) {
                destVectors.erase( std::find(destVectors.begin(), destVectors.end(), dest) );
                vector<int> newVal = { min(dest[0], target[0]), max(dest[1], target[1]) };
                if( !tryMerge(destVectors, newVal) ) destVectors.push_back( newVal );
                updated = true;
            }
        }
        
        return updated;
    }
};

// Runtime: 88 ms, faster than 23.80% of C++ online submissions for Merge Intervals.
// Memory Usage: 21.2 MB, less than 17.51% of C++ online submissions for Merge Intervals.