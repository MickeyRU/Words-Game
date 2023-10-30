import Foundation

final class GameViewModel: ObservableObject {
    @Published var playerOne: Player
    @Published var playerTwo: Player
    @Published var words = [String]()
    let word: String
    var isFirst = true
    
    init(playerOne: Player, playerTwo: Player, word: String) {
        self.playerOne = playerOne
        self.playerTwo = playerTwo
        self.word = word.lowercased()
    }
    
    func validate(word: String) -> Bool {
        let word = word.lowercased()
        guard word != self.word else {
            print("Думаешь самый умный? составленное слово не должно быть исхордным словом")
            return false
        }
        
        guard !(words.contains(word)) else {
            print("Прояви фантазию и придумай новое слово!")
            return false
        }
        
        guard word.count > 1 else {
            print("Слишком короткое слово")
            return false
        }
        
        return true
    }
    
    func wordToChars(word: String) -> [Character] {
        var charArray = [Character]()
        
        for char in word.lowercased() {
            charArray.append(char)
        }
        
        return charArray
    }
    
    func check(word: String) -> Int {
        guard self.validate(word: word) else {
            return 0
        }
        
        var bigWordArray = wordToChars(word: self.word)
        let smallWordArray = wordToChars(word: word)
        var result = ""

        for char in smallWordArray {
            if bigWordArray.contains(char) {
                result.append(char)
                var i = 0
                while bigWordArray[i] != char {
                    i += 1
                }
                bigWordArray.remove(at: i)
            } else {
                print("Такое слово не может быть составлено")
                return 0
            }
        }
        guard result == word.lowercased() else {
            print("Неизвестная ошибка")
            return 0
        }
        
        words.append(result)
        if isFirst {
            playerOne.add(score: result.count)
        } else {
            playerTwo.add(score: result.count)
        }
        
        isFirst.toggle()
        
        return result.count
    }
}
