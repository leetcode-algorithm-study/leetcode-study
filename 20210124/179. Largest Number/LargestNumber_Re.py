class Node(object):
    def __init__(self, key, data=None):
        self.key = key
        self.data = data
        self.dataNum = 0
        self.children = {}


class Trie(object):
    def __init__(self):
        self.head = Node(None)

    def insert(self, string):
        curr_node = self.head

        for char in string:
            if char not in curr_node.children:
                curr_node.children[char] = Node(char)

            curr_node = curr_node.children[char]

        curr_node.data = string
        curr_node.dataNum +=1

    def search(self, string):
        curr_node = self.head

        for char in string:
            if char in curr_node.children:
                curr_node = curr_node.children[char]
            else:
                return False

        if (curr_node.data != None):
            return True

value=[9,8,7,6,5,4,3,2,1,0]
nums = [3,30,34,5,9]
result=""
def largestNumber(nums):
    global result
    t = Trie()
    for num in nums:
        t.insert(str(num))

    def dfs(address):
        global result
        for val in value:
            if str(val) in address.children.keys():
                dfs(address.children[str(val)])
                if (address.children[str(val)].data!=None):
                    for i in range(address.children[str(val)].dataNum):
                        result+=address.children[str(val)].data

                dfs(address.children[str(val)])

    dfs(t.head)
    print(result)


largestNumber(nums)

























