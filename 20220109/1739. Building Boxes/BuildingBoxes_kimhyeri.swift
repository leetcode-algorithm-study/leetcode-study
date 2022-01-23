// 룰
// 바닥에는 아무곳이나 놓을 수 있음
// x를 y박스 위에 올릴려면 4면이 다른 박스에 인접하거나 벽에 있어야함

class Solution {
    func minimumBoxes(_ n: Int) -> Int {
        var box = 0
        var ans1 = 0
        var ans2 = 0

        // 층마다 쌓는 박스
        while box + (ans1+1) * (ans1+2) / 2 <= n {
            box = box + (ans1+1) * (ans1+2) / 2
            ans1 = ans1 + 1
        }

        // 나머지 박스
        while box < n {
            ans2 = ans2 + 1
            box = box + ans2
        }
        
        return ans1 * (ans1+1) / 2 + ans2
    }
}

// 3

// 1
// 3

// 1
// 3
// 6

// 1
// 3
// 6
// 10
