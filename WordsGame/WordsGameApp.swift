import SwiftUI

let screen = UIScreen.main.bounds

@main
struct WordsGameApp: App {
    
    var body: some Scene {
        WindowGroup {
            StartView()
        }
    }
}
