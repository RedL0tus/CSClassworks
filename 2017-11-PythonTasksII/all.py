#!/usr/bin/env python3
#-*- encoding:utf-8 -*-
"""
Computer Science P classword about words.
All in one version.
Copyright (C) 2017 Ken Wang <RedL0tus@noreply.github.com>
"""

class Words:
    """Class of words processing."""
    wordlist = []
    def __init__(self, filename):
        try:
            self.file = open(filename)
            for line in self.file:
                self.wordlist.append(line.strip())
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

if __name__ == "__main__":
    print(">>> Reading wordlist.")
    WORDS = Words("words.txt")
    print(">>> Getting triple double words...")
    print(WORDS.get_triple_double())
    print(">>> Getting palindrome words...")
    print(WORDS.get_palindromes())
    print(">>> Getting semordnilap words (this may take a while)...")
    print(WORDS.get_semordnilaps())
    print("Done.")
