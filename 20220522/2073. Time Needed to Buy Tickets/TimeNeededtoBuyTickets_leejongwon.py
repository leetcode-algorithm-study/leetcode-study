class Solution:
    def timeRequiredToBuy(self, tickets: List[int], k: int) -> int:
        
        seconds = 0
        
        while tickets[k] > 0:
            for i in range(0, len(tickets)):
                if tickets[i] > 0 and tickets[k] > 0:
                    seconds += 1
                    tickets[i] -= 1    
        
        return seconds        