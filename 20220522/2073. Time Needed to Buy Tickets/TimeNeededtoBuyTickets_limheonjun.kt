/**
i번재 사람이 tickets[i]만큼의 티켓을 구매하고 싶어함
k번째 있는 사람이 티켓을 모조리 구매하는데 걸리는 시간

k번재 있는 값이 0이 되도록 해야함
모든 수 중에는 tickets[k]보다 작거나 큰 값이 존재
작은 경우 해당 값을 더해주면 되고, 큰 경우에는 tickets[k]값을 더해주면 됨

tickets[k]값이 작아지는 만큼 i>k인 경우에도 적용
*/

class Solution {
    fun timeRequiredToBuy(tickets: IntArray, k: Int): Int {
        var result = 0
        
        for(i in tickets.indices) {
            result += if(tickets[i] < tickets[k]) tickets[i]
            else tickets[k]
            
            if (i > k && tickets[i] >= tickets[k]) result-- 
        }
        
        return result
    }
}