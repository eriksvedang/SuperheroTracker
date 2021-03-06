# CocoaHeads Göteborg

## Swift hackathon, December 2014

---

# [fit] Welcome 

---

# My name is Cenny
## CocoaHeads Orginizer and not an Swift expert

---

# [fit] Swift

---

# Swift is an imperative object oriented language.
# Swift is not an functinal language.

---

# But that sould not stop us from being functional.

---

> It would be a shame to ignore this opportunity and just continue to write in Objective-C, but using Swift syntax.
-- Ash Furrow

---
# [fit] Constants and Variables

- Value and Reference Types
- Staticly typed
- Type inference
- Must have an value

---
# Varibles

```swift

// Declare the type and use initlizer
var number: Int = Int(3)

// Type infrence and literal
var number = 3

// Strictly typed
number = 4
number = 5.0 // Compile time error

```

---
# Contstants

```swift

let text = "Hello,World!"
text 	 = "Goodbye, World!" // comoplie time error

```
---

# Value type

```swift

// Value types
var text 		= "Hello,World"
var otherText 	= text
otherText 		+= "!"

otherText 	// Hello, World!
text 		// Hello, World

```

---
# Refrence types

```swift

// Refrence types
var superhero = Superhero("Batman")
var sameHero  = superhero

sameHero.name = "Superman"
superhero.name // Superman


// Refrence types and constants
let superhero  = Superhero("Batman")
superhero.name = "Superman" // No error

```

---

# [fit] Optionals

- A wraper around a varible or constant that may be nil

---
# Optionals

```swift

// Aan optional varible
var batman: String? = "Batman"

// Optional binding
if let hero = batman {
    // If batman is not nil, hero == "Batman"
}

// Force unwrapping
var hero = batman! // Will cause runtime error if nil

```
---
# Optionals

```swift

//  Nil coalescing operator 
let supermansFriend = batman ?? "Krypto the superdog"

// Can be chained 
if let hero = batman.belt?.batarang? {
	// Throw batarang
}

// Can be used for delegation
var delegate: SuperheroDelegate?

batman.punch(joker)
delegate?.superHeroPunched(joker)

```

---
# [fit] Collections

- Array
- Dictonary
	- Returns optionals
- Tuples
- There is no Set at the moment
- Can hold types and objects

---
# Arrays

```swift

// Array
let superheroes 	= ["Batman", "Superman"]

// Concatination
let moreSuperheroes = superheroes + ["Wonder Woman"] 

// Get value
superheroes[0] // "Batman"


```
---

# Dictonaries

```swift

// Dictonaries
var powers = ["Batman" : ["Genius", "Martial artisit"],
   		    "Superman" : ["Superstrong", "Flight"]]

// Add key and value
powers["Wonder Woman"] = ["Superstrong", "Flight"]

// Remove value
powers["Superman"] = nil

// Get value, Remeber its a optional
powers["Batman"] // ["Genius", "Martial artisit"]?

```

---

# Tuples

```swift

// Tuples
let team = ("Batman", "Robin")
team.0 // Batman

// Tuple with named attributes
let team = (Hero: "Batman", Sidekick: "Robin")
team.Hero // Batman
```

---


# [fit] Control flow

- The usual suspects
	- if, else, while and for
- Switch is the new king in town
	- Pattern matching with guards

---

# Loops

```swift
let heroes = ["Batman", "Superman", "Wonder Woman"]

for hero in heroes {
    println("\(hero) is here")
}

for i in 1...3 {
    println("\(i)")
}

var value = 4
while value < 11 {
    value++
}

```
---
# If

```swift
if heroes.count < 10 {
    // Do something
} else if heroes.count == 13 {
    // Do something
} else {
	// Do something
}
```

---
# Switch

```swift
let missionDangerLvl = 6
let vilian = "Joker"

switch (missionDangerLvl, vilian) {
case (10, let x) where x != "Joker":
    println("Bring all the stuff and Robin")
case (_, "Joker"):
    println("Don't bring Jason Todd")
case (5...9, _):
    println("Bring sharkrepelent just in case")
default:
    println("Let the cops handle it")
}

```

---

# [fit] Functions

- Named parameters
- Variadic parameter
- Parameters with default values
- Multiple returns values
- Overloading


---
# Functions

```swift

// Takes two Int's and returns an Int
func sum(x: Int, y: Int) -> Int {
    return x + y
}

sum(10, 10) // 20


// Function with named parameters
func multiply(x: Int, with y: Int) -> Int {
    return x * y
}

multiply(10, with: 5) // 50

```
---
# Functions

```swift

// Variadic parameter with external shorthand parameter name
func remove(character: Character, var #fromString: String) -> String {
    let index = find(fromString, character)
    
    if let i = index {
        fromString.removeAtIndex(i)
    }
    return fromString
}

remove("C", fromString: "Cenny") // "enny"?

```
---

# [fit] Closures

- A lot like blocks in Obj-C
- Functions are named closures

---
# Closures

```swift
// A function
func doubleFunction(number:Int) -> Int {
    return number*2
}

// A closure
let doubleClosure = { (number: Int) -> Int in
    return number*2
}

// Function are named closures so we can bind them
let doubleFunctionVarible = doubleFunction

doubleClosure(5)         // 10
doubleFunction(5)        // 10
doubleFunctionVarible(5) // 10

```

---

# [fit] Classes and structures

- Classes are refrence type, structures are value types
- Classes can be subclassed

---

# Class

```swift

class Superhero: Printable {
    var name: String
    var superFriend: Superhero?
    
    var description: String {
        return name
    }
    
    init(name: String) {
        self.name = name
    }
    
    func callSuperfriend() {
        // Call friend
    }
}

var hero 		 = Superhero(name: "Batman")
hero.superFriend = Superhero(name: "Superman")
hero.callSuperfriend()

```

---

# Struct

```swift

struct Batarang {
    var sharpness: Int
    
    mutating func throw() {
        --sharpness
    }
}

var batarang = Batarang(sharpness: 8)
batarang.throw()

```

---

# [fit] Properties

- Computed
- Lazy
- Type
- Observers

---
# Properties

```swift

class Superhero: Printable {
    
    // Stored property with default value and observers
    var name: String = "Batman" {
        didSet {
            // use varible oldValue for old value
        }
        willSet {
            // use varible newValue for new value
        }
    }
    
    // Computed property
    var description: String {
        get {
            return name
        }
    }
    
    // Lazy propery
    lazy var data = complexDataLoading()
    
    // self evaluating closure
    var friends: [String] = {
       return ["Superman", "Wonder Woman"]
    }()
}

```

---

# [fit] Higher-order functions
 
- Takes or returns functions
	- Map, Filter, Sort and Reduce
- Easy syntax
	- Traling closure
	- Shorthands 
	- Implicit returns

---

# Filter

```swift

// Convinient way to make an array
let oneToTen = Array(1...10) 
// [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// filter takes a closure/function
let evens = oneToTen.filter({ number in
    return number % 2 == 0
}) // [2, 4, 6, 8, 10]

// Same as above
let evens = oneToTen.filter { $0 % 2 == 0 }

```

---

# Map

```swift
// Map transforms an array, 
let twoToEleven = oneToTen.map { $0 + 1 }

twoToEleven // [2, 3, 4, 5, 6, 7, 8, 9, 10, 11]


// Rember the double function
let OneToTenDoubled = oneToTen.map(doubleFunction) 

OneToTenDoubled // [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

```

---

# Sort and reduce

```Swift
// Operators are functions
let evenSum = evens.reduce(0, combine: +) // 30


// Sorting is very easy with sorted
let names = ["Cenny", "Pär", "Carl"]
let sortedNames = names.sorted(<) // ["Carl", "Cenny", "Pär"]

```

---

# [fit] Standard library functions

- These are global functions
- A lot of good things here
- Check here before you bridge to the old classes

---
# Functions on sequences

```swift

let heroes = ["Batman", "Superman", "Womder Woman"]

contains(heroes, "Superman") // true

find(heroes, "Superman") // 1?

join(", ", heroes) // "Batman, Superman, Womder Woman"

maxElement(heroes) // Wonder Woman

```

---
# Let's solve some problems
---
## Lets build an app to help Batman keep track of the Justice League.
---

Exemple of things to implement 

- Filters (Banned menbers, Flying members)
- Searchbar
- Add, remove and edit members
- Sort (most powerful, Smartest)
- Categories (superpowers)
- More advance info in cell

---
# Model

```swift
enum Abilities {
    case SuperSpeed
    case SuperStrength
    case Flight
    case Invulnerability
    case Magic
    case MartialArtst(skill: Int)
    case Stealth(skill: Int)
    case Intellect(IQ: Int)
    case Marksmanship(skill: Int)
}

struct Superhero {
    
    let name: String
    let secretIdentiy: String
    let powers: [Abilities]
    
}

```
---

# Store

```swift

class SuperheroStore {
    
    // An list all heroes
    var heroes = SuperheroStore.loadHeroes()
    
    // Returns an sorted list based on name
    func sortedByName() -> [Superhero] {
        return heroes.sorted{ $0.name < $1.name }
    }
}

```

---

# Table view controller

```swift
class MasterViewController: UITableViewController {

    let superheroStore = SuperheroStore()
    lazy var heroData: [Superhero] = { self.superheroStore.sortedByName() }()

    // MARK: - Table View

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroData.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        cell.textLabel!.text = heroData[indexPath.row].name
        return cell
    }
}
```

---

# Ask me anything

Github link - 
github.com/cocoaheads-goteborg/SuperheroTracker

bitly link -
bit.ly/1CFZCMX
