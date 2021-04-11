class Solution:
    def divide(self, dividend: int, divisor: int) -> int:
        minus1=0
        minus2=0
        if dividend<0:
            minus1=1
        if divisor<0:
            minus2=1
        dividend=abs(dividend)
        divisor=abs(divisor)
        
        a=0
        
        while 1:
            if dividend-divisor<0:
                break
            else:
                dividend=dividend-divisor
                a+=1
        print(a)
        if minus1==1 and minus2==1:
            return a
        elif minus1==1 and minus2==0:
            return -a
        elif minus1==0 and minus2==1:
            return -a
        else:
            return a
