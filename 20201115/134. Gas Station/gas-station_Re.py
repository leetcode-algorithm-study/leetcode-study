class Solution:
    def canCompleteCircuit(self, gas: List[int], cost: List[int]) -> int:
        newResult=[]
        newLast=[]
        newGas=[]
        newCost=[]
    
        def calc(startOne , gasOne, costOne, lastOne):
            one=startOne
            for i in range(len(gasOne)):
                if one-costOne[i]+gasOne[i]>0:
                    one=one-costOne[i]+gasOne[i]
                else:
                    return -1
            if one-lastOne>=0:
                return 1
            else:
                return -1
    
        for i in range(len(gas)):
            start=gas[i]
            if i==0:
                last=cost[-1]
            else:
                last=cost[i-1]
            tempGas=gas[i+1:]+gas[:i]
            if i==0:
                tempCost=cost[i:len(gas)-1]
            else:
                tempCost=cost[i:]+cost[:i-1]
            
            newResult.append(start)
            newGas.append(tempGas)
            newCost.append(tempCost)
            newLast.append(last)
        print(newResult)
        print(newLast)
        print(newGas)
        print(newCost)    
        temp=-1
        for i in range(len(gas)):
            temp=calc(newResult[i] , newGas[i], newCost[i], newLast[i])
            print("보자 : ",temp)
            if temp==1:
                return i
        
        return -1
