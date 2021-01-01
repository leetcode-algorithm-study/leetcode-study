class Solution:
    def evalRPN(self, tokens: List[str]) -> int:
        operator = ["+", "-", "*", "/"]
        stack = []

        for token in tokens:
            if token not in operator:  # 숫자를 뜻한다.
                stack.append(int(token))
            else:  # 문자를 뜻한다.(operator)
                secondString = stack.pop()
                firstString = stack.pop()

                if token == '+':
                    stack.append(firstString + secondString)
                elif token == '-':
                    stack.append(firstString - secondString)
                elif token == '*':
                    stack.append(firstString * secondString)
                elif token == '/':
                    stack.append(int(firstString / secondString))
        return stack[0]

# Runtime: 56 ms, faster than 97.95% of Python3 online submissions for Evaluate Reverse Polish Notation.
# Memory Usage: 14.5 MB, less than 76.48% of Python3 online submissions for Evaluate Reverse Polish Notation.