import SwiftUI

struct GameView: View {
    
    @State private var word = ""
    
    var body: some View {
        
        VStack(spacing: 16) {
            HStack {
                Button {
                    print("Quit")
                } label: {
                    Text("Выход")
                        .padding(6)
                        .padding(.horizontal)
                        .background(Color("Orange"))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(6)
                        .foregroundStyle(Color(.white))
                        .font(.custom("AvenirNext-Bold", size: 18))
                }
                
                Spacer()
            }
            
            Text("Магнитотерапия")
                .font(.custom("AvenirNext-Bold", size: 36))
                .foregroundStyle(Color(.white))
            
            HStack(spacing: 12) {
                VStack {
                    Text("0")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundStyle(Color(.white))
                    
                    Text("Вася")
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .foregroundStyle(Color(.white))
                }.padding(20)
                    .frame(width: screen.width / 2.2,
                           height: screen.width / 2.2)
                    .background(Color("FirstPlayer"))
                    .clipShape(RoundedRectangle(cornerRadius: 26))
                    .shadow(color: .red,
                            radius: 4,
                            x: 0,
                            y: 0)
                
                VStack {
                    Text("0")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundStyle(Color(.white))
                    
                    Text("Петя")
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .foregroundStyle(Color(.white))
                }.padding(20)
                    .frame(width: screen.width / 2.2,
                           height: screen.width / 2.2)
                    .background(Color("SecondPlayer"))
                    .clipShape(RoundedRectangle(cornerRadius: 26))
                    .shadow(color: .purple,
                            radius: 4,
                            x: 0,
                            y: 0)
            }
            
            WordsTextField(word: $word, placeHolder: "Ваше слово...")
                .padding(.horizontal)
            
            Button {
                self.word = ""
            } label: {
                Text("Готово!")
                    .padding(12)
                    .foregroundStyle(Color(.white))
                    .frame(maxWidth: .infinity)
                    .background(Color("Orange"))
                    .clipShape(RoundedRectangle(cornerRadius: 26))
                    .font(.custom("AvenirNext-Bold", size: 26))
                    .padding(.horizontal)
            }
            
            List {
                
            }.listStyle(.plain)
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity)
                   
        }
        .background(Image("background"))
    }
}

#Preview {
    GameView()
}
