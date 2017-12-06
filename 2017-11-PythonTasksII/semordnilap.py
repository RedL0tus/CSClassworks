#!/usr/bin/env python3
#-*- encoding:utf-8 -*-
"""Computer Science P classword finding semordnilap words"""

def get_semordnilap(filename):
    """Find semordnilap words inside the given file"""
    semordnilap_list = []
    wordlist = []
    file = open(filename)
    for line in file:
        wordlist.append(line.strip())
    for line in wordlist:
        if is_semordnilap(line, wordlist):
            semordnilap_list.append(line.strip())
    return semordnilap_list

def is_semordnilap(word, wordlist):
    """Determine whether the word is a semordnilap or not."""
    word_reversed = word.strip()[::-1]
    if word_reversed in wordlist:
        return True
    return False

print(get_semordnilap('words.txt'))
