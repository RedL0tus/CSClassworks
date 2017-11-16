#!/usr/bin/env python3
#-*- encoding:utf-8 -*-

import sys
import cmath

def quadratic(a,b,c):
    return [((-b-cmath.sqrt((b*b)-(4*a*c)))/2),((-b+cmath.sqrt((b*b)-(4*a*c)))/2)]

print(quadratic(int(sys.argv[1]),int(sys.argv[2]),int(sys.argv[3])))