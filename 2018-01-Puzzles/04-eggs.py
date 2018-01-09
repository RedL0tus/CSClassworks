#!/usr/bin/env python3
#-*- encoding:utf-8 -*-

# Code found on the internet.
# https://www.geeksforgeeks.org/dynamic-programming-set-11-egg-dropping-puzzle/

def eggDrop(eggs, floors):
    eggFloor = [[0 for x in range(floors + 1)] for x in range(eggs + 1)]
    for i in range(1, eggs + 1):
        eggFloor[i][1] = 1
        eggFloor[i][0] = 0
    for j in range(1, floors + 1):
        eggFloor[1][j] = j
    for i in range(2, eggs + 1):
        for j in range(2, floors + 1):
            eggFloor[i][j] = 32767
            for x in range(1, j+1):
                res = 1 + max(eggFloor[i-1][x-1], eggFloor[i][j-x])
                if res < eggFloor[i][j]:
                    eggFloor[i][j] = res
    return eggFloor[eggs][floors]

print(eggDrop(2,100))
print("Code found on the internet.")