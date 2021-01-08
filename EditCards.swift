//
//  EditCards.swift
//  Flashzilla
//
//  Created by Pranesh Ambokar on 1/7/21.
//

import SwiftUI

struct EditCards: View { //allows user to add cards to study from
    @Environment(\.presentationMode) var presentationMode //all initialized variables
    @State private var cards = [Card]()
    @State private var newPrompt = ""
    @State private var newAnswer = ""
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Add new card")) {
                    TextField("Prompt", text: $newPrompt)
                    TextField("Answer", text: $newAnswer)
                    Button("Add card", action: addCard)
                }
                
                Section {
                    ForEach(0..<cards.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(self.cards[index].prompt)
                                .font(.headline)
                            Text(self.cards[index].answer)
                                .foregroundColor(.secondary)
                        }
                    }
                    .onDelete(perform: removeCards)
                }
            }
            .navigationBarTitle("Edit Cards")
            .navigationBarItems(trailing: Button("Done", action: dismiss))
            .listStyle(GroupedListStyle())
            .onAppear(perform: loadData)
        }
        //.navigationViewStyle(StackNavigationViewStyle) this isn't required; I think Swift fixed the bug that was causing the slider to be blank
    }
    
    func dismiss() { //takes you out of edit view
        presentationMode.wrappedValue.dismiss()
    }
    
    func loadData() { //shows what cards are currently in the array
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try?
                JSONDecoder().decode([Card].self, from: data) {
                self.cards = decoded
            }
        }
    }
    
    func saveData() { //saves the array with the new or removed cards
        if let data = try? JSONEncoder().encode(cards) {
            UserDefaults.standard.setValue(data, forKey: "Cards")
        }
    }
    
    func addCard() { //adds new card to array
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
        guard trimmedPrompt.isEmpty == false && trimmedAnswer.isEmpty == false else { return }
        
        let card = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
        cards.insert(card, at: 0)
        saveData()
    }
    
    func removeCards(at offsets: IndexSet) { //removes card from array
        cards.remove(atOffsets: offsets)
        saveData()
    }
}

struct EditCards_Previews: PreviewProvider {
    static var previews: some View {
        EditCards()
    }
}
