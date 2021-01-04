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
        VStack {
            ForEach (0..<3) { row in
                HStack {
                    CardView(card: viewModel.cards[(row*2)]).onTapGesture {
                        viewModel.chooseCard(viewModel.cards[(row*2)])
                    }
                    CardView(card: viewModel.cards[(row*2)+1]).onTapGesture {
                        viewModel.chooseCard(viewModel.cards[(row*2)+1])
                    }
                }
            }
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
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
                
            } else {
                RoundedRectangle(cornerRadius: 16).fill()
            }
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
    
    // MARK: - Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3.0
    let fontScaleFactor: CGFloat = 0.75
}


















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
