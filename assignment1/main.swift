//
//  main.swift
//  OOP
//
//  Created by Thanapong Yamkamol on 16/8/2568 BE.
//

import Foundation

// Dictionary for listing value
let deck: [String: Int] = [
    "A": 11,
    "J": 10,
    "Q": 10,
    "K": 10,
    "0": 0, "1": 1, "2": 2, "3": 3, "4": 4,
    "5": 5, "6": 6, "7": 7, "8": 8, "9": 9
]

// first function random for 0-9 and A, J, Q, K
func rndFromDeck() -> String {
    let cards = ["0","1","2","3","4","5","6","7","8","9","A","J","Q","K"]
    let rnd = Int.random(in: 0..<cards.count)
    return cards[rnd]
}

// second function random 2 cards
func rndTwoCards() -> (String, String) {
    let pick1 = rndFromDeck()
    let pick2 = rndFromDeck()
    print("the first pick is: \(pick1)")
    print("and the second pick is: \(pick2)")
    return (pick1, pick2) // return value for calculate
}

// third function summarize pick 1 and 2 and show output
func openTheCards(pick1: String, pick2: String) {
    // card to numbers from Dictionary
    let numberOnePick = deck[pick1] ?? 0
    let numberTwoPick = deck[pick2] ?? 0
    let total = numberOnePick + numberTwoPick
    
    print("The total is: \(total)")
    
    if total == 21 {
        print("Result: Black Jack")
    } else if total == 20 {
        print("Result: Great")
    } else if (16...19).contains(total) {
        print("Result: Fair")
    } else if (11...15).contains(total) {
        print("Result: Try")
    } else {
        print("Result: Go Home")
    }
}

print("67130010168 Thanapong Yamkamol \n")
// call functions
let (firstCard, secondCard) = rndTwoCards()
openTheCards(pick1: firstCard, pick2: secondCard)
