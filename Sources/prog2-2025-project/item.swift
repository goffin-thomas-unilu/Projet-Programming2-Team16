import Foundation

enum ItemType {
    case weapon
    case armor
    case consumable
    case special
}

enum ItemEffect {
    case heal(amount: Int)
    case restoreMana(amount: Int)
    case damageBoost(multiplier: Double)
    case defenseBoost(amount: Int)
    case affinityBoost(affinity: Affinity, power: Int)
    case statusEffect(type: String, duration: Int)
}

struct Item {
    let name: String
    let type: ItemType
    let description: String
    let effects: [ItemEffect]
    var isEquipped: Bool = false
    
    init(name: String, type: ItemType, description: String, effects: [ItemEffect]) {
        self.name = name
        self.type = type
        self.description = description
        self.effects = effects
    }
    
    func display() {
        print("\n\(name) [\(type)]")
        print("Description: \(description)")
        print("Effects:")
        for effect in effects {
            switch effect {
                case .heal(let amount):
                    print("- Heals \(amount) HP")
                case .restoreMana(let amount):
                    print("- Restores \(amount) MP")
                case .damageBoost(let multiplier):
                    print("- Increases damage by \(multiplier)x")
                case .defenseBoost(let amount):
                    print("- Boosts defense by \(amount)")
                case .affinityBoost(let affinity, let power):
                    print("- Enhances \(affinity.rawValue) by \(power)%")
                case .statusEffect(let type, let duration):
                    print("- Applies \(type) for \(duration) turns")
            }
        }
    }
    
    func use(on target: inout Character) -> String {
        var result = "You use \(name). "
        
        for effect in effects {
            switch effect {
                case .heal(let amount):
                    player.healthPoint = min(player.healthPoint + amount, player.maxHealth)
                    result += "Healed \(amount) HP. "
                case .restoreMana(let amount):
                    player.mana = min(player.mana + amount, player.maxMana)
                    result += "Restored \(amount) MP. "
                case .damageBoost(let multiplier):
                    player.attack = Int(Double(player.attack) * multiplier)
                    result += "Damage increased. "
                case .defenseBoost(let amount):
                    player.defense += amount
                    result += "Defense boosted by \(amount). "
                case .affinityBoost(let affinity, _):
                    result += "\(affinity.rawValue) enhanced. "
                case .statusEffect(let type, _):
                    result += "Applied \(type). "
            }
        }
        
        return result
    }
}

class Inventory {
    private(set) var items: [Item] = []
    private(set) var capacity: Int
    
    init(capacity: Int = 20) {
        self.capacity = capacity
    }
    
    func add(item: Item) -> Bool {
        guard items.count < capacity else {
            print("Inventory full!")
            return false
        }
        items.append(item)
        return true
    }
    
    func remove(itemName: String) -> Item? {
        guard let index = items.firstIndex(where: { $0.name == itemName }) else {
            return nil
        }
        return items.remove(at: index)
    }
    
    func equip(itemName: String) -> String {
        guard let index = items.firstIndex(where: { $0.name == itemName }) else {
            return "Item not found"
        }
        
        // Unequip all items of same type
        for i in items.indices where items[i].type == items[index].type {
            items[i].isEquipped = false
        }
        
        items[index].isEquipped = true
        return "Equipped \(items[index].name)!"
    }
    
    func display() {
        print("\n=== INVENTORY (\(items.count)/\(capacity)) ===")
        items.forEach { item in
            let equipped = item.isEquipped ? "[EQUIPPED]" : ""
            print("- \(item.name) \(equipped)")
        }
    }
    
    var equippedItems: [Item] {
        return items.filter { $0.isEquipped }
    }
}

extension Item {
    static let allItems: [Item] = [
        Item(
            name: "Sword of the Crusader",
            type: .weapon,
            description: "Blessed sword effective against undead",
            effects: [
                .damageBoost(multiplier: 1.2),
                .affinityBoost(affinity: .light, power: 15)
            ]
        ),
        Item(
            name: "Bow of the Hunter",
            type: .weapon,
            description: "Precision longbow",
            effects: [.damageBoost(multiplier: 1.25)]
        ),
        Item(
            name: "Natural Staff",
            type: .weapon,
            description: "Enhances healing at night",
            effects: [.affinityBoost(affinity: .water, power: 10)]
        ),
        Item(
            name: "Wand of Fire",
            type: .weapon,
            description: "Burns enemies for 3 damage/turn",
            effects: [.statusEffect(type: "burn", duration: 2)]
        ),
        Item(
            name: "Sacred Hammer",
            type: .weapon,
            description: "Heals 5% HP after each hit",
            effects: [.heal(amount: 0)]
        ),
        Item(
            name: "Plate Armor",
            type: .armor,
            description: "Heavy metal armor",
            effects: [.defenseBoost(amount: 15)]
        ),
        Item(
            name: "Druid Tunic",
            type: .armor,
            description: "Regenerates 2 MP per turn",
            effects: [.restoreMana(amount: 2)]
        ),
        Item(
            name: "Shadow Cloak",
            type: .armor,
            description: "10% dodge chance",
            effects: [.defenseBoost(amount: 5)]
        ),
        Item(
            name: "Flaming Robe",
            type: .armor,
            description: "Reduces ice damage by 30%",
            effects: [.affinityBoost(affinity: .fire, power: 30)]
        ),
        Item(
            name: "Healing Potion",
            type: .consumable,
            description: "Restores 50 HP",
            effects: [.heal(amount: 50)]
        ),
        Item(
            name: "Mana Potion",
            type: .consumable,
            description: "Restores 20 MP",
            effects: [.restoreMana(amount: 20)]
        ),
        Item(
            name: "Dragon Soul Fragment",
            type: .special,
            description: "Mystical dragon essence",
            effects: []
        ),
        Item(
            name: "Secret Scroll",
            type: .special,
            description: "Can break certain curses",
            effects: []
        ),
        Item(
            name: "Elixir of Honor",
            type: .special,
            description: "Fulfills the hero's last wish",
            effects: []
        )
    ]
    
    static func create(from name: String) -> Item? {
        return allItems.first { $0.name.lowercased() == name.lowercased() }
    }
}

extension Character {
    struct CharacterInventory {
        var items: [Item] = []
        var equippedWeapon: Item?
        var equippedArmor: Item?
        let capacity: Int = 10
        
        mutating func add(item: Item) -> Bool {
            guard items.count < capacity else { return false }
            items.append(item)
            return true
        }
        
        mutating func equip(item: Item) -> String {
            switch item.type {
                case .weapon:
                    equippedWeapon = item
                    return "Equipped \(item.name) as weapon!"
                case .armor:
                    equippedArmor = item
                    return "Equipped \(item.name) as armor!"
                default:
                    return "This item cannot be equipped"
            }
        }
    }
}