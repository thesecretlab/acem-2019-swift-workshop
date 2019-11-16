
// Printing the running total of a list

func printRunningTotal(list: [Int]) {
    var runningTotal = 0
    
    for number in list {
        runningTotal += number
        print(runningTotal)
    }
}

printRunningTotal(list: [2,4,0,2,6])

// Compute the first 100 Fibbonacci numbers
func fibbonacci(limit: Int) -> [Int] {
    var numbers = [0, 1]
    
    for _ in 0..<limit {
        let v1 = numbers[numbers.count - 2]
        let v2 = numbers[numbers.count - 1]
        numbers.append(v1 + v2)
    }
    
    return numbers
}

fibbonacci(limit: 5)

// Rotates an array by k elements.
func rotateArray(array: [Int], number: Int) -> [Int] {
    // 'Int' could just as easily be 'Any'
    if number > array.count {
        fatalError("Can't rotate an array by more than its length")
    }
    
    let firstSegment = array.prefix(upTo: number)
    let secondSegment = array.suffix(from: number)
    
    return Array(secondSegment + firstSegment)
    
    
}

rotateArray(array: [1,2,3,4,5,6], number: 2)

// Converts a string to Morse code

func morseCode(input: String) -> String {
    let morseCode = [
        " ": "   ",
        "A": ".-",
        "B": "-...",
        "C": "-.-.",
        "D": "-..",
        "E": ".",
        "F": "..-.",
        "G": "--.",
        "H": "....",
        "I": "..",
        "J": ".---",
        "K": "-.-",
        "L": ".-..",
        "M": "--",
        "N": "-.",
        "O": "---",
        "P": ".--.",
        "Q": "--.-",
        "R": ".-.",
        "S": "...",
        "T": "-",
        "U": "..-",
        "V": "...-",
        "W": ".--",
        "X": "-..-",
        "Y": "-.--",
        "Z": "--..",
        "0": "-----",
        "1": ".----",
        "2": "..---",
        "3": "...--",
        "4": "....-",
        "5": ".....",
        "6": "-....",
        "7": "--...",
        "8": "---..",
        "9": "----.",
        ".": ".-.-.-",
        ",": "--..--",
        ":": "---...",
        "?": "..--..",
        "'": ".----.",
        "-": "-....-",
        "/": "-..-.",
        "(": "-.--.-",
        ")": "-.--.-",
        "\"": ".-..-.",
        "@": ".--.-.",
        "=": "-...-",
        "!": "-.-.--"
    ]
    
    var result : [String] = []
    
    for character in input {
        let morseSequence = morseCode[character.uppercased()] ?? "<unknown>"
        
        result.append(morseSequence)
    }
    
    return result.joined(separator: " ")
}

morseCode(input: "Hello ACEM")

// Removes duplicates from a list
func removeDuplicates(array: [String]) -> [String] {
    // 'String' could be any hashable
    
    var itemsSeen : [String] = []
    // Could also be a Set
    
    var result : [String] = []
    
    for item in array {
        if itemsSeen.contains(item) == false {
            itemsSeen.append(item)
            result.append(item)
        }
    }
    return result
}

removeDuplicates(array: ["Hello", "yes", "yes", "Hello", "World"])

// Tests the Collatz conjecture on an integer. Returns the number of steps needed to reduce to 1.
// https://en.wikipedia.org/wiki/Collatz_conjecture
func collatz(input: Int) -> Int {
    
    guard input > 0 else {
        fatalError("Input must be positive.")
    }
    
    var current = input
    var steps = 0
    
    while current != 1 {
        if current % 2 == 0 {
            current = current / 2
        } else {
            current = current * 3 + 1
        }
        steps += 1
    }
    return steps
}

collatz(input: 9)

