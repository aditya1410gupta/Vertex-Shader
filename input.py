import numpy as np
import math
a=[[2.7695 ,  -4.5886,   -5.9392,  -60.0000],
    [2.5857 ,   8.7379 ,  -5.5451 , -26.6675],
   [-1.8126 ,        0 ,  -0.8452 ,  -1.0000],
   [-0.9063  ,       0 ,  -0.4226  ,  2.5000]]
b=[0.15,0.12,-0.32,1]

def float16decimaltobinary(value):
    if value==0:
        return "0000000000000000"
    signbit='0'
    if value<0:
        signbit='1'
        value=(-value)
    fractionalpart,integerpart=math.modf(value)
    integerpart=int(integerpart)
    binary_of_integer_part=bin(integerpart)[2:]
    binary_of_fraction_part=""
    for i in range(40):
        fractionalpart*=2
        if fractionalpart>=1:
            fractionalpart-=1
            binary_of_fraction_part+='1'
        else:
            binary_of_fraction_part+='0'
    finalbinaryvalue=binary_of_integer_part+'.'+binary_of_fraction_part
    decimali=-1
    onei=-1
    for i in range(len(finalbinaryvalue)):
        if decimali==-1 and finalbinaryvalue[i]=='.':
            decimali=i
        if onei==-1 and finalbinaryvalue[i]=='1':
            onei=i
        if decimali!=-1 and onei!=-1:
            break
    # print(onei)
    # print(decimali)
    if onei>decimali:
        exponent=decimali-onei+15
    else:
        exponent=decimali-onei+14
    exponentbits=bin(exponent)[2:].zfill(5)
    mantissabits=""
    for i in range(onei+1,len(finalbinaryvalue)):
        if(len(mantissabits)==10):
            break
        if finalbinaryvalue[i]!='.':
            mantissabits+=finalbinaryvalue[i]
    # print(finalbinaryvalue)
    finalvalue=signbit+exponentbits+mantissabits
    return finalvalue
def float16binarytodecimal(value):
    if value=="0000000000000000":
        return 0
    exponent=value[1:6]
    mantissa='1'+value[6:]
    actualexponent=int(exponent,2)-15
    actualmantissa=int(mantissa,2)
    finalvalue=(2**(actualexponent-10))*actualmantissa
    if value[0]=='1':
        finalvalue=-finalvalue
    return finalvalue

lines_to_write=[]
for i in range(4):
    for j in range(4):
        lines_to_write.append(float16decimaltobinary(a[i][j])+'\n')
for i in range(4):
    lines_to_write.append(float16decimaltobinary(b[i])+'\n')
with open("binarydata.txt", "w") as file: 
    file.writelines(lines_to_write)
with open("binarydata2.txt", "r") as file: 
    for line in file:
        print(float16binarytodecimal(line.strip()))