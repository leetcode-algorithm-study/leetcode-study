import null as null


class MedianFinder(object):

    def __init__(self):
        """
        initialize your data structure here.
        """
        self.arr=[]

    def addNum(self, num):
        """
        :type num: int
        :rtype: None
        """
        self.arr.append(num)
        self.arr.sort()
    def findMedian(self):
        """
        :rtype: float
        """
        if len(self.arr)==0:
            return None
        if len(self.arr)%2==0:
            return (self.arr[(len(self.arr)//2)-1]+self.arr[len(self.arr)//2])/2.0
        else:
            return self.arr[(len(self.arr)//2)]*1.0


# Runtime: 1504 ms, faster than 20.70% of Python online submissions for Find Median from Data Stream.
# Memory Usage: 25.8 MB, less than 73.95% of Python online submissions for Find Median from Data Stream.