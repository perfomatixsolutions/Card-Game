//
//  Grid.swift
//  FlipCardsGame
//
//  Created by Vimal Das on 27/12/20.
//

import SwiftUI

struct Grid<Item, ViewItem>: View where Item: Identifiable, ViewItem: View {
    
    private var items: [Item]
    private var viewForItem: (Item) -> ViewItem
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ViewItem) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            body(for: GridLayout(itemCount: items.count, in: geometry.size))
        }
    }
    
    private func body(for layout: GridLayout) -> some View {
        ForEach (items) { item in
            body(for: item, layout: layout)
        }
    }
    
    private func body(for item: Item, layout: GridLayout) -> some View {
        let index = items.firstIndex(matching: item)!
        return viewForItem(item)
                .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                .position(layout.location(ofItemAt: index))
    }
    
}
