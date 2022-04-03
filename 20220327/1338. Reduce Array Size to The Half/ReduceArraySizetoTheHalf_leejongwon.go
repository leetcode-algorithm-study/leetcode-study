import (
"fmt"
"sort"
)

func minSetSize(arr []int) int {

//
numCountMap := make(map[int]int)
for _, v := range arr {
numCountMap[v]++
}

//
numCounts := make([]int, len(numCountMap))
for _, v := range numCountMap {
numCounts = append(numCounts, v)
}

//
sort.Ints(numCounts)
// sort.Slice(numCounts, func(i, j int) bool {
//     return numCounts[i] > numCounts[j]
// })

//
goalCount := len(arr) / 2   //arr.length is even
sumOfDup := 0
answer := 0

// for _, v := range numCounts {
for i:=len(numCounts)-1;i>=0;i-- {
if sumOfDup >= goalCount {
break
}
sumOfDup += numCounts[i]
answer += 1
}

return answer
}