#!/usr/bin/env python3
#-*- encoding:utf-8 -*-

import sys

def summation(n):
    result = 0
    for i in list(range(1,n+1)):
        result = result + i
    return result

print(summation(int(sys.argv[1])))