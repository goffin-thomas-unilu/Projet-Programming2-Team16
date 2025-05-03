enum Affinity {
    case fire, ice, light, darkness, earth, water, none
}

enum EnemyType {
    case goblin
    case skeleton
    case undead
    case werewolf
    case iceSpecter
    case caveGiant
    case necromancer
    case madAlchemist
    case valdrakar
}

extension EnemyType {
    func toString() -> String {
        switch self {
            case .goblin: return "🧌 Goblin"
            case .skeleton: return "💀 Skeleton"
            case .undead: return "🧟 Undead"
            case .werewolf: return "🐺 Werewolf"
            case .iceSpecter: return "👻 Ice Specter"
            case .caveGiant: return "🗿 Cave Giant"
            case .necromancer: return "🦴 Necromancer"
            case .madAlchemist: return "🧪 Mad Alchemist"
            case .valdrakar: return "🐉 Valdrakar"
        }
    }
}

extension EnemyType {
    static func fromString(_ name: String) -> EnemyType {
        switch name.lowercased() {
            case "goblin": return .goblin
            case "skeleton": return .skeleton
            case "undead": return .undead
            case "werewolf": return .werewolf
            case "ice specter", "icespecter": return .iceSpecter
            case "cave giant", "cavegiant": return .caveGiant
            case "necromancer": return .necromancer
            case "mad alchemist", "madalchemist": return .madAlchemist
            case "valdrakar": return .valdrakar
            default: 
                print("⚠️ Unknown enemy: \(name). Default: Goblin.")
                return .goblin
        }
    }
}

enum EnemySkill {
    case stealItems(chance: Int)           // Item theft (% chance)
    case fleeAtLowHP(threshold: Int)       // Flee when HP < threshold
    case revive(healthPercent: Int)        // Revive with % HP
    case magicResistance(reduction: Int)   // Magic damage reduction
    case poison(damage: Int, duration: Int)// Poison damage
    case healOverTime(amount: Int)         // HP regeneration
    case nightBoost(multiplier: Double)    // Nighttime boost
    case freeze(chance: Int)               // Freeze chance
    case drainMP(amount: Int)              // MP drain
    case aoeDamage(multiplier: Double)     // Area of effect damage
    case armorBreak(reduction: Int)        // Armor reduction
    case summonEnemy(type: String)         // Enemy summoning
    case drainHPMP(hpAmount: Int, mpAmount: Int) // HP and MP drain
    case randomPotionEffect                // Random potion effect
    case enrage(threshold: Int, multiplier: Double) // Empower when HP < threshold
    case aoeBreath(damage: Int)            // Area breath attack
}

struct Enemy {
    let type: EnemyType
    var health: Int
    let maxHealth: Int
    let attack: Int
    let defense: Int
    let speed: Int
    let affinity: Affinity
    let skills: [EnemySkill]
    var isAlive: Bool { health > 0 }
    
    init(type: EnemyType) {
        self.type = type
        
        switch type {
            case .goblin:
                self.health = 60
                self.maxHealth = 60
                self.attack = 15
                self.defense = 5
                self.speed = 18
                self.affinity = .earth
                self.skills = [
                    .stealItems(chance: 30),
                    .fleeAtLowHP(threshold: 15)
                ]
                
            case .skeleton:
                self.health = 80
                self.maxHealth = 80
                self.attack = 20
                self.defense = 15
                self.speed = 10
                self.affinity = .darkness
                self.skills = [
                    .revive(healthPercent: 50),
                    .magicResistance(reduction: 30)
                ]
                
            case .undead:
                self.health = 100
                self.maxHealth = 100
                self.attack = 18
                self.defense = 10
                self.speed = 8
                self.affinity = .darkness
                self.skills = [
                    .poison(damage: 5, duration: 3),
                    .healOverTime(amount: 5)
                ]
                
            case .werewolf:
                self.health = 120
                self.maxHealth = 120
                self.attack = 25
                self.defense = 12
                self.speed = 22
                self.affinity = .none
                self.skills = [
                    .nightBoost(multiplier: 1.5)
                ]
                
            case .iceSpecter:
                self.health = 90
                self.maxHealth = 90
                self.attack = 15
                self.defense = 8
                self.speed = 20
                self.affinity = .ice
                self.skills = [
                    .freeze(chance: 25),
                    .drainMP(amount: 5)
                ]
                
            case .caveGiant:
                self.health = 250
                self.maxHealth = 250
                self.attack = 30
                self.defense = 30
                self.speed = 5
                self.affinity = .earth
                self.skills = [
                    .aoeDamage(multiplier: 0.7),
                    .armorBreak(reduction: 10)
                ]
                
            case .necromancer:
                self.health = 200
                self.maxHealth = 200
                self.attack = 20
                self.defense = 15
                self.speed = 10
                self.affinity = .darkness
                self.skills = [
                    .summonEnemy(type: "skeleton"),
                    .drainHPMP(hpAmount: 5, mpAmount: 5)
                ]
                
            case .madAlchemist:
                self.health = 180
                self.maxHealth = 180
                self.attack = Int.random(in: 15...25)
                self.defense = 10
                self.speed = 14
                self.affinity = .none
                self.skills = [
                    .randomPotionEffect
                ]
                
            case .valdrakar:
                self.health = 400
                self.maxHealth = 400
                self.attack = 35
                self.defense = 25
                self.speed = 16
                self.affinity = .darkness
                self.skills = [
                    .enrage(threshold: 50, multiplier: 1.5),
                    .aoeBreath(damage: 30)
                ]
        }
    }
    
    func displayStats() {
        print("\n\(type) - HP: \(health)/\(maxHealth), ATK: \(attack), DEF: \(defense), SPD: \(speed)")
        print("Affinity: \(affinity)")
        print("Skills:")
        for skill in skills {
            print("- \(describeSkill(skill: skill))")
        }
    }
    
    private func describeSkill(skill: EnemySkill) -> String {
        switch skill {
        case .stealItems(let chance):
            return "Steals items (\(chance)% chance)"
        case .fleeAtLowHP(let threshold):
            return "Flees when HP < \(threshold)"
        case .revive(let percent):
            return "Revives with \(percent)% HP once"
        case .magicResistance(let reduction):
            return "Magic resistance (\(reduction)% reduction)"
        case .poison(let damage, let duration):
            return "Poisons (\(damage) dmg/turn for \(duration) turns)"
        case .healOverTime(let amount):
            return "Heals \(amount) HP per turn"
        case .nightBoost(let multiplier):
            return "Night boost (\(multiplier)x damage)"
        case .freeze(let chance):
            return "Freeze attack (\(chance)% chance)"
        case .drainMP(let amount):
            return "Drains \(amount) MP per hit"
        case .aoeDamage(let multiplier):
            return "Area attack (\(multiplier)x damage)"
        case .armorBreak(let reduction):
            return "Breaks armor (-\(reduction) DEF)"
        case .summonEnemy(let type):
            return "Summons \(type)"
        case .drainHPMP(let hpAmount, let mpAmount):
            return "Drains \(hpAmount) HP and \(mpAmount) MP"
        case .randomPotionEffect:
            return "Random potion effects"
        case .enrage(let threshold, let multiplier):
            return "Enrages (<\(threshold)% HP, \(multiplier)x damage)"
        case .aoeBreath(let damage):
            return "Dragon breath (\(damage) dmg to all)"
        }
    }
    
    // mutating func executeSkill(target: inout Character) {
    //     for skill in skills {
    //         let randomValue = Int.random(in: 1...100)
            
    //         switch skill {
    //         case .stealItems(let chance) where randomValue <= chance:
    //             if !target.inventory.isEmpty {
    //                 let stolenItem = target.inventory.removeFirst()
    //                 print("\(type) stole your \(stolenItem.name)!")
    //             }
                
    //         case .fleeAtLowHP where health < maxHealth / 4:
    //             print("\(type) flees from battle!")
    //             health = 0
                
    //         case .poison(let damage, let duration):
    //             print("You've been poisoned! (\(damage) dmg/turn)")
                
    //         case .healOverTime(let amount):
    //             health = min(maxHealth, health + amount)
    //             print("\(type) heals \(amount) HP!")
                
    //         case .drainMP(let amount):
    //             target.mana = max(0, target.mana - amount)
    //             print("\(type) drains \(amount) of your MP!")
                
    //         case .summonEnemy(let type):
    //             print("\(type) summons a \(type)!")
                
    //         case .randomPotionEffect:
    //             let effects = ["heal", "poison", "boost", "confuse"]
    //             let randomEffect = effects.randomElement()!
    //             print("Mad Alchemist throws a strange potion: \(randomEffect) effect!")
                
    //         case .enrage(_, let multiplier) where health < maxHealth / 2:
    //             print("\(type) enrages! Damage increased!")
                
    //         default:
    //             break
    //         }
    //     }
    // }
    
    mutating func takeDamage(_ amount: Int, isMagical: Bool = false) {
        var finalDamage = amount
        
        for skill in skills {
            if case .magicResistance(let reduction) = skill, isMagical {
                finalDamage = finalDamage * (100 - reduction) / 100
            }
        }
        
        health -= finalDamage
        if health < 0 {
            health = 0
        }
        
        print("\(type) takes \(finalDamage) damage!")
    }
}