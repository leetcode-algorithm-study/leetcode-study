class Solution {
public:
    vector<string> wordBreak(string s, vector<string>& wordDict) {
        vector<vector<int>> wordBreakIdx;
        vector<bool> wordBreak( s.size() + 1, false );
        wordBreak[0] = true;
        wordBreakIdx.push_back({0});
        for( auto i = 1; i < wordBreak.size(); ++i ) {
            for( auto j = 0; j < i; ++j ) {
                if( wordBreak[j] && 
                    std::find(wordDict.begin(), wordDict.end(), s.substr(j, i-j)) != wordDict.end()) {
                    wordBreak[i] = true;

                    vector<vector<int>> tmp;
                    for_each( wordBreakIdx.begin(), wordBreakIdx.end(), [i, j, &tmp, &wordBreakIdx]( auto& item ) {
                        if( *(item.end() - 1) == j ) {
                            auto& add = tmp.emplace_back(item); 
                            add.push_back(i);
                            // cout<<"add " ;
                            // for( auto i : add ) cout << i <<" ";
                            // cout << endl;
                        }
                    } );
                    
                    wordBreakIdx.insert(wordBreakIdx.end(), tmp.begin(), tmp.end());
                }
            }
        }
        
        vector<string> ret;
        stringstream ss;
        for( auto indexList : wordBreakIdx ) {
            if( indexList.back() != s.size() ) continue;
            ss.str(s.substr( 0, indexList.front() ));
            for( auto i = 1; i < indexList.size(); ++i ) {
                if( ss.rdbuf()->in_avail() != 0 ) ss << " ";
                ss << s.substr( indexList[i - 1], indexList[i] - indexList[i-1] );
            }
            ret.push_back(ss.str());
        }
        return ret;
    }
};
