class Solution:
    def maxPoints(self, points: List[List[int]]) -> int:
        n = len(points)

        if n < 3:       #3개보다 적으면 직선밖에 없다.
            return n

        max_val = 0

        for i in points:
            d = {}
            dups = 0
            cur_max = 0
            for j in points:
                if i != j:
                    if j[0] == i[0]: 
                        slope = 'inf'
                    else:
                        slope = float(j[1] - i[1]) / float(j[0] - i[0])

                    d[slope] = d.get(slope, 0) + 1      #d.get() : slope가 있으면 할당 or 없으면 0반환
                    cur_max = max(cur_max, d[slope])
                else:
                    dups += 1
            max_val = max(max_val, cur_max + dups)
        return max_val
