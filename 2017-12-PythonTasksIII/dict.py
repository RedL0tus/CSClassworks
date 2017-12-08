#!/usr/bin/env python3
#-*- encoding:utf-8 -*-
"""Dictionary"""

def read_words(filename):
    """Read the words from given file."""
    try:
        file = open(filename)
        temp = []
        for line in file:
            temp.append(line.strip())
        wordlist = set(temp)
        return wordlist
    except IOError:
        print("Failed to open wordlist file.")

def sort_lengths(wordlist):
    """Sort words in dictionary by lenght."""
    dictionary = dict()
    for word in wordlist:
        key = len(word)
        if key not in dictionary:
            dictionary[key] = [word]
        else:
            dictionary[key].append(word)
    return dictionary

def sort_letters(wordlist):
    """Sort letters by letters they contains"""
    dictionary = dict()
    for word in wordlist:
        key = list(word)
        key.sort()
        key = "".join(key)
        if key not in dictionary:
            dictionary[key] = [word]
        else:
            dictionary[key].append(word)
    return dictionary

def anagrams(anagrams_list):
    """Print anagrams."""
    for key in list(anagrams_list):
        if len(anagrams_list[key]) < 2:
            del anagrams_list[key]
    return anagrams_list

if __name__ == "__main__":
    print(">>> Sort by lengths.")
    print(sort_lengths(read_words("words.txt")))
    print("\n \n \n \n \n \n \n")
    print(">>> Print anagrams.")
    print(anagrams(sort_letters(read_words("words.txt"))))
