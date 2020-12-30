class Solution {
public:
    int evalRPN(vector<string>& tokens) {
        stack<int> tokenStack;
        auto tokenIter = tokens.begin();
        while( tokenIter != tokens.end() ) {
            bool isValue{ true };
            int val{ 0 };
            try {
                val = stoi( *tokenIter );
            } catch( ... ) {
                isValue = false;
            }
            if( isValue ) {
                tokenStack.push( val );
            } else {
                string operatorToken = *tokenIter;
                auto back = tokenStack.top(); tokenStack.pop();
                auto head = tokenStack.top(); tokenStack.pop();
                if( operatorToken == "+" )
                    tokenStack.push( head + back );
                else if( operatorToken == "-" )
                    tokenStack.push( head - back );
                else if( operatorToken == "*" )
                    tokenStack.push( head * back );
                else if( operatorToken == "/" )
                    tokenStack.push( head / static_cast<float>( back ) );
                cout<< head << operatorToken << back << endl;
            }
            ++tokenIter;
        }
        return tokenStack.top();
    }
};