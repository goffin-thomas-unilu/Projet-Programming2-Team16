import Foundation
// An enum for character classes.
enum CharacterClass: String {
    case knight = "Knight"
    case paladin = "Paladin"
    case hunter = "Hunter"
    case druid = "Druid"
    case pyromancer = "Pyromancer"
    case dragon = "Dragon"
}

// Structure for the special skills
struct SpecialSkill {
    let name: String
    let description: String
}

// Structure for a player character
struct PlayerCharacter {
    let characterClass: CharacterClass
    var inventory:[String]
    var healthPoint: Int
    let maxHealth:Int
    let maxMana:Int
    var mana: Int
    var stamina: Int
    var attack: Int
    var speed: Int
    var defense: Int
    var magic: Int
    var exp: Int
    var level: Int
    let specialSkill: SpecialSkill
}

// Creating all the player characters
let knight = PlayerCharacter(characterClass: .knight,inventory: [], healthPoint: 170,maxHealth: 170,maxMana:10, mana: 10,stamina: 35, attack: 40, speed: 8, defense: 30, magic: 5,exp: 0,level: 1, specialSkill: SpecialSkill(name: "Knight's will", description: "+25% DEF, +25% ATK for 2 turns"))

let paladin = PlayerCharacter(characterClass: .paladin,inventory: [], healthPoint: 150,maxHealth: 150,maxMana:25,  mana: 25,stamina: 30, attack: 30, speed: 12, defense: 25, magic: 25,exp: 0,level: 1, specialSkill: SpecialSkill(name: "Divine Lightning", description: "Light damage + healing 15 HP"))

let hunter = PlayerCharacter(characterClass: .hunter, inventory: [],healthPoint: 110,maxHealth: 110,maxMana:15,  mana: 15, stamina: 25, attack: 50, speed: 20, defense: 15, magic: 15,exp: 0,level: 1, specialSkill: SpecialSkill(name: "Piercing Arrow", description: "Ignores 50% enemy DEF"))

let druid = PlayerCharacter(characterClass: .druid,inventory: [], healthPoint: 120,maxHealth: 120,maxMana:30,  mana: 30, stamina: 20, attack: 20, speed: 10,defense: 15, magic: 40,exp: 0,level: 1, specialSkill: SpecialSkill(name: "Chastisement of the Ancients", description: "Damage + life theft 10%"))

let pyromancer = PlayerCharacter(characterClass: .pyromancer,inventory: [], healthPoint: 90,maxHealth: 90,maxMana:35,  mana: 35, stamina: 15, attack: 10, speed: 15, defense: 5, magic: 60,exp: 0,level: 1, specialSkill: SpecialSkill(name: "Supreme fireball", description: "Burns for 3 turns"))

let dragon = PlayerCharacter(characterClass: .dragon,inventory: [], healthPoint: 999,maxHealth: 999,maxMana:999,  mana: 999, stamina: 999, attack: 999, speed: 999, defense: 999, magic: 999,exp: 999,level: 999, specialSkill: SpecialSkill(name: "Draconic Wrath", description: "One shot anything"))

// A list of characters
let playerCharacters = [knight, paladin, hunter, druid, pyromancer]

func displayPlayerCharacters() {
    for character in playerCharacters {
        print("\(character.characterClass.rawValue): HP \(character.healthPoint), Mana \(character.mana), Special: \(character.specialSkill.name)")
    }
}

func displayPlayerStatus(){
    print()
    print("HP: \(player.healthPoint), Mana: \(player.mana), stamina: \(player.stamina), attack: \(player.attack), speed: \(player.speed), defense: \(player.defense), magic: \(player.magic)")
}