
import SwiftUI

struct WordCell: View {
    let word: String
    
    var body: some View {
        HStack {
            Text(word)
                .foregroundStyle(Color(.white))
                .listRowSeparator(.hidden)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding()
                .font(.custom("AvenirNext-Bold", size: 22))
            
            Text("\(word.count)")
                .foregroundStyle(Color(.white))
                .padding()
                .font(.custom("AvenirNext-Bold", size: 22))
        }
    }
}

#Preview {
    WordCell(word: "Магнит")
}
