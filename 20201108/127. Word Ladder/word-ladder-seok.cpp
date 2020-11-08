/*
DFS, but TLE
Last executed input:
"qa"
"sq"
["si","go","se","cm","so","ph","mt","db","mb","sb","kr","ln","tm","le","av","sm","ar","ci","ca","br","ti","ba","to","ra","fa","yo","ow","sn","ya","cr","po","fe","ho","ma","re","or","rn","au","ur","rh","sr","tc","lt","lo","as","fr","nb","yb","if","pb","ge","th","pm","rb","sh","co","ga","li","ha","hz","no","bi","di","hi","qa","pi","os","uh","wm","an","me","mo","na","la","st","er","sc","ne","mn","mi","am","ex","pt","io","be","fm","ta","tb","ni","mr","pa","he","lr","sq","ye"]
*/
class Solution {
private:
	int minPath = INT_MAX;
public:
	void findNext(string currWord, string endWord, vector<string>& wordList, set<string>& visitSet){
		if (currWord == endWord)
		{
			int visitSize = visitSet.size();
			if (visitSize < minPath)
			{
				minPath = visitSize;
				return;
			}
			return;
		}
		if (visitSet.size() == wordList.size())
		{
			return;
		}
		int size = currWord.size();
		int threshold = size - 1;
		int cnt = 0;

		for (int i = 0; i < wordList.size(); i++)
		{
			if (currWord == wordList[i])	continue;
			if (visitSet.find(wordList[i]) != visitSet.end())	continue;
			for (int j = 0; j < size; j++)
			{
				if (currWord[j] == wordList[i][j])
					cnt++;
				
			}
			if (cnt == threshold)
			{
				visitSet.insert(wordList[i]);
				findNext(wordList[i], endWord, wordList, visitSet);
				visitSet.erase(wordList[i]);
			}
			cnt = 0;
		}

	}
	int ladderLength(string beginWord, string endWord, vector<string>& wordList) {
		set<string> visitSet;
		visitSet.insert(beginWord);
		findNext(beginWord, endWord, wordList, visitSet);

		return (minPath == INT_MAX) ? 0 : minPath;
	}
};

