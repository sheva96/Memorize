//
//  ContentView.swift
//  Memorize
//
//  Created by eugeniy.sha on 03.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var emojies = ["✈️", "🚜", "🚎", "🚑", "😃", "🚀", "🚛", "🚚", "🛳", "🚤", "👺", "😸",
                          "👩🏼‍💼", "🐶", "🌻", "🥣", "⛹🏼", "🧘🏻‍♂️", "🗼", "🎙", "🛍", "❤️", "❇️", "🇩🇪"]
    
    @State var emojiCount = 24
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojies[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                remove
                Spacer()
                shuffle
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var shuffle: some View {
        Button { emojies.shuffle() } label: { Text("Shuffle") }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojies.count {
                emojiCount += 1
            }
            
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

struct CardView: View {
    
    @State var isFaceUp = true
    let content: String
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25)
            
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
