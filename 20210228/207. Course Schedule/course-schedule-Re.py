class Solution(object):
    def canFinish(self, numCourses, prerequisites):
        check = {i:[] for i in range(numCourses)}
        for a, b in prerequisites:
            check[a].append(b)
        visit = [-1] * numCourses

        print(check)
        def dfs(v):
            print("v : ", v)
            if visit[v] == 1:
                return True
            visit[v] = 0
            for j in check[v]:
                if visit[j] == 0 or not dfs(j):     #도돌이표 되는 곳 발견
                    return False
            visit[v] = 1
            return True

        for i in range(numCourses):
            print("W")
            if visit[i] == -1 and not dfs(i):   #방문한 적 없고 dfs==False
                print(visit)
                return False
            print(visit)
        print(visit)
        return True


numCourses = 2
prerequisites = [[1,0],[0,1]]

s=Solution()
print(s.canFinish(numCourses, prerequisites))

# Runtime: 80 ms, faster than 63.42% of Python online submissions for Course Schedule.
# Memory Usage: 16.3 MB, less than 33.29% of Python online submissions for Course Schedule.