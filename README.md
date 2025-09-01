# 🏳️ Guess the Flag - Project 2 from "100 Days of SwiftUI"

This is the second project from Paul Hudson's **[100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui)** course. The goal is to build a fun, interactive flag guessing game, focusing on UI layout, state management, and user interaction with buttons and alerts.

This repository documents the process of building the app and applying core SwiftUI concepts to create a complete game loop.

---
*Read the Portuguese version below.*
### (PT-BR)
---
# 🏳️ Guess the Flag - Projeto 2 do "100 Days of SwiftUI"

Este é o segundo projeto do curso **[100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui)** de Paul Hudson. O objetivo é construir um jogo de adivinhação de bandeiras interativo e divertido, com foco em layout de UI, gerenciamento de estado e interação do usuário com botões e alertas.

Este repositório documenta o processo de construção do aplicativo e a aplicação de conceitos centrais do SwiftUI para criar um ciclo de jogo completo.

## 🚀 Features (Funcionalidades)

* Displays three flag options, shuffled randomly each round.
* Asks the user to tap the correct flag based on a country name.
* Provides immediate feedback (Correct/Wrong) via an alert.
* Tracks the user's score, rewarding correct answers and penalizing wrong ones.
* The game ends after 8 rounds, showing a final score and offering to restart.

## ✨ Technical Highlights (Destaques Técnicos)

This project was a deep dive into UI construction and state management in SwiftUI:
* **Layout with Stacks:** Extensive use of `ZStack` for layered backgrounds (like gradients) and `VStack`/`Spacer` for organizing content vertically.
* **View Styling:** Application of various modifiers to create a visually appealing interface, including `.background(.regularMaterial)`, `.clipShape(.capsule)`, and `.shadow()`.
* **Interactive Buttons:** Creating tappable `Image` views by embedding them in a `Button`'s `label`, a core concept for visual apps.
* **State Management:** Using multiple `@State` properties to manage the game's state, including the list of countries, the correct answer, the current score, and the visibility of alerts.
* **Alerts for Feedback:** Implementing two distinct alerts using `.alert()`: one for round-by-round feedback and another for the "Game Over" state, controlled by different `@State` booleans.

## 🛠️ Tech Stack (Tecnologias Utilizadas)

```swift
- Swift 5
- SwiftUI
- Xcode
