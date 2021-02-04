class Line {
    public:
    Line(vector<int>& l0, vector<int>& l1) {
        assert( l0.size() == 2 && l1.size() == 2 );
        if( l0[0] != l1[0] && l0[1] != l1[1] ) {
            slope = ( l1[1] - l0[1] ) / static_cast<float>( l1[0] - l0[0] );
            yIntercept = l1[1] - slope * l1[0];
            if(slope == -numeric_limits<float>::infinity()) slope = numeric_limits<float>::infinity();
            if(yIntercept == -numeric_limits<float>::infinity()) yIntercept = numeric_limits<float>::infinity();
        }
    }
    
    float slope;
    float yIntercept;
};

class Solution {
public:
    int maxPoints(vector<vector<int>>& points) {
        if( points.size() == 0 ) return 0;
        map<pair<float, float>, int> lineMap;
        auto maxCount = 0;
        for( auto i = points.begin(); i < points.end(); ++i ) {
            for( auto j = points.begin() + (i - points.begin()) + 1; j < points.end(); ++j ) {
                auto l = Line(*i, *j);
                auto cnt = ++lineMap[{l.slope, l.yIntercept}];
                maxCount = max(maxCount, cnt);
            }
        }
        return (1 + sqrt(1 + 4 * 2 * maxCount) ) / 2 ;
    }
};
