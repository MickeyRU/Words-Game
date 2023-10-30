import SwiftUI

struct StartView: View {
    
    @State var bigWord: String = ""
    @State var playerOne: String = ""
    @State var playerTwo: String = ""
    
    @State var IsShowedGame = false
    @State var isAlertPresented = false

    var body: some View {
        
        VStack {
           
            TitleText(text: "Words Game")
            
            WordsTextField(word: $bigWord, placeHolder: "Ведите длинное слово")
                .padding(20)
                .padding(.top, 32)
            
            WordsTextField(word: $playerOne, placeHolder: "Введите имя Игрока 1")
                .padding(.horizontal, 20)
            
            WordsTextField(word: $playerTwo, placeHolder: "Введите имя Игрока 2")
                .padding(.horizontal, 20)
            
            Button {
                if bigWord.count > 7 {
                    IsShowedGame.toggle()
                } else {
                    self.isAlertPresented.toggle()
                }
            } label: {
                Text("Старт")
                    .font(.custom("AvenirNext-Bold", size: 30))
                    .foregroundStyle(.white)
                    .padding()
                    .padding(.horizontal, 64)
                    .background(Color("FirstPlayer"))
                    .clipShape(RoundedRectangle(cornerRadius: 100))
                    .padding(.top)
            }

            
        }.background(Image("background"))
            .alert("Длиное слово слишком короткое", isPresented: $isAlertPresented, actions: {
                Text("OK!")
            })
            .fullScreenCover(isPresented: $IsShowedGame, content: {
                
                let name1 = playerOne == "" ? "Игрок 1" : playerOne
                let name2 = playerTwo == "" ? "Игрок 1" : playerTwo

                
                let player1 = Player(name: name1)
                let player2 = Player(name: name2)
                
                GameView(viewModel: GameViewModel(playerOne: player1, playerTwo: player2, word: self.bigWord))
            })
    }
}

#Preview {
    StartView()
}
