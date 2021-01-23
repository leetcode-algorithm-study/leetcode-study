def shorthead(sentence):
    x = len(sentence)
    for i in range(1, (x // 2)+1):
        if(x % i == 0): #문자의 총 길이를 나눌 수 있는 수,  즉 2배 3배 4배 정확하게 떨어지면
            s = sentence[0:i]
            count = int(x / i)
            if (s*count == sentence):
                return '('+s+')'
    return sentence

numerator=1
denominator=6
i=0
first=''
string=''
while i<10002:
    #몫과 나머지
    quotient=numerator//denominator
    remainder=numerator%denominator
    if remainder==0:
        string+=str(quotient)
        break
    else:
        if string=='':
            first+=str(quotient)+'.'
        numerator*=10
        string+=str(numerator//denominator)
        numerator=numerator%denominator
    if numerator==0:
        break
    i+=1
print(first+shorthead(string))