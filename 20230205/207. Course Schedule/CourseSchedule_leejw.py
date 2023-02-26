class Solution:
    def canFinish(self, numCourses: int, prerequisites: List[List[int]]) -> bool:
        # 과목별 선수강 과목들 리스트
        graph = [[] for _ in range(numCourses)]
        for (x, y) in prerequisites:
            graph[x].append(y)
        # print(graph)

        visited = [0] * numCourses
        def dfs(course_id):
            if visited[course_id] == -1:
                return False
            if visited[course_id] == 1:
                return True

            # 현재 노드 싸이클인지 검사
            visited[course_id] = -1
            for pre in graph[course_id]:
                result = dfs(pre)
                if result == False:
                    return False
            visited[course_id] = 1

            return True

        #
        # print(prerequisites)
        for i in range(0, numCourses):
            result = dfs(i)
            if result == False:
                return False

        #
        return True
