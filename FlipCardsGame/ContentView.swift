//
//  ContentView.swift
//  FlipCardsGame
//
//  Created by Vimal Das on 08/11/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiCardGame = EmojiCardGame()
    
    var body: some View {
        Grid (viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                viewModel.chooseCard(card)
            }
            .padding(5)
        }
        .padding()
        .foregroundColor(.red)
    }
}





struct CardView: View {
    var card: CardGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
        ZStack {
            Pie(startAngle: Angle.degrees(0), endAngle: Angle.degrees(110), clockwise: true)
                .padding(5)
                .opacity(0.4)
            Text(card.content)
                .font(Font.system(size: fontSize(for: size)))
        }
        .cardify(isFaceUp: card.isFaceUp)
        }
            
    }
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
    
    private let fontScaleFactor: CGFloat = 0.70
}

















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
         ContentView()
    }
}
