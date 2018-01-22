#!/usr/bin/env python3
#-*- encoding:utf-8 -*-

import cmath

def factorial(n):
    result = 1
    while n > 1:
        result = result * n
        n = n - 1
    return result

def quadratic(a,b,c):
    return [((- b - cmath.sqrt((b * b)-(4 * a * c)))/2),((- b + cmath.sqrt((b * b) - (4 * a * c)))/2)]
