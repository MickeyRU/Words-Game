import SwiftUI

struct TitleText: View {
    
    @State var text: String
    
    var body: some View {
        Text(text)
            .padding()
            .font(.custom("AvenirNext-Bold", size: 42))
            .frame(maxWidth: .infinity)
            .background(Color("FirstPlayer"))
            .foregroundStyle(BackgroundStyle())
    }
}

#Preview {
    TitleText(text: "Магнитотерапия")
}
