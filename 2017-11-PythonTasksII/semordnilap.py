#!/usr/bin/env python3
#-*- encoding:utf-8 -*-
"""Computer Science P classword finding semordnilap words"""

def get_semordnilap(filename):
    """Find semordnilap words inside the given file"""
    semordnilap_list = []
    file = open(filename)
    for line in file:
        if is_semordnilap(line, filename):
            semordnilap_list.append(line.strip())
    return semordnilap_list

def is_semordnilap(word, filename):
    """Determine whether the word is a semordnilap or not."""
    wordlist = open(filename)
    word_reversed = word.strip()[::-1]
    for line in wordlist:
        if line.strip() == word_reversed:
            return True
    return False

print(get_semordnilap('words.txt'))
#print(is_semordnilap("abcdef",["fedcba"]))
