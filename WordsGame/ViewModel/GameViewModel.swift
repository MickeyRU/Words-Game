import Foundation

enum WordError: Error {
    case theSameWord
    case beforeWord
    case littleWord
    case wrongWord
    case undefinedError
}

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
    
    func validate(word: String) throws {
        let word = word.lowercased()
        guard word != self.word else {
            print("Думаешь самый умный? составленное слово не должно быть исхордным словом")
            throw WordError.theSameWord
        }
        
        guard !(words.contains(word)) else {
            print("Прояви фантазию и придумай новое слово!")
            throw WordError.beforeWord
        }
        
        guard word.count > 1 else {
            print("Слишком короткое слово")
            throw WordError.littleWord
        }
        return
    }
    
    func wordToChars(word: String) -> [Character] {
        var charArray = [Character]()
        
        for char in word.lowercased() {
            charArray.append(char)
        }
        
        return charArray
    }
    
    func check(word: String) throws -> Int {
        
        do {
            try self.validate(word: word)
        } catch {
            throw error
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
                throw WordError.wrongWord
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
