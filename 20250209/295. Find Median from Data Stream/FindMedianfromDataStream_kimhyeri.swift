// TLE

class MedianFinder {
    var collector: [Int]

    init() {
        collector = [Int]()
    }
    
    func addNum(_ num: Int) {
        collector.append(num)
    }
    
    func findMedian() -> Double {
        guard !collector.isEmpty else { return 0.0 }

        let sortedCollector = collector.sorted()
        let count = sortedCollector.count
        let mid = count / 2

        if count % 2 == 1 {
            return Double(sortedCollector[mid])
        } else {
            return (Double(sortedCollector[mid - 1]) + Double(sortedCollector[mid])) / 2.0
        }
    }
}

class MedianFinder {
    private var collector: [Int] = []

    func addNum(_ num: Int) {
        // 이진 탐색으로 적절한 위치 찾기
        var left = 0, right = collector.count
        while left < right {
            let mid = (left + right) / 2
            if collector[mid] < num {
                left = mid + 1
            } else {
                right = mid
            }
        }
        collector.insert(num, at: left)
    }

    func findMedian() -> Double {
        let mid = count / 2

        if collector.count % 2 == 1 {
            return Double(collector[mid])
        } else {
            return (Double(collector[mid - 1]) + Double(collector[mid])) / 2.0 
        }
    }
}

/**
 * Your MedianFinder object will be instantiated and called as such:
 * let obj = MedianFinder()
 * obj.addNum(num)
 * let ret_2: Double = obj.findMedian()
 */