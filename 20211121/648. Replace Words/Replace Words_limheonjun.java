/**
 * dictionary에 있는 단어 중 sentence에 있는 단어의 시작점이 되는 dictionary의 단어가 존재하면
 * dictionary의 단어 중 가장 짧은 단어를 찾아 sentence의 단어를 대체하기
 *
 * 1. dictionary에 있는 모든 단어를 trie에 삽입
 * 2. sentence에서 공백을 제거하여 단어만 남김
 * 3. sentence에 있는 단어를 순회하며 단어를 대체할 수 있는 문자열을 찾아 반환
 *
 * insert
 * - Map을 통해 이어지는 문자를 삽입
 *
 * 'cat'를 삽입하는 경우
 * root의 HashMap에 'c'라는 key가 존재하지 않기 때문에 'c'라는 key를 가진 TrieNode 생성
 * 'c'의 HashMap에 'a'라는 key가 존재하지 않기 때문에 'a'라는 key를 가진 TrieNode가 생성
 * 'a'의 HashMap에 't'라는 key가 존재하지 않기 때문에 't'라는 key를 가진 TrieNode가 생성
 * root -> c -> a -> t(true)
 * 맨 마지막 글자까지 삽입이 끝나면 현재 노드가 단어의 마지막이라는 것을 표시해주기 위해 isLast를 true로 만듦
 *
 * 'catt'를 삽입하는 경우
 * root의 HashMap에 'c'라는 key가 존재하기 때문에 'c'에 해당하는 TrieNode 반환
 * 'c'의 HashMap에 'a'라는 key가 존재하기 때문에 'a'에 해당하는 TrieNode 반환
 * 'a'의 HashMap에 't'라는 key가 존재하기 때문에 't'에 해당하는 TrieNode 반환
 * 't'의 HashMap에 't'라는 key가 존재하지 않기 때문에 't'라는 key를 가진 TrieNode가 생성
 * root -> c -> a -> t(true) -> t(true)
 *
 * getShortestWord
 * - HashMap에 글자가 한개씩 있는 글자를 합쳐서 문자로 확인해야 하기 때문에 StringBuilder 사용
 *
 * - 'cattle'에서 dictionary에 있는 글자 중 가장 짧은 글자를 찾는 경우
 *
 * currentChar = 'c'
 * root에 'c'가 존재하므로 if문 스킵
 * sb = 'c'
 * tn에는 'c'라는 key에 해당하는 TrieNode가 담기며, 이 TrieNode에는 'a'라는 key가 존재하는 HashMap이 있음
 * 'c'는 마지막 단어가 아니기 때문에 break문 스킵
 *
 * currentChar = 'a'
 * 'c'에 해당하는 TrieNode의 HashMap에는 'a'가 존재하므로 if문 스킵
 * sb = 'ca'
 * tn에는 'a'라는 key에 해당하는 TrieNode가 담기며, 이 TrieNode에는 't'라는 key가 존재하는 HashMap이 있음
 * 'a'는 마지막 단어가 아니기 때문에 break문 스킵
 *
 * currentChar = 't'
 * 'a'에 해당하는 TrieNode의 HashMap에는 't'가 존재하므로 if문 스킵
 * sb = 'cat'
 * tn에는 't'라는 key에 해당하는 TrieNode가 담기며, 이 TrieNode에는 't라는 key가 존재하는 HashMap이 있음
 * 't'는 마지막 단어이기도 하기 때문에 break를 통해 for문 탈출
 *
 * sb의 길이가 0이 아니고('cat'), tn.isLast가 true이기 때문에 sb.toString() => 'cat'를 반환
 *
 *
 * - 'by'에서 dictionary에 있는 글자 중 가장 짧은 글자를 찾는 경우
 *
 * currentChar = 'b'
 * root에 'b'가 존재하므로 if문 스킵
 * sb = 'b'
 * tn에는 'b'라는 key에 해당하는 TrieNode가 담기며, 이 TrieNode에는 'a'라는 key가 존재하는 HashMap이 있음
 * 'b'는 마지막 단어가 아니기 때문에 break문 스킵
 *
 * currentChar = 'y'
 * 'b'에 해당하는 TrieNode의 HashMap에는 'y'가 존재하지 않으므로 break
 * sb의 길이가 0은 아니지만('b'), 현재 tn.isLast가 false이기 때문에 현재 단어 그대로 반환 => 'b'를 반환
 *
 *
 * 시간복잡도
 * 단어의 길이 : l
 * dictionary의 개수 : n
 * sentence에 나오는 단어의 개수 : m
 *
 * dictionary에 있는 word를 삽입 => n * l
 * sentence를 공백제외 단어 배열로 만들기 => m
 * word를 구성하는 단어 중 가장 짧은 단어 찾기 => m * l
 * join => m
 * O(n*l + m + m*l + m) => O(n + 3m) => O(n + m)
 */
class Solution {
    public String replaceWords(List<String> dictionary, String sentence) {
		Trie trie = new Trie();

		for(String word : dictionary) {
			trie.insert(word);
		}

		String words[] = sentence.split(" ");
		for(int i=0; i< words.length; i++) {
			words[i] = trie.getShortestWord(words[i]);
		}

		return String.join(" ", words);
	}
}

class Trie {

	private TrieNode root;

	Trie() {
		root = new TrieNode();
	}

	public void insert(String word) {
		int length = word.length();
		TrieNode tn = root;

		for(int i=0; i<length; i++) {
			TrieNode temp = tn.getChildNodes().computeIfAbsent(word.charAt(i), c -> new TrieNode());
			tn = temp;
		}
		tn.setLast(true);
	}

	public String getShortestWord(String word) {
		int length = word.length();
		char currentChar;
		TrieNode tn = root;
		StringBuilder sb = new StringBuilder();

		for(int i=0; i<length; i++) {
			currentChar = word.charAt(i);

			if(!tn.getChildNodes().containsKey(currentChar)) {
				break;
			}

			sb.append(currentChar);
			tn = tn.getChildNodes().get(currentChar);
			
			if(tn.isLast()) break;
		}

		return sb.length() != 0 && tn.isLast() ? sb.toString() : word;
	}
}

class TrieNode {
	private Map<Character, TrieNode> childNodes = new HashMap<>();
	private boolean isLast;

	public Map<Character, TrieNode> getChildNodes() {
		return childNodes;
	}

	public boolean isLast() {
		return isLast;
	}

	public void setLast(boolean last) {
		isLast = last;
	}
}