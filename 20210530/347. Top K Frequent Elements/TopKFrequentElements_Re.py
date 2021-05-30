class Solution(object):
    def topKFrequent(self, nums, k):
        res = []
        dic = dict()

        for i in range(-100001, 100001):
            dic[i] = 0

        for num in nums:
            dic[num] += 1

        sdict = sorted(dic.items(), reverse=True, key=lambda item: item[1])
        # print(sdict)
        for i in range(k):
            res.append(sdict[i][0])

        res.sort()
        return res

# Runtime: 1760 ms, faster than 5.04% of Python online submissions for Top K Frequent Elements.
# Memory Usage: 65.9 MB, less than 5.27% of Python online submissions for Top K Frequent Elements.