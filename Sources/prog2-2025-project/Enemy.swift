import Foundation

enum Affinity: String, CaseIterable {
    case fire = "🔥 Fire"
    case ice = "❄️ Ice"
    case light = "✨ Light"
    case darkness = "🌑 Darkness"
    case earth = "🌍 Earth"
    case water = "💧 Water"
    case none = "⚪ None"
    
    var strongAgainst: Affinity? {
        switch self {
            case .fire: return .ice
            case .ice: return .water
            case .water: return .fire
            case .light: return .darkness
            case .darkness: return .light
            default: return nil
        }
    }
    
    var weakAgainst: Affinity? {
        switch self {
            case .fire: return .water
            case .ice: return .fire
            case .water: return .ice
            case .light: return .darkness
            case .darkness: return .light
            default: return nil
        }
    }
    
    var specialEffect: String {
        switch self {
            case .fire: return "2-turn burn"
            case .ice: return "Slowing down (25%)"
            case .light: return "Immunity to curses"
            case .darkness: return "Life theft (+5% per attack)"
            case .earth: return "Armor +20"
            case .water: return "Heal +10% in aquatic zone"
            case .none: return "No special effect"
        }
    }
}

enum EnemyType: String {
    case goblin = "🧌 Goblin"
    case skeleton = "💀 Skeleton"
    case undead = "🧟 Undead"
    case werewolf = "🐺 Werewolf"
    case iceSpecter = "👻 Ice Specter"
    case caveGiant = "🗿 Cave Giant"
    case necromancer = "🦴 Necromancer"
    case madAlchemist = "🧪 Mad Alchemist"
    case valdrakar = "🐉 Valdrakar"
    
    var isBoss: Bool {
        switch self {
            case .caveGiant, .necromancer, .madAlchemist, .valdrakar: return true
            default: return false
        }
    }
}

enum EnemySkill {
    case stealItems(chance: Int)
    case fleeAtLowHP(threshold: Int)
    case revive(healthPercent: Int)
    case magicResistance(reduction: Int)
    case poison(damage: Int, duration: Int)
    case healOverTime(amount: Int)
    case nightBoost(multiplier: Double)
    case freeze(chance: Int)
    case drainMP(amount: Int)
    case aoeDamage(multiplier: Double)
    case armorBreak(reduction: Int)
    case summonEnemy(type: EnemyType)
    case drainHPMP(hpAmount: Int, mpAmount: Int)
    case randomPotionEffect
    case enrage(threshold: Int, multiplier: Double)
    case aoeBreath(damage: Int)
    
    var description: String {
        switch self {
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
                return "Summons \(type.rawValue)"
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
                    .summonEnemy(type: .skeleton),
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
       if type.isBoss {
            print("\n⚠️ BOSS ENEMY ⚠️")
        }
        print("\n=== \(type.rawValue) ===")
        print("HP: \(health)/\(maxHealth)")
        print("ATK: \(attack) | DEF: \(defense) | SPD: \(speed)")
        print("Affinity: \(affinity.rawValue)")
        print("Special Effects: \(affinity.specialEffect)")
        
        if !skills.isEmpty {
            print("\nSkills:")
            for skill in skills {
                print("- \(skill.description)")
            }
        }
        
        
    }
    
    mutating func takeDamage(_ amount: Int, from attackerAffinity: Affinity? = nil, using item: String? = nil) -> (damageDealt: Int, wasCritical: Bool) {
        var finalDamage = amount
        var wasCritical = false
        
        // Check for item effects
        if let item = item {
            switch (item.lowercased(), type) {
                case ("sword of the crusader", .skeleton), ("sword of the crusader", .undead):
                    finalDamage = Int(Double(finalDamage) * 1.2)
                    print("Sword of the Crusader is effective against undead!")
                case ("bow of the hunter", _):
                    finalDamage = Int(Double(finalDamage) * 1.25)
                case ("wand of fire", .iceSpecter):
                    finalDamage = Int(Double(finalDamage) * 1.3)
                    wasCritical = true
                default:
                    break
            }
        }
        
        // Check for affinity weaknesses/resistances
        if let attackerAffinity = attackerAffinity {
            if attackerAffinity == self.affinity.strongAgainst {
                finalDamage = Int(Double(finalDamage) * 1.5)
                print("It's super effective! (\(self.affinity.rawValue) is weak to \(attackerAffinity.rawValue))")
                wasCritical = true
            } else if attackerAffinity == self.affinity.weakAgainst {
                finalDamage = Int(Double(finalDamage) * 0.5)
                print("It's not very effective... (\(self.affinity.rawValue) resists \(attackerAffinity.rawValue))")
            }
        }
        
        for skill in skills {
            if case .magicResistance(let reduction) = skill, attackerAffinity != nil {
                finalDamage = finalDamage * (100 - reduction) / 100
            }
        }
        
        health = max(0, health - finalDamage)
        return (finalDamage, wasCritical)
    }
    
    mutating func executeSkill(target: inout PlayerCharacter, isNight: Bool = false) -> (description: String, damage: Int?, effect: (type: String, value: Int)?) {
        var result = ""
        var damage: Int? = nil
        var effect: (type: String, value: Int)? = nil
        
        for skill in skills {
            let randomValue = Int.random(in: 1...100)
            
            switch skill {
                case .poison(let dmg, let duration) where randomValue <= 30:
                    result += "\(type.rawValue) poisons you for \(dmg) damage over \(duration) turns!\n"
                    effect = ("poison", duration)
                    damage = dmg
                    
                case .healOverTime(let amount):
                    health = min(maxHealth, health + amount)
                    result += "\(type.rawValue) heals \(amount) HP!\n"
                    
                case .drainMP(let amount):
                    target.mana = max(0, target.mana - amount)
                    result += "\(type.rawValue) drains \(amount) of your MP!\n"
                    damage = amount
                    
                case .summonEnemy(let type):
                    result += "\(type.rawValue) summons a \(type.rawValue)!\n"
                    
                case .randomPotionEffect:
                    let effects = [
                        ("heals itself", 15, "heal"),
                        ("throws a poison flask", 10, "poison"),
                        ("boosts its attack", 5, "attackBoost")
                    ]
                    let chosenEffect = effects.randomElement()!
                    result += "\(type.rawValue) \(chosenEffect.0)!\n"
                    effect = (chosenEffect.2, chosenEffect.1)
                    
                case .enrage(_, let multiplier) where health < maxHealth / 2:
                    result += "\(type.rawValue) enrages! Damage increased!\n"
                    
                case .aoeBreath(let dmg):
                    result += "\(type.rawValue) breathes fire on everyone for \(dmg) damage!\n"
                    damage = dmg
                    
                case .nightBoost(let multiplier) where isNight:
                    let boostedDamage = Int(Double(attack) * multiplier)
                    result += "\(type.rawValue) is empowered by the night!\n"
                    damage = boostedDamage
                    
                case .stealItems(let chance) where randomValue <= chance && !isEmpty():
                    let stolenItem = player.inventory.items.first
                    removeFirst()
                    result += "\(type.rawValue) stole your \(stolenItem)!\n"
                    
                case .fleeAtLowHP where health < maxHealth / 4:
                    result += "\(type.rawValue) flees from battle!\n"
                    health = 0
                    
                case .revive(let percent) where health <= 0:
                    health = maxHealth * percent / 100
                    result += "\(type.rawValue) revives with \(percent)% HP!\n"
                    
                case .armorBreak(let reduction):
                    target.defense = max(0, target.defense - reduction)
                    result += "\(type.rawValue) breaks your armor! (-\(reduction) DEF)\n"
                    effect = ("armorBreak", reduction)
                    
                case .freeze(let chance) where randomValue <= chance:
                    result += "\(type.rawValue) freezes you in place!\n"
                    effect = ("freeze", 1) // Freeze for 1 turn
                    
                default:
                    continue
            }
            
            // Only execute one skill per turn
            if !result.isEmpty {
                break
            }
        }
        
        if result.isEmpty {
            result = "\(type.rawValue) attacks!"
            damage = attack
        }
        
        return (result, damage, effect)
    }

    func createEnemy(from name: String) -> Enemy {
        let lowercasedName = name.lowercased().replacingOccurrences(of: " ", with: "")
        
        switch lowercasedName {
            case "goblin": return Enemy(type: .goblin)
            case "skeleton": return Enemy(type: .skeleton)
            case "undead": return Enemy(type: .undead)
            case "werewolf": return Enemy(type: .werewolf)
            case "icespecter": return Enemy(type: .iceSpecter)
            case "cavegiant": return Enemy(type: .caveGiant)
            case "necromancer": return Enemy(type: .necromancer)
            case "madalchemist": return Enemy(type: .madAlchemist)
            case "valdrakar": return Enemy(type: .valdrakar)
            default:
                print("⚠️ Unknown enemy: \(name). Defaulting to Goblin.")
                return Enemy(type: .goblin)
        }
    }
}