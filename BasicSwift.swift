// This playground is a copy of the one we wrote live during the workshop
// As such it has no comments and is intended for comparison to your own copy

// this is a single line comment, I can put any old thing in here and the computer won't care!

/*
 this
 is
 a multi-line
 comment!
 I can also put anything in here!
 */

var age = 31
//age = "31"
var name = "Tim"
age = age + 1
age

name = "Jon"

print(name)

name = "Jon is at ACEM"
name.uppercased()

name.append(contentsOf: "!!!")

let value = 1 + 5 + 7.0 / 2

let mean = (1 + 3 + 5 + 7 + 11 + 13 + 17) / 7.0

let anotherNumber: Float = 2

var numbers: [Int] = [1,6,2,9,22,7]
numbers.append(17)

numbers[0]

var dictionary = ["hello":"Bonjour",
                  "goodbye":"au revoir",
                  "thank you":"merci"]
dictionary["hello"]
dictionary["Youre Welcome"] = "De rien"

var anotherDict = [1:"One", 2:"Two"]
print(dictionary.keys)

enum Sex
{
    case male
    case female
    case other
}

struct Person
{
    var name: String
    let yearOfBirth: Int
    let sex: Sex
    
    func greet()
    {
        print("Why hello there \(name)")
    }
}

var jon = Person(name: "Dr. Jon Alan Manning", yearOfBirth: 1986, sex: Sex.male)
jon.name
jon.name = "Barry"
jon.greet()

//if jon.name.count > 8
//{
//    print("Your name is very big!")
//}
//else
//{
//    print("Your name is very small!")
//}
//
//if 2 == 1 + 1
//{
//    print("maths still works")
//
//    var anything = 1
//
//    anything = anything + 2
//}
//
///*for number in 1 ... 10
//{
//    print(number)
//}
//
//for number in numbers
//{
//    print(number)
//}*/
//
//for number in 1 ... 30
//{
//    if number % 3 == 0
//    {
//        print(number)
//    }
//}
//
//var counter = 0
//for number in 1 ... 30
//{
//    counter = counter + 1
//    if counter == 3
//    {
//        print(number)
//        counter = 0
//    }
//}
//for number in stride(from: 0, through: 30, by: 3)
//{
//    print(number)
//}

func greet()
{
    print("Why, hello there.")
}
greet()

func greet(name: String)
{
    print("Why, hello there " + name)
}
greet(name:"Jon")

func greet(name: String, mood: String)
{
    //print("Why hello there " + name + ". I hope you are doing " + mood)
    print("Why hello there \(name). I hope you are doing \(mood)")
}
greet(name: "Jon", mood: "well")

func checkMood(name: String) -> String
{
    if name.hasPrefix("J")
    {
        return "Good"
    }
    else
    {
        return "Great"
    }
}
checkMood(name: "Jon")
checkMood(name: "Tim")

func celsiusToFarenheit(degrees: Float) -> Float
{
    return degrees * 1.8 + 32
}
celsiusToFarenheit(degrees: 25)

func weatherThing(name: String, temperature: Int)
{
    let message: String
    
//    if temperature < 15
//    {
//        message = "It's cold outside"
//    }
//    else if temperature >= 15 && temperature < 26
//    {
//        message = "It's nice outside"
//    }
//    else
//    {
//        message = "It's hot outside"
//    }
    
    switch temperature
    {
    case ...14:
        message = "It's cold outside"
    
    case 15...25:
        message = "It's nice outside"
    
    default:
        message = "It's hot outside"
    }
    
    print("Hello, \(name). \(message)")
}
weatherThing(name: "Jon", temperature: 26)

enum Weather
{
    case sunny
    case cloudy
    case rainy
    case stormy
    case bad
    case asteroids
}
let todaysWeather = Weather.asteroids
switch todaysWeather
{
case .sunny:
    print("gosh isn't it sunny")

case .cloudy:
    print("I hate the clouds")

case .rainy:
    print("I forgot my umbrella")
    
default:
    print("This is certainly weather")
}

var incomingName: String? = "A. String"

if let realName = incomingName
{
    print(realName.uppercased())
}
else
{
    print("No name provided")
}

guard let realName = incomingName else
{
    fatalError("No name provided!")
}
print(realName.uppercased())

let aBoolean = true
let anotherBoolean = false
if aBoolean != anotherBoolean
{
    print("Yes this makes sense")
}
