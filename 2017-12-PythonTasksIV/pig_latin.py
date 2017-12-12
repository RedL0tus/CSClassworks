#!/usr/bin/env python3
#-*- encoding:utf-8 -*-
"""Translate english words into Pig Latin."""

import sys

def pig_latin(word):
    """Translate english words into Pig Latin."""
    try:
        exceptions = ["honor", "honest"]
        for temp in ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]:
            if word[0] == temp:
                begin_with_vowel = True
            else:
                begin_with_vowel = False
        for temp in exceptions:
            if word == temp:
                begin_with_vowel = True
        begin_with_digraph = False
        if begin_with_vowel is False:
            for temp in ["ch", "sh", "th", "Ch", "Sh", "Th"]:
                if (word[0] + word[1]) == temp:
                    begin_with_digraph = True
        result = ""
        if begin_with_vowel:
            result = word + "ay"
        else:
            if begin_with_digraph:
                temp = 2
            else:
                temp = 1
            for i in range(temp, (len(word))):
                result = result + word[i]
            for i in range(0, (temp - 1)):
                result = result + word[i]
            result = result + word[0] + "ay"
        return result
    except ValueError:
        return None

if __name__ == "__main__":
    print(pig_latin(sys.argv[1]))
