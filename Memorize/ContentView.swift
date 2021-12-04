//
//  ContentView.swift
//  Memorize
//
//  Created by eugeniy.sha on 03.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var emojies = [String]()
    
    var cars = ["🚜", "🚎", "🚚", "🚘", "🚔", "🚍", "🏎", "🚑"]
    var animals = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼"]
    var things = ["⌚️", "📱", "💻", "🖥", "⌨️", "🖱", "🖨", "🎥"]
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojies, id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                carsButton
                Spacer()
                animalsButton
                Spacer()
                thingsButton
            }
            .font(.title)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var carsButton: some View {
        Button {
            emojies = cars.shuffled()
        } label: {
            VStack {
                Image(systemName: "car.ferry")
                Text("Cars")
            }
        }

    }
    
    var animalsButton: some View {
        Button {
            emojies = animals.shuffled()
        } label: {
            VStack {
                Image(systemName: "hare")
                Text("Animals")
            }
        }
    }
    
    var thingsButton: some View {
        Button {
            emojies = things.shuffled()
        } label: {
            VStack {
                Image(systemName: "desktopcomputer")
                Text("Things")
            }
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
            .previewDevice("iPhone 13")
.previewInterfaceOrientation(.portrait)
    }
}
