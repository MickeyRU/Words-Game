import SwiftUI

struct StartView: View {
    
    @State var bigWord: String = ""
    @State var playerOne: String = ""
    @State var playerTwo: String = ""
    
    @State var IsShowedGame = false

    var body: some View {
        
        VStack {
           
            TitleText(text: "WordsGame")
            
            WordsTextField(word: $bigWord, placeHolder: "Ведите длинное слово")
                .padding(20)
                .padding(.top, 32)
            
            WordsTextField(word: $playerOne, placeHolder: "Игрок 1")
                .padding(.horizontal, 20)
            
            WordsTextField(word: $playerTwo, placeHolder: "Игрок 2")
                .padding(.horizontal, 20)
            
            Button {
                IsShowedGame.toggle()
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
            .fullScreenCover(isPresented: $IsShowedGame, content: {
                GameView()
            })
    }
}

#Preview {
    StartView()
}
