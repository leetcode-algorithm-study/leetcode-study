class Solution:
    def isValid(self, s: str) -> bool:
        # 첫번째 풀이는 전체 순회후 개수 및 짝을 맞추려고 해서 복잡해짐. 
        # 루프를 한번 순회하면서 open_bracket 인 경우 stack 에 추가. 닫힌게 나오면 스택과 비교
        bracket_stack = []

        bracket_mapping = {
            ')': '(',
            '}': '{',
            ']': '['
        }

        for bracket in s: 
            if bracket in ('(', '{', '['):
                bracket_stack.append(bracket)
            elif bracket in (')', '}', ']'):
                if not bracket_stack or bracket_stack.pop() != bracket_mapping[bracket]:
                    return False
            else:
                return False
        
        return not bracket_stack