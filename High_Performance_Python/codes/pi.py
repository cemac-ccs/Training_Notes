import math

@profile
def GregLeib (itt):
    j=0
    pi=0.0

    for i in range(1,itt):
        num=(i*2)-1
        j += 1
        if (j % 2 == 0):
            m = -1
        else: 
            m = 1

        pi = pi + (m * (4.0/num))

    return [pi]

@profile
def Nilak (itt):
    j=0
    pi=3.0

    for i in range(1,itt):
        num=i*2
        j+=1
        if (j % 2 == 0):
            m = -1
        else:
            m = 1

        pi = pi + (m * (4.0/(num*(num+1)*(num+2))))

    return [pi]

@profile
def Combine (itt):
    j=0
    piN=3.0
    piG=0.0

    for i in range(1,itt):
        numN=i*2
        numG=(i*2)-1
        j+=1
        if (j % 2 == 0):
            m = -1
        else:
            m = 1

        piG = piG + (m * (4.0/numG))
        piN = piN + (m * (4.0/(numN*(numN+1)*(numN+2))))

    return [piN, piG]




print (GregLeib(500000))
print (Nilak (500000))
print (Combine(500000))
