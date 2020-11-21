class Solution {
public:
    string minWindow(const string s, const string t) {
        vector<pair<size_t, size_t>> indices; //{first pos, string size}
        vector<string> remaining; // remaining letters
        std::size_t found = s.find_first_of( t );
        while( found != string::npos )
        {
            string str = t;
            indices.push_back({found, INT_MAX});
            remaining.push_back(str);    
            
            for( auto i = 0; i < remaining.size(); ++i ) { 
                if( remaining[i].size() == 0 ) continue;
                auto pos = remaining[i].find_first_of( s[found]);
                if( pos != string::npos ) remaining[i].erase(remaining[i].begin() + pos );
                if( remaining[i].size() == 0 ) {
                    indices[i].second = found - indices[i].first + 1;
                }
            }
            
            found = s.find_first_of( t,found+1 );
        }
        
        pair<size_t, size_t> minSize = {0, INT_MAX};
        for( auto index : indices ) { 
            if(index.second < minSize.second ) minSize = index;
        }
        
        return minSize.second == INT_MAX ? ""s : s.substr(minSize.first, minSize.second);
    }
};