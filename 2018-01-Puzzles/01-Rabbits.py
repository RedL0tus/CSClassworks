#!/usr/bin/env python3
#-*- encoding:utf-8 -*-
"""Fibonacci's Rabbits Problem"""

def rabbits(time, month, old_ones, newborns):
    """Rabbitssssss"""
    if month <= time:
        print("Month:", month, " total:", old_ones + newborns)
        rabbits(time, month + 1, old_ones + newborns, old_ones)

rabbits(12, 1, 0, 1)
