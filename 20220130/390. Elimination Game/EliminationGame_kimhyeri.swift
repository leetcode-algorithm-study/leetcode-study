class Solution {
    func lastRemaining(_ n: Int) -> Int {
        var arr = Array(1...n)
        var left = true

        while true {
            if arr.count == 1 {
                return arr.first!
            } else {
                // 처음은 왼쪽
                if left {
                    var temp = [Int]()

                    while !arr.isEmpty {
                        if !arr.isEmpty {
                            arr.removeFirst()
                        }
                        if !arr.isEmpty {
                            temp.append(arr.removeFirst())
                        }
                    }
                    arr = temp

                    left = false
                }
                // 다음은 오른쪽
                else {
                    var temp = [Int]()

                    while !arr.isEmpty {
                        if arr.count % 2 == 0 {
                            if !arr.isEmpty {
                                temp.append(arr.removeFirst())
                            }
                            if !arr.isEmpty {
                                arr.removeFirst()
                            }
                        } else {
                            if !arr.isEmpty {
                                arr.removeFirst()
                            }
                            if !arr.isEmpty {
                                temp.append(arr.removeFirst())
                            }
                        }
                    }
                    arr = temp

                    left = true
                }
            }
        }
    }
}
