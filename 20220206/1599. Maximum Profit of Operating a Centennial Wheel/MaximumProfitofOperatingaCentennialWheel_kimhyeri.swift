//당신은 4개의 곤돌라가 있는 Centennial Wheel의 운영자이며 각 곤돌라에는 최대 4명이 탈 수 있는 공간이 있습니다.
//고객의 길이가 n인 배열 고객이 주어집니다. 여기서 고객[i]은 i번째 회전(0-인덱싱) 직전에 도착하는 신규 고객의 수입니다. 이것은 고객[i] 고객이 도착하기 전에 휠을 i번 회전해야 함을 의미합니다. 각 고객은 곤돌라에 탑승할 때 boardingCost 달러를 지불하고 곤돌라 도착하면 하차합니다.
//끝까지 안가도 언제든지 휠을 멈출 수 있습니다. 고객 서비스를 중단하기로 결정한 경우 모든 순환은 무료입니다. 현재 4명 이상의 승객이 운전석에 대기 중인 경우 4명만 곤돌라에 탑승하고 나머지는 다음 회전을 기다립니다.
//수익을 극대화하기 위해 수행해야 하는 최소 회전 수를 반환합니다. 이익이 양수인 시나리오가 없으면 -1을 반환합니다.

class Solution {
    func minOperationsMaxProfit(_ customers: [Int], _ boardingCost: Int, _ runningCost: Int) -> Int {
        // 총 기다리는 인원
        var waiting = 0
        // 이익 value
        var value = 0
        // 최대 이익 value
        var maxValue = 0
        // 회전 횟수
        var cycle = 0
        var answer = -1

        // 한 바퀴 돌면서 발생하는 이익 계산 함수
        func run() {
            // 한 번에 탑승 가능한 수 최대 4
            let boarding = min(waiting, 4)
            waiting = waiting - boarding
            value = value + (boarding * boardingCost - runningCost)
            cycle = cycle + 1

            // 최대 이익 갱신
            // 음수면 갱신 안됨 > 0
            if value > maxValue {
                maxValue = value
                answer = cycle
            }
        }

        for customer in customers {
            waiting = waiting + customer
            run()
        }

        while waiting > 0 {
            run()
        }

        return answer
    }
}
