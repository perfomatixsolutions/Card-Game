//
//  EmojiCardGame.swift
//  FlipCardsGame
//
//  Created by Vimal Das on 09/11/20.
//

import Foundation

// view model

class EmojiCardGame: ObservableObject {
    @Published private var model: CardGame<String> = EmojiCardGame.createMemoryGame()
    
    static func createMemoryGame() -> CardGame<String> {
        let emojiArray = ["👻", "💀", "😻"]
        return CardGame(numberOfPairOfCards: emojiArray.count) { pairIndex in
            return emojiArray[pairIndex]
        }
    }
    
//     MARK : - Access to model
    
    var cards: Array<CardGame<String>.Card> {
        //objectWillChange.send()
        return model.cards
    }
    
    
    
    // MARK: - Intent(s)
    
    func chooseCard(_ card: CardGame<String>.Card) {
        model.choose(card: card)
    }
}
