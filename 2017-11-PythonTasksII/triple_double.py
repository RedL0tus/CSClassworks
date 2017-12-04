#!/usr/bin/env python3
#-*- encoding:utf-8 -*-
"""Computer Science P classword finding triple double words"""

def get_triple_double(filename):
    """Find triple double words inside the given file"""
    wordlist = open(filename)
    for word in wordlist:
        i = 0
        while i < (len(word) - 6):
            if (word[i] == word[i+1]) and (word[i+2] == word[i+3]) and (word[i+4] == word[i+5]):
                print(word)
            i = i + 1

get_triple_double('words.txt')
