import Foundation

// An enum for character classes.
enum CharacterClass: String {
    case knight = "Knight"
    case paladin = "Paladin"
    case hunter = "Hunter"
    case druid = "Druid"
    case pyromancer = "Pyromancer"
}

// Structure for the special skills
struct SpecialSkill {
    let name: String
    let description: String
}

// Structure for a player character
struct PlayerCharacter {
    let characterClass: CharacterClass
    let healthPoint: Int
    let mana: Int
    let stamina: Int
    let attack: Int
    let speed: Int
    let defense: Int
    let magic: Int
    let specialSkill: SpecialSkill
}

// Creating all the player characters
let knight = PlayerCharacter(characterClass: .knight, healthPoint: 170, mana: 10, stamina: 35, attack: 40, speed: 8, defense: 30, magic: 5, specialSkill: SpecialSkill(name: "Knight's will", description: "+25% DEF, +25% ATK for 2 turns"))

let paladin = PlayerCharacter(characterClass: .paladin, healthPoint: 150, mana: 25,stamina: 30, attack: 30, speed: 12, defense: 25, magic: 25, specialSkill: SpecialSkill(name: "Divine Lightning", description: "Light damage + healing 15 HP"))

let hunter = PlayerCharacter(characterClass: .hunter, healthPoint: 110, mana: 15, stamina: 25, attack: 50, speed: 20, defense: 15, magic: 15, specialSkill: SpecialSkill(name: "Piercing Arrow", description: "Ignores 50% enemy DEF"))

let druid = PlayerCharacter(characterClass: .druid, healthPoint: 120, mana: 30, stamina: 20, attack: 20, speed: 10,defense: 15, magic: 40, specialSkill: SpecialSkill(name: "Chastisement of the Ancients", description: "Damage + life theft 10%"))

let pyromancer = PlayerCharacter(characterClass: .pyromancer, healthPoint: 90, mana: 35, stamina: 15, attack: 10, speed: 15, defense: 5, magic: 60, specialSkill: SpecialSkill(name: "Supreme fireball", description: "Burns for 3 turns"))

// A list of characters
let playerCharacters = [knight, paladin, hunter, druid, pyromancer]

func displayPlayerCharacters() {
    for character in playerCharacters {
        print("\(character.characterClass.rawValue): HP \(character.healthPoint), Mana \(character.mana), Special: \(character.specialSkill.name)")
    }
}

