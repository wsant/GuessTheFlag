//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by William on 20/08/25.
//

import SwiftUI

struct FlagImage: View {
    var countryName: String
    
    var body: some View {
        Image(countryName)
            .clipShape(.capsule)
            .shadow(radius: 10)
    }
}


struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var showingFinalAlert = false
    @State private var scoreTitle = ""
    @State private var currentScore = 0
    @State private var tappedCountryName = ""
    @State private var questionCounter = 0
    
    
    var body: some View {
        
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Text("Guess The Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundStyle(.primary)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(countryName: countries[number])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(currentScore)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        
        
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
            
        } message: {
            if scoreTitle == "Correct" {
                Text("Your score is \(currentScore).")
            } else {
                Text("That's the flag of \(tappedCountryName). \nYour score is \(currentScore).")
            }
        }
        
        .alert("The Challenge is Over", isPresented: $showingFinalAlert) {
            Button("Restart", action: resetGame)
        } message: {
            Text("Your final score is: \(currentScore)")
        }
    }
    
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            currentScore += 1
            
        } else {
            scoreTitle = "Wrong"
            
            let countryThatWasTapped = countries[number]
            
            tappedCountryName = countryThatWasTapped
            
            if currentScore > 0 {
                currentScore -= 1
            }
        }
        
        questionCounter += 1
        
        if questionCounter < 8 {
            showingScore = true
        } else {
            showingFinalAlert = true
        }
        
    }
    
    func resetGame() {
        currentScore = 0
        questionCounter = 0
        askQuestion()
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
