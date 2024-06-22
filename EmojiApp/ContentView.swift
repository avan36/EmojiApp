//
//  ContentView.swift
//  EmojiApp
//
//  Created by Ambrose V on 21/06/2024.
//

import SwiftUI

struct ContentView: View {
    let happy = ["😊", "😍", "😂", "😎", "🥰", "😃", "😁", "😄", "😆", "😅", "🤗", "😇"]
    let activities = ["⚽", "🎸", "🎨", "🎮", "📚", "🏀", "🏈", "🏐", "🏓", "🎯", "🏹", "🛹"]
    let hand_expressions = ["👍", "🙌", "🤗", "🤔", "🙏", "👏", "✌️", "👌", "🤝", "💪", "👋", "🤞"]
    let food = ["🍕", "🍔", "🍦", "🍓", "🍩", "🍎", "🍉", "🍇", "🍌", "🍒", "🍪", "🍫"]
    let sad = ["😢", "😭", "😞", "😟", "😔", "😣", "😖", "😫", "😩", "😢", "🥺", "😿"]
    let angry = ["😡", "😤", "😠", "😣", "😖", "🤬", "😾", "😬", "😣", "😤", "😡", "😠"]
    let neutral = ["😐", "😶", "😕", "😒", "😔", "😑", "😌", "😇", "😏", "😬", "😐", "😶"]
    let animals = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮"]
    let travel = ["✈️", "🚗", "🚀", "🚁", "🚂", "🚤", "🛳️", "🚲", "🛴", "🏍️", "🚜", "🚕"]
    let weather = ["☀️", "🌧️", "⛈️", "❄️", "🌨️", "🌩️", "🌪️", "🌫️", "🌬️", "🌈", "☁️", "☔"]
    let options = ["Happy", "Sad", "Angry", "Neutral", "Activities", "Hand Expressions", "Food", "Animals", "Travel", "Weather"]
    
    @State private var selectedCategory = "Happy"
    
    var emojiDictionary: [String: [String]] {
        return [
            "Happy": happy,
            "Sad": sad,
            "Angry": angry,
            "Neutral": neutral,
            "Activities": activities,
            "Hand Expressions": hand_expressions,
            "Food": food
        ]
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Emoji category", selection: $selectedCategory) {
                    ForEach(options, id: \.self) {
                        Text($0)
                        }
                } //:Picker
                
                Section("Tap an emoji to copy to clipboard"){
                    if let emojis = emojiDictionary[selectedCategory] {
                        ForEach(emojis, id: \.self) {emoji in
                            Button(action: {
                                UIPasteboard.general.string = emoji
                            }, label: {
                                Text(emoji)
                            })
                        }//:EMOJI DICTIONARY
                    }
                }//:Section
                
                
            }
            .navigationTitle("Fast Emoji Picker")
        }
    }
}

#Preview {
    ContentView()
}
