import SwiftUI

struct WordsTextField: View {
    
    @State var word: Binding<String>
    var placeHolder: String
    
    var body: some View {
        TextField(placeHolder,
                  text: word)
            .font(.title2)
            .padding()
            .background()
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
