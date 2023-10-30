import SwiftUI

struct GameView: View {
    
    @State private var word = ""
    @State private var confirmPresent = false
    @State private var isAlertPresent = false
    @State var alertText = ""
    var viewModel: GameViewModel
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack(spacing: 16) {
            HStack {
                Button {
                    confirmPresent.toggle()
                } label: {
                    Text("Выход")
                        .padding(6)
                        .padding(.horizontal)
                        .background(Color("CustomColor"))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(6)
                        .foregroundStyle(Color(.white))
                        .font(.custom("AvenirNext-Bold", size: 18))
                }
                
                Spacer()
            }
            
            Text(viewModel.word)
                .font(.custom("AvenirNext-Bold", size: 36))
                .foregroundStyle(Color(.white))
            
            HStack(spacing: 12) {
                VStack {
                    Text("\(viewModel.playerOne.score)")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundStyle(Color(.white))
                    
                    Text("\(viewModel.playerOne.name)")
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .foregroundStyle(Color(.white))
                }.padding(20)
                    .frame(width: screen.width / 2.2,
                           height: screen.width / 2.2)
                    .background(Color("FirstPlayer"))
                    .clipShape(RoundedRectangle(cornerRadius: 26))
                    .shadow(color: viewModel.isFirst ? .red : .clear,
                            radius: 4,
                            x: 0,
                            y: 0)
                
                VStack {
                    Text("\(viewModel.playerTwo.score)")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundStyle(Color(.white))
                    
                    Text("\(viewModel.playerTwo.name)")
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .foregroundStyle(Color(.white))
                }.padding(20)
                    .frame(width: screen.width / 2.2,
                           height: screen.width / 2.2)
                    .background(Color("SecondPlayer"))
                    .clipShape(RoundedRectangle(cornerRadius: 26))
                    .shadow(color: !viewModel.isFirst ? .purple : .clear,
                            radius: 4,
                            x: 0,
                            y: 0)
            }
            
            WordsTextField(word: $word, placeHolder: "Ваше слово...")
                .padding(.horizontal)
            
            Button {
                
                var score = 0
                
                do {
                    try score = viewModel.check(word: word)
                } catch WordError.beforeWord {
                    alertText = "Прояви фантазию и придумай новое слово!"
                    isAlertPresent.toggle()
                } catch WordError.littleWord {
                    alertText = "Слишком короткое слово"
                    isAlertPresent.toggle()
                } catch WordError.theSameWord {
                    alertText = "Думаешь самый умный? составленное слово не должно быть исхордным словом"
                    isAlertPresent.toggle()
                } catch WordError.wrongWord {
                    alertText = "Такое слово не может быть составлено"
                    isAlertPresent.toggle()
                } catch {
                    alertText = "Неизвестная ошибка"
                    isAlertPresent.toggle()
                }
                
                if score > 0 {
                    self.word = ""
                }
            } label: {
                Text("Готово!")
                    .padding(12)
                    .foregroundStyle(Color(.white))
                    .frame(maxWidth: .infinity)
                    .background(Color("CustomColor"))
                    .clipShape(RoundedRectangle(cornerRadius: 26))
                    .font(.custom("AvenirNext-Bold", size: 26))
                    .padding(.horizontal)
            }
            
            List {
                
                ForEach(0 ..< self.viewModel.words.count, id: \.description) { item in
                    WordCell(word: self.viewModel.words[item])
                        .background(item % 2 == 0 ? Color("FirstPlayer") : Color("SecondPlayer"))
                        .listRowInsets(EdgeInsets())
                }
                
            }.listStyle(.plain)
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity)
            
        }
        .background(Image("background"))
        .confirmationDialog("Вы уверены что хотите завершить игру?",
                            isPresented: $confirmPresent,
                            titleVisibility: .visible) {
            Button(role: .destructive) {
                self.dismiss()
            } label: {
                Text("Да")
            }
            
            Button(role: .cancel) { } label: {
                Text("Нет")
            }
        }
                            .alert(alertText,
                                   isPresented: $isAlertPresent) {
                                Text("Ок!")
                            }
    }
}

#Preview {
    GameView(viewModel: GameViewModel(playerOne: Player(name: "Вася"), playerTwo: Player(name: "Федя"), word: "Рекогнасцировка"))
}
