def maxPoints(points):
    n = len(points)

    if n < 3:
        return n

    max_val = 0

    for i in points:

        d = {}
        dups = 0
        cur_max = 0

        for j in points:
            if i != j:
                if j[0] == i[0]:  # vertical line
                    slope = 'inf'
                else:
                    slope = float(j[1] - i[1]) / float(j[0] - i[0])
                d[slope] = d.get(slope, 0) + 1
                cur_max = max(cur_max, d[slope])
            else:
                print("흠", i,j)
                dups += 1

        max_val = max(max_val, cur_max + dups)
        print("보자", dups, max_val, d)
    return max_val


# Driver code
points = [[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]
print(maxPoints(points)) 