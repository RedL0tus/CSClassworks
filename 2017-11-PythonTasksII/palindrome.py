#!/usr/bin/env python3
#-*- encoding:utf-8 -*-
"""Computer Science P classword finding palindrome words"""

def get_palindrome(filename):
    """Find palindrome words inside the given file"""
    palindrome_list = []
    file = open(filename)
    for line in file:
        if is_palindrome(line.strip()):
            palindrome_list.append(line.strip())
    return palindrome_list

def is_palindrome(word):
    """Determine whether the word is a palindrome or not."""
    for i in range(len(word) - 1):
        if word[i] != word[(len(word) - 1 - i)]:
            return False
    return True

print(get_palindrome('words.txt'))
