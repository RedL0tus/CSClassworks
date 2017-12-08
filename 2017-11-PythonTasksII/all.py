#!/usr/bin/env python3
#-*- encoding:utf-8 -*-
"""
Computer Science P classword about words.
All in one version.
Copyright (C) 2017 Ken Wang <RedL0tus@noreply.github.com>
"""

class Words:
    """Class of words processing."""
    wordlist = {}
    def __init__(self, filename):
        try:
            self.file = open(filename)
            temp = []
            for line in self.file:
                temp.append(line.strip())
            self.wordlist = set(temp)
        except IOError:
            print("Failed to open wordlist file.")

    def get_triple_double(self):
        """Find triple double words inside the given wordlist."""
        triple_double_list = []
        if self.wordlist != []:
            for word in self.wordlist:
                i = 0
                while i < (len(word) - 6):
                    if (word[i] == word[i+1]) and (word[i+2] == word[i+3]) and \
                    (word[i+4] == word[i+5]):
                        triple_double_list.append(word)
                    i = i + 1
            return triple_double_list
        else:
            return False

    def is_palindrome(self, word):
        """Determine whether the word is a palindrome or not."""
        for i in range(len(word) - 1):
            if word[i] != word[(len(word) - 1 - i)]:
                return False
        return True

    def get_palindromes(self):
        """Find palindrome words inside the given file"""
        palindrome_list = []
        if self.wordlist != []:
            for word in self.wordlist:
                if self.is_palindrome(word):
                    palindrome_list.append(word)
            return palindrome_list
        else:
            return False

    def is_semordnilap(self, word, wordlist):
        """Determine whether the word is a semordnilap or not."""
        word_reversed = word.strip()[::-1]
        if word_reversed in wordlist:
            return True
        return False

    def get_semordnilaps(self):
        """Find semordnilap words inside the given file"""
        if self.wordlist != []:
            semordnilap_list = []
            for line in self.wordlist:
                if self.is_semordnilap(line, self.wordlist):
                    semordnilap_list.append(line.strip())
            return semordnilap_list
        else:
            return False

    def sort_letters(self):
        """Sort letters by letters they contains"""
        dictionary = dict()
        for word in self.wordlist:
            key = list(word)
            key.sort()
            key = "".join(key)
            if key not in dictionary:
                dictionary[key] = [word]
            else:
                dictionary[key].append(word)
        return dictionary

    def get_anagrams(self):
        """Print anagrams."""
        anagrams_list = self.sort_letters()
        for key in list(anagrams_list):
            if len(anagrams_list[key]) < 2:
                del anagrams_list[key]
        return anagrams_list

if __name__ == "__main__":
    print(">>> Reading wordlist.")
    WORDS = Words("words.txt")
    print(">>> Getting triple double words...")
    print(WORDS.get_triple_double())
    print(">>> Getting palindrome words...")
    print(WORDS.get_palindromes())
    print(">>> Getting semordnilap words...")
    print(WORDS.get_semordnilaps())
    print(">>> Getting anagrams...")
    print(WORDS.get_anagrams())
    print("Done.")
