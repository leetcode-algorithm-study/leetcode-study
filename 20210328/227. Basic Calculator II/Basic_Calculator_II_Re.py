class Solution(object):
    def calculate(self, s):
        number = []
        operator = []
        nums = ""
        for i in s:
            if i == "+" or i == "-" or i == "*" or i == "/":
                number.append(int(nums))
                nums = ''
                operator.append(i)
            else:
                nums += i
        number.append(int(nums))

        stackNumbers = [number[0]]
        stackOperators = []

        for i in range(len(operator)):
            if operator[i] == '+' or operator[i] == "-":
                stackNumbers.append(number[i + 1])
                stackOperators.append(operator[i])
            elif operator[i] == "*":
                stackNumbers.append(stackNumbers.pop() * number[i + 1])
            elif operator[i] == "/":
                stackNumbers.append(stackNumbers.pop() // number[i + 1])

        result = stackNumbers[0]
        for i in range(len(stackOperators)):
            if stackOperators[i] == "+":
                result += stackNumbers[i + 1]
            else:
                result -= stackNumbers[i + 1]
        return result

# Runtime: 128 ms, faster than 41.25% of Python online submissions for Basic Calculator II.
# Memory Usage: 21 MB, less than 33.38% of Python online submissions for Basic Calculator II.