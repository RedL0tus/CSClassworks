#!/usr/bin/env python3
#-*- encoding:utf-8 -*-

def determinant(n):
    if len(n) < 3:
        return (n[0][0]*n[1][1]) - (n[0][1]*n[1][0])
    else:
        return (n[0][0] * n[1][1] * n[2][2]) + (n[0][1] * n[1][2] * n[2][0]) + (n[0][2] * n[1][0] * n[2][1]) - (n[0][0] * n[1][2] * n[2][1]) - (n[0][1] * n[1][0] * n[2][2]) - (n[0][2] * n[1][1] * n[2][0])

print(determinant(([1,2],[3,4])))
print(determinant(([8,1,6],[3,5,7],[4,9,2])))