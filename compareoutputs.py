obtainedoutputs=[]
expectedoutputs=[]
with open("obtainedoutputs.txt", "r") as file: 
    for line in file:
        obtainedoutputs.append(float((line.strip())))
with open("expectedoutputs.txt", "r") as file: 
    for line in file:
        expectedoutputs.append(float((line.strip())))
averageerror=0
for i in range(len(expectedoutputs)):
    error=abs(expectedoutputs[i]-obtainedoutputs[i])*100/expectedoutputs[i]
    averageerror+=error
averageerror/=len(expectedoutputs)
print(expectedoutputs[:10])
print(obtainedoutputs[:10])
print(averageerror)