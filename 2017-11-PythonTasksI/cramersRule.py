#!/usr/bin/env python3
#-*- encoding:utf-8 -*-

def determinant(n):
    if len(n) < 3:
        return (n[0][0]*n[1][1]) - (n[0][1]*n[1][0])
    else:
        return (n[0][0] * n[1][1] * n[2][2]) + (n[0][1] * n[1][2] * n[2][0]) + (n[0][2] * n[1][0] * n[2][1]) - (n[0][0] * n[1][2] * n[2][1]) - (n[0][1] * n[1][0] * n[2][2]) - (n[0][2] * n[1][1] * n[2][0])

def cramersRule(M,N):
    if len(M) < 3:
        Mx = [[N[0],M[0][1]],[N[1],M[1][1]]]
        My = [[M[0][0],N[0]],[M[1][0],N[1]]]
        return [(determinant(Mx)/determinant(M)),(determinant(My)/determinant(M))]
    else:
        Mx = [[N[0],M[0][1],M[0][2]],[N[1],M[1][1],M[1][2]],[N[2],M[2][1],M[2][2]]]
        My = [[M[0][0],N[0],M[0][2]],[M[1][0],N[1],M[1][2]],[M[2][0],N[2],M[2][2]]]
        Mz = [[M[0][0],M[0][1],N[0]],[M[1][0],M[1][1],N[1]],[M[2][0],M[2][1],N[2]]]
        return [(determinant(Mx)/determinant(M)),(determinant(My)/determinant(M)),(determinant(Mz)/determinant(M))]

print(cramersRule([[1,2],[3,4]],[5,6]))
print(cramersRule([[1,2,3],[3,1,-3],[-3,4,7]],[-5,4,-7]))