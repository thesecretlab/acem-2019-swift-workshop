enum Sex
{
    case female, male, other
    
    // in our case we decided to store the risk associated with the sex on the sex itself
    var risk: Int
    {
        if self == .female
        {
            return 1
        }
        return 0
    }
}

// our patient structure
// also calculates the risk score on the patient directly instead
// of being its own function
struct Patient
{
    var name: String
    var age: Int
    var sex: Sex
    
    var congestiveHeartFailure: Bool
    var hypertension: Bool
    var diabetesMellitus: Bool
    var priorStroke: Bool
    var vascularDisease: Bool
    
    var risk: Int
    {
        var cumulative = 0
        
        // risk due to age
        switch age
        {
        case 75...:
            cumulative += 2
        
        case 65...74:
            cumulative += 1
        
        default:
            cumulative += 0
        }
        
        if congestiveHeartFailure
        {
            cumulative += 1
        }
        if hypertension
        {
            cumulative += 1
        }
        if diabetesMellitus
        {
            cumulative += 1
        }
        if priorStroke
        {
            cumulative += 2
        }
        if vascularDisease
        {
            cumulative += 1
        }
        
        // risk associated with sex
        // only applicable if it isn't the only risk factor
        if cumulative > 0
        {
            cumulative += sex.risk
        }
        
        return cumulative
    }
}

// a giant blob of 100 patients we generated for testing purposes
let patients = [
Patient(name: "Grace Lee", age: 40, sex: .male, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: true, priorStroke: false, vascularDisease: true),
Patient(name: "Lucas Wilson", age: 25, sex: .other, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: true, priorStroke: false, vascularDisease: true),
Patient(name: "Lucas Williams", age: 19, sex: .male, congestiveHeartFailure: true, hypertension: false, diabetesMellitus: true, priorStroke: false, vascularDisease: true),
Patient(name: "Ethan Jones", age: 76, sex: .female, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: false, priorStroke: false, vascularDisease: false),
Patient(name: "Charlotte Jones", age: 40, sex: .female, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: false, priorStroke: false, vascularDisease: true),
Patient(name: "William Wang", age: 30, sex: .male, congestiveHeartFailure: true, hypertension: true, diabetesMellitus: false, priorStroke: false, vascularDisease: false),
Patient(name: "Ethan Lee", age: 24, sex: .female, congestiveHeartFailure: true, hypertension: false, diabetesMellitus: false, priorStroke: false, vascularDisease: false),
Patient(name: "Mason Jones", age: 54, sex: .other, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: true, priorStroke: false, vascularDisease: true),
Patient(name: "Mason Nguyen", age: 25, sex: .other, congestiveHeartFailure: true, hypertension: false, diabetesMellitus: false, priorStroke: true, vascularDisease: false),
Patient(name: "Isla Angelopoulos", age: 27, sex: .female, congestiveHeartFailure: true, hypertension: false, diabetesMellitus: false, priorStroke: true, vascularDisease: false),
Patient(name: "Mia Haddad", age: 68, sex: .female, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: true, priorStroke: true, vascularDisease: true),
Patient(name: "Mason Wilson", age: 41, sex: .other, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: false, priorStroke: true, vascularDisease: true),
Patient(name: "Ethan Wilson", age: 65, sex: .female, congestiveHeartFailure: true, hypertension: true, diabetesMellitus: true, priorStroke: true, vascularDisease: false),
Patient(name: "Thomas Lee", age: 32, sex: .male, congestiveHeartFailure: true, hypertension: false, diabetesMellitus: false, priorStroke: false, vascularDisease: false),
Patient(name: "Ava Wilson", age: 65, sex: .male, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: true, priorStroke: false, vascularDisease: false),
Patient(name: "Thomas Williams", age: 37, sex: .male, congestiveHeartFailure: true, hypertension: false, diabetesMellitus: false, priorStroke: true, vascularDisease: true),
Patient(name: "Oliver Nguyen", age: 40, sex: .other, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: false, priorStroke: false, vascularDisease: false),
Patient(name: "Ethan Nguyen", age: 72, sex: .other, congestiveHeartFailure: true, hypertension: true, diabetesMellitus: true, priorStroke: false, vascularDisease: true),
Patient(name: "William Wang", age: 56, sex: .female, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: true, priorStroke: true, vascularDisease: false),
Patient(name: "Jack Williams", age: 21, sex: .other, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: true, priorStroke: true, vascularDisease: false),
Patient(name: "Chloe Chen", age: 68, sex: .female, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: true, priorStroke: true, vascularDisease: true),
Patient(name: "Henry Chen", age: 71, sex: .other, congestiveHeartFailure: true, hypertension: true, diabetesMellitus: true, priorStroke: false, vascularDisease: true),
Patient(name: "William Nguyen", age: 74, sex: .female, congestiveHeartFailure: true, hypertension: false, diabetesMellitus: true, priorStroke: false, vascularDisease: true),
Patient(name: "Amelia Williams", age: 19, sex: .male, congestiveHeartFailure: true, hypertension: false, diabetesMellitus: true, priorStroke: false, vascularDisease: true),
Patient(name: "Chloe Angelopoulos", age: 76, sex: .female, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: true, priorStroke: false, vascularDisease: true),
Patient(name: "Noah Chen", age: 22, sex: .male, congestiveHeartFailure: true, hypertension: false, diabetesMellitus: true, priorStroke: false, vascularDisease: false),
Patient(name: "Mason Nguyen", age: 67, sex: .female, congestiveHeartFailure: true, hypertension: false, diabetesMellitus: true, priorStroke: true, vascularDisease: true),
Patient(name: "Harper Wilson", age: 53, sex: .female, congestiveHeartFailure: true, hypertension: true, diabetesMellitus: true, priorStroke: true, vascularDisease: false),
Patient(name: "Ethan Nguyen", age: 50, sex: .male, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: false, priorStroke: true, vascularDisease: true),
Patient(name: "Henry Wang", age: 34, sex: .male, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: false, priorStroke: false, vascularDisease: false),
Patient(name: "Ethan Williams", age: 48, sex: .female, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: true, priorStroke: true, vascularDisease: true),
Patient(name: "Grace Williams", age: 42, sex: .female, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: false, priorStroke: false, vascularDisease: false),
Patient(name: "Jack Lee", age: 58, sex: .female, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: false, priorStroke: true, vascularDisease: false),
Patient(name: "Isla Smith", age: 54, sex: .other, congestiveHeartFailure: true, hypertension: true, diabetesMellitus: false, priorStroke: false, vascularDisease: false),
Patient(name: "Mia Jones", age: 64, sex: .other, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: true, priorStroke: true, vascularDisease: true),
Patient(name: "Thomas Jones", age: 30, sex: .male, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: true, priorStroke: false, vascularDisease: false),
Patient(name: "Grace Angelopoulos", age: 65, sex: .other, congestiveHeartFailure: true, hypertension: true, diabetesMellitus: true, priorStroke: true, vascularDisease: false),
Patient(name: "Harper Nguyen", age: 68, sex: .other, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: false, priorStroke: false, vascularDisease: false),
Patient(name: "Chloe Wilson", age: 45, sex: .other, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: false, priorStroke: true, vascularDisease: false),
Patient(name: "Mason Jones", age: 38, sex: .other, congestiveHeartFailure: true, hypertension: true, diabetesMellitus: true, priorStroke: false, vascularDisease: false),
Patient(name: "Harper Angelopoulos", age: 37, sex: .male, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: false, priorStroke: false, vascularDisease: false),
Patient(name: "William Chen", age: 20, sex: .other, congestiveHeartFailure: true, hypertension: false, diabetesMellitus: true, priorStroke: true, vascularDisease: false),
Patient(name: "Isla Wang", age: 72, sex: .male, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: true, priorStroke: false, vascularDisease: false),
Patient(name: "Harper Nguyen", age: 26, sex: .male, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: false, priorStroke: true, vascularDisease: true),
Patient(name: "Noah Wang", age: 71, sex: .male, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: false, priorStroke: true, vascularDisease: true),
Patient(name: "Harper Chen", age: 64, sex: .female, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: true, priorStroke: false, vascularDisease: true),
Patient(name: "Thomas Smith", age: 40, sex: .other, congestiveHeartFailure: true, hypertension: false, diabetesMellitus: false, priorStroke: false, vascularDisease: true),
Patient(name: "Lucas Chen", age: 29, sex: .female, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: false, priorStroke: true, vascularDisease: true),
Patient(name: "Chloe Williams", age: 46, sex: .male, congestiveHeartFailure: true, hypertension: true, diabetesMellitus: false, priorStroke: false, vascularDisease: true),
Patient(name: "Lucas Jones", age: 49, sex: .female, congestiveHeartFailure: true, hypertension: true, diabetesMellitus: false, priorStroke: true, vascularDisease: true),
Patient(name: "James Chen", age: 28, sex: .other, congestiveHeartFailure: true, hypertension: false, diabetesMellitus: false, priorStroke: false, vascularDisease: false),
Patient(name: "Olivia Chen", age: 37, sex: .male, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: false, priorStroke: true, vascularDisease: false),
Patient(name: "Mia Smith", age: 70, sex: .other, congestiveHeartFailure: true, hypertension: false, diabetesMellitus: false, priorStroke: true, vascularDisease: false),
Patient(name: "Harper Smith", age: 52, sex: .male, congestiveHeartFailure: true, hypertension: true, diabetesMellitus: true, priorStroke: true, vascularDisease: false),
Patient(name: "Thomas Jones", age: 39, sex: .male, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: true, priorStroke: true, vascularDisease: false),
Patient(name: "Ava Wilson", age: 42, sex: .other, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: true, priorStroke: false, vascularDisease: true),
Patient(name: "Harper Wilson", age: 75, sex: .female, congestiveHeartFailure: true, hypertension: false, diabetesMellitus: true, priorStroke: false, vascularDisease: true),
Patient(name: "Olivia Haddad", age: 41, sex: .female, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: true, priorStroke: false, vascularDisease: true),
Patient(name: "Lucas Wilson", age: 24, sex: .female, congestiveHeartFailure: true, hypertension: true, diabetesMellitus: false, priorStroke: true, vascularDisease: false),
Patient(name: "James Lee", age: 29, sex: .other, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: false, priorStroke: false, vascularDisease: true),
Patient(name: "Grace Wang", age: 58, sex: .male, congestiveHeartFailure: true, hypertension: false, diabetesMellitus: true, priorStroke: false, vascularDisease: true),
Patient(name: "Thomas Williams", age: 34, sex: .female, congestiveHeartFailure: true, hypertension: false, diabetesMellitus: true, priorStroke: true, vascularDisease: false),
Patient(name: "Lucas Wilson", age: 26, sex: .male, congestiveHeartFailure: true, hypertension: true, diabetesMellitus: false, priorStroke: false, vascularDisease: true),
Patient(name: "Isla Wilson", age: 70, sex: .male, congestiveHeartFailure: true, hypertension: false, diabetesMellitus: false, priorStroke: false, vascularDisease: true),
Patient(name: "Oliver Smith", age: 48, sex: .other, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: true, priorStroke: false, vascularDisease: true),
Patient(name: "Ava Angelopoulos", age: 44, sex: .male, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: true, priorStroke: false, vascularDisease: false),
Patient(name: "Ella Williams", age: 56, sex: .other, congestiveHeartFailure: true, hypertension: true, diabetesMellitus: true, priorStroke: false, vascularDisease: false),
Patient(name: "Oliver Chen", age: 35, sex: .other, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: true, priorStroke: true, vascularDisease: true),
Patient(name: "Grace Lee", age: 50, sex: .male, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: true, priorStroke: true, vascularDisease: false),
Patient(name: "Oliver Angelopoulos", age: 45, sex: .other, congestiveHeartFailure: true, hypertension: true, diabetesMellitus: false, priorStroke: true, vascularDisease: true),
Patient(name: "Thomas Chen", age: 34, sex: .other, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: false, priorStroke: true, vascularDisease: true),
Patient(name: "Olivia Nguyen", age: 30, sex: .female, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: false, priorStroke: true, vascularDisease: true),
Patient(name: "Oliver Lee", age: 68, sex: .other, congestiveHeartFailure: true, hypertension: false, diabetesMellitus: true, priorStroke: true, vascularDisease: false),
Patient(name: "Lucas Smith", age: 66, sex: .other, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: false, priorStroke: true, vascularDisease: true),
Patient(name: "Olivia Wilson", age: 35, sex: .male, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: false, priorStroke: true, vascularDisease: true),
Patient(name: "William Wilson", age: 63, sex: .female, congestiveHeartFailure: true, hypertension: false, diabetesMellitus: false, priorStroke: true, vascularDisease: true),
Patient(name: "Ella Haddad", age: 66, sex: .female, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: false, priorStroke: false, vascularDisease: false),
Patient(name: "Lucas Wang", age: 27, sex: .male, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: true, priorStroke: false, vascularDisease: false),
Patient(name: "Chloe Angelopoulos", age: 73, sex: .other, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: false, priorStroke: false, vascularDisease: false),
Patient(name: "Olivia Nguyen", age: 52, sex: .other, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: false, priorStroke: true, vascularDisease: false),
Patient(name: "Noah Wang", age: 39, sex: .male, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: true, priorStroke: false, vascularDisease: true),
Patient(name: "Mason Williams", age: 58, sex: .female, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: false, priorStroke: true, vascularDisease: true),
Patient(name: "William Wilson", age: 63, sex: .male, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: true, priorStroke: true, vascularDisease: true),
Patient(name: "James Haddad", age: 76, sex: .male, congestiveHeartFailure: true, hypertension: false, diabetesMellitus: false, priorStroke: false, vascularDisease: true),
Patient(name: "Olivia Smith", age: 48, sex: .male, congestiveHeartFailure: true, hypertension: true, diabetesMellitus: false, priorStroke: true, vascularDisease: true),
Patient(name: "Ella Chen", age: 33, sex: .female, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: true, priorStroke: false, vascularDisease: true),
Patient(name: "Ava Chen", age: 35, sex: .other, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: true, priorStroke: true, vascularDisease: false),
Patient(name: "Ella Smith", age: 47, sex: .other, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: false, priorStroke: false, vascularDisease: true),
Patient(name: "Ethan Williams", age: 70, sex: .female, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: false, priorStroke: false, vascularDisease: false),
Patient(name: "Chloe Wang", age: 51, sex: .other, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: false, priorStroke: true, vascularDisease: true),
Patient(name: "Mason Wilson", age: 58, sex: .other, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: true, priorStroke: false, vascularDisease: false),
Patient(name: "Amelia Wilson", age: 37, sex: .male, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: true, priorStroke: true, vascularDisease: true),
Patient(name: "Thomas Lee", age: 24, sex: .male, congestiveHeartFailure: true, hypertension: true, diabetesMellitus: false, priorStroke: false, vascularDisease: true),
Patient(name: "Mason Wilson", age: 69, sex: .other, congestiveHeartFailure: false, hypertension: true, diabetesMellitus: false, priorStroke: false, vascularDisease: false),
Patient(name: "Mason Nguyen", age: 64, sex: .other, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: false, priorStroke: false, vascularDisease: false),
Patient(name: "Oliver Chen", age: 34, sex: .female, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: false, priorStroke: false, vascularDisease: false),
Patient(name: "Henry Nguyen", age: 65, sex: .other, congestiveHeartFailure: true, hypertension: true, diabetesMellitus: true, priorStroke: false, vascularDisease: false),
Patient(name: "William Chen", age: 62, sex: .female, congestiveHeartFailure: true, hypertension: false, diabetesMellitus: false, priorStroke: true, vascularDisease: false),
Patient(name: "Charlotte Wang", age: 40, sex: .male, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: true, priorStroke: false, vascularDisease: false),
Patient(name: "Chloe Nguyen", age: 56, sex: .female, congestiveHeartFailure: false, hypertension: false, diabetesMellitus: true, priorStroke: true, vascularDisease: false),
]

// our function for calculating the stroke risk percentage
// uses labels to make the calling of it slightly nicer
func calculateStrokeRisk(`for` patient: Patient) -> Double
{
    let strokeRisk = [0, 1.3, 2.2, 3.2, 4, 6.7, 9.8, 9.6, 12.5, 15.2]
    
    let riskValue = patient.risk
    
    if case 0..<strokeRisk.count = riskValue
    {
        return strokeRisk[riskValue]
    }
    return 0
}

// calculating the risk for a single patient
calculateStrokeRisk(for: patients[0])

// showing off higher level features of swift and how they can be chained together for great effect
// determining the risk for all patients with a level of four or greater
// then sorting them based on risk and printing out their name and stroke chance
let highRisk = patients.filter({ $0.risk >= 4 }).sorted(by: { $0.risk < $1.risk }).map({ ($0.name, calculateStrokeRisk(for: $0)) })

for (name, riskPercentage) in highRisk
{
    print("\(name) has a \(riskPercentage)% chance of stroke")
}
