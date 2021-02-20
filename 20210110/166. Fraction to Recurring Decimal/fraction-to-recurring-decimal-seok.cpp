class Solution {
public:
	string fractionToDecimal(int numerator, int denominator) {
		if (numerator == 0)    return "0";

		if ((long)numerator % (long)denominator == 0)
		{
			long ans = (long)numerator / (long)denominator;
			return to_string(ans);
		}


		string st_dec;
		string st_cal;
		unordered_map<int, int> recurMap;

		if (numerator > 0 && denominator < 0 ||
			numerator < 0 && denominator > 0)
		{
			st_dec += "-";
		}


		long num_abs = abs(numerator);
		long den_abs = abs(denominator);
		long quot = num_abs / den_abs;
		bool recur = false;
		int recurIdx = 0;
		st_dec += to_string(quot);
		st_dec += ".";

		while (num_abs % den_abs != 0 && recur==false)
		{	
			num_abs = num_abs % den_abs;
			num_abs *= 10;
			quot = num_abs / den_abs;

			if (recurMap.find(num_abs) != recurMap.end())
			{
				recur = true;
				recurIdx = recurMap[num_abs];
			}
            else
            {
			    recurMap.insert(pair<int, int>(num_abs, st_cal.size()));
			    st_cal += to_string(quot);                
            }
		}

		for (int i = 0; i < st_cal.size(); i++)
		{
			if (i==recurIdx && recur)
			{
				st_dec += "(";
			}
			st_dec += st_cal[i];
		}
		if (recur)
		{
			st_dec += ")";
		}
		return st_dec;
	}
};
