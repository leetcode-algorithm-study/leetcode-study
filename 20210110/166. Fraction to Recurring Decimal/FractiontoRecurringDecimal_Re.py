def shorthead(sentence):
    x = len(sentence)
    for i in range(1, (x // 2)+1):
        if(x % i == 0): #문자의 총 길이를 나눌 수 있는 수,  즉 2배 3배 4배 정확하게 떨어지면
            s = sentence[0:i]
            count = int(x / i)
            if (s*count == sentence):
                return ['('+s+')',0]
    return [sentence,1]

numerator=-50
denominator=8
i=0
first=''        #3.
string=''       #(2323)

while i<10002:
    #몫과 나머지

    quotient=numerator/denominator
    remainder=numerator%denominator
    # if quotient<0:
    #     quotient+=1
    if remainder==0:
        string+=str(quotient)
        break
    else:
        if first=='':
            first+=str(quotient)+'.'
        numerator=(numerator-(denominator*quotient))*10
        string+=str(numerator//denominator)
        numerator=numerator%denominator
    if numerator==0:
        break
    i+=1
print(first)
print(string)
toggle=0

for i in range(5000):
    if shorthead(string[i:])[1]==0:
        result=first + string[:i] +shorthead(string[i:])[0]
        toggle=1
        break

if toggle==1:
    print(result)
else:
    result=first + shorthead(string)[0]
    print(result)