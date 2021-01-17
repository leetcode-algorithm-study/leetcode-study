class Solution {
public:
    string fractionToDecimal(int numerator, int denominator) {
        stringstream ss; 
        if( numerator / static_cast<float>( denominator ) < 0.0 && numerator / static_cast<float>( denominator ) > -1.0  ) ss << "-";
        ss << to_string( numerator / static_cast<long>( denominator ) );
        numerator = abs( numerator );
        denominator = abs( denominator );
        
        vector<int> remains;
        long remain = numerator % denominator;
        
        stringstream fraction{};
        while( remain != 0 ) {
            remain *= 10;
            auto same = find(remains.begin(), remains.end(), remain);
            if( same != remains.end() ) {
                auto fractionStr = fraction.str();
                fraction.str("");
                auto index = same - remains.begin();
                fraction << fractionStr.substr( 0, index ) << "(" << fractionStr.substr( index, remains.size() - index ) << ")";
                break;    
            }
            remains.push_back( remain );
            fraction << to_string( remain / denominator );
            remain %= denominator;
        }
        if( !fraction.str().empty() ) ss << "." << fraction.str();
        return ss.str();
    }
};

// Runtime: 8 ms, faster than 55.57% of C++ online submissions for Fraction to Recurring Decimal.
// Memory Usage: 6.8 MB, less than 46.12% of C++ online submissions for Fraction to Recurring Decimal.