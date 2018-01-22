#!/usr/bin/env python3
#-*- encoding:utf-8 -*-
"""A OOP version of the Tic Tac Toe game."""

import random

class Board:
    """A board."""
    def __init__(self):
        """init."""
        self.marks = [[" " for x in range(3)] for y in range(3)]

    def display(self):
        """Display the board."""
        print(" "+ self.marks[0][0] + " | "+ self.marks[0][1] +" | " + self.marks[0][2])
        print("-----------")
        print(" "+ self.marks[1][0] + " | "+ self.marks[1][1] +" | " + self.marks[1][2])
        print("-----------")
        print(" "+ self.marks[2][0] + " | "+ self.marks[2][1] +" | " + self.marks[2][2])

    def mark(self, x_axis, y_axis, mark):
        """Mark a location to given symbol."""
        if self.marks[x_axis][y_axis] == " ":
            self.marks[x_axis][y_axis] = mark
            return True
        else:
            return False

    def is_space_free(self, x_axis, y_axis):
        if self.marks[x_axis][y_axis] == " ":
            return True
        else:
            return False

    def check_win(self):
        """Check if win."""
        if ((self.marks[0][0] == self.marks[0][1]) and (self.marks[0][1] == self.marks[0][2]) and self.marks[0][0] != " ") or \
        ((self.marks[1][0] == self.marks[1][1]) and (self.marks[1][1] == self.marks[1][2]) and self.marks[1][0] != " ") or \
        ((self.marks[2][0] == self.marks[2][1]) and (self.marks[2][1] == self.marks[2][2]) and self.marks[2][0] != " ") or \
        ((self.marks[0][0] == self.marks[1][0]) and (self.marks[1][0] == self.marks[2][0]) and self.marks[0][0] != " ") or \
        ((self.marks[0][1] == self.marks[1][1]) and (self.marks[1][1] == self.marks[2][1]) and self.marks[0][1] != " ") or \
        ((self.marks[0][2] == self.marks[1][2]) and (self.marks[1][2] == self.marks[2][2]) and self.marks[0][2] != " ") or \
        ((self.marks[0][0] == self.marks[1][1]) and (self.marks[1][1] == self.marks[2][2]) and self.marks[0][0] != " ") or \
        ((self.marks[0][2] == self.marks[1][1]) and (self.marks[1][1] == self.marks[2][0]) and self.marks[0][2] != " "):
            return True

    def print_divider(self):
        """Print a divider."""
        print("\n===========\n")

class Computer_player:
    """A computer player"""
    def __init__(self, symbol):
        """Initializing"""
        self.symbol = symbol

    def mark(self, marks):
        """Put a mark on the board"""
        return 1, 1

class Players:
    """Players"""
    def __init__(self, p1_name, p1_mark, p2_name, p2_mark):
        """Initialize the player"""
        self.p1_name = p1_name
        self.p2_name = p2_name
        self.p1_mark = p1_mark
        self.p2_mark = p2_mark

    def get_p1_name(self):
        """Get player 1's name"""
        return self.p1_name

    def get_p2_name(self):
        """Get player 2's name"""
        return self.p2_name

    def get_p1_mark(self):
        """Get player 1's mark"""
        return self.p1_mark

    def get_p2_mark(self):
        """Get player 2's mark"""
        return self.p2_mark

    def get_name_by_mark(self, mark):
        """Fine name by mark"""
        if self.p1_mark == mark:
            return self.p1_name
        else:
            return self.p2_name

class Game:
    """The actuall game."""
    def __init__(self):
        """Initialize the game."""
        self.game_board = Board()
        self.playing_with_computer = False
        self.playing = "X"
        self.temp = "X"
        self.computer = Computer_player("O")
        self.players = Players

    def start(self):
        """Start the game."""
        print("====================")
        print("    Tic Tac Toe")
        print("====================")
        ans = input(">>> Playing with the computer? (Y/n) ")
        if (ans == "y") or (ans == "Y"):
            self.playing_with_computer = True
            ans = input(">>> Would like to be X? (Y/n) ")
            if (ans == "y") or (ans == "Y"):
                self.playing = "X"
                self.computer = Computer_player("O")
            else:
                self.playing = "O"
                self.computer = Computer_player("X")
        else:
            self.playing_with_computer = False
            p1_name = input(">>> Please enter the name of the player who wants to play as X: ")
            p2_name = input(">>> Please enter the name of the player who wants to play as O: ")
            self.players = Players(p1_name, "X", p2_name, "O")
        if random.randint(0, 1) == 0:
            self.temp = "X"
            print(">>> X goes first.")
        else:
            self.temp = "O"
            print(">>> O goes first.")
        self.game_board.display()
        while self.game_board.check_win() is not True:
            self.next_step()
            if self.temp == "X":
                self.temp = "O"
            else:
                self.temp = "X"
        if self.playing_with_computer is False:
            if self.temp == "X":
                print(">>> " + self.players.get_name_by_mark("O") + " won.")
                exit(0)
            else:
                print(">>> " + self.players.get_name_by_mark("X") + " won.")
                exit(0)
        else:
            if self.temp == self.playing:
                print(">>> You lose.")
                exit(0)
            else:
                print(">>> You win.")
                exit(0)

    def is_number(self, test):
        """Test if the input is a number."""
        try:
            int(test)
            return True
        except ValueError:
            return False

    def is_valid_input(self, input_buffer):
        """Check if input is invalid"""
        if (len(input_buffer) != 3) or \
        (self.is_number(input_buffer[0]) is not True) or \
        (self.is_number(input_buffer[2]) is not True) or \
        (int(input_buffer[0]) < 0) or (int(input_buffer[0]) > 2) or \
        (int(input_buffer[2]) < 0) or (int(input_buffer[2]) > 2) or \
        self.game_board.is_space_free(int(input_buffer[0]), int(input_buffer[2])) is not True:
            return False
        else:
            return True

    def next_step(self):
        """Next step"""
        if self.playing_with_computer is False:
            # Playing together
            input_buffer = input(">>> " + self.players.get_name_by_mark(self.temp) + \
            ", where do you want to put a[n] " + self.temp + "? ")
            while self.is_valid_input(input_buffer) is not True:
                print("Invalid response. Please try again.")
                input_buffer = input(">>> Where do you want to put a[n] " +\
                self.temp + "? (Format: X Y) ")
            self.game_board.mark(int(input_buffer[0]), int(input_buffer[2]), self.temp)
            self.game_board.display()
        else:
            if self.temp == self.playing:
                input_buffer = input(">>> Where do you want to put a[n]" + self.temp + "? ")
                while self.is_valid_input(input_buffer) is not True:
                    print("Invalid response. Please try again.")
                    input_buffer = input(">>> Where do you want to put a[n] " + \
                    self.temp + "? (Format: X Y) ")
                self.game_board.mark(int(input_buffer[0]), int(input_buffer[2]), self.temp)
            else:
                self.computer.mark(self.game_board.marks)
            self.game_board.display()

if __name__ == "__main__":
    try:
        GAME = Game()
        GAME.start()
    except KeyboardInterrupt:
        print("\nBye~")
        exit(1)
