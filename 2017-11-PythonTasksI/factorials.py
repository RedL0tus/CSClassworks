#!/usr/bin/env python3
#-*- encoding:utf-8 -*-

import sys

def factorial(n):
    result = 1
    for i in range(1,n+1):
        result = result*i
    return result

print(factorial(int(sys.argv[1])))