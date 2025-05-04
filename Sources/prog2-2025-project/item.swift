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
    let id: String
    let name: String
    let type: ItemType
    let description: String
    let value: Int
    let effects: [ItemEffect]
    var isEquipped: Bool = false
    
    init(id: String, name: String, type: ItemType, description: String, value: Int, effects: [ItemEffect]) {
        self.id = id
        self.name = name
        self.type = type
        self.description = description
        self.value = value
        self.effects = effects
    }
    
    func display() {
        print("\n\(name) [\(type)]")
        print("Value: \(value)")
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
    var items: [Item] = []
    var capacity: Int
    
    init(capacity: Int = 20) {
        self.capacity = capacity
        self.items = []
    }
    
    func add(item: Item) -> Bool {
        guard items.count < capacity else {
            print("Inventory full!")
            return false
        }
        items.append(item)
        return true
    }
    
    func remove(itemId: String) -> Item? {
        guard let index = items.firstIndex(where: { $0.id == itemId }) else {
            return nil
        }
        return items.remove(at: index)
    }
    
    func equip(itemId: String) -> String {
        guard let index = items.firstIndex(where: { $0.id == itemId }) else {
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
            id: "w1",
            name: "Sword of the Crusader",
            type: .weapon,
            description: "Blessed sword effective against undead",
            value: 150,
            effects: [
                .damageBoost(multiplier: 1.2),
                .affinityBoost(affinity: .light, power: 15)
            ]
        ),
        Item(
            id: "w2",
            name: "Bow of the Hunter",
            type: .weapon,
            description: "Precision longbow",
            value: 120,
            effects: [.damageBoost(multiplier: 1.25)]
        ),
        Item(
            id: "w3",
            name: "Natural Staff",
            type: .weapon,
            description: "Enhances healing at night",
            value: 130,
            effects: [.affinityBoost(affinity: .water, power: 10)]
        ),
        Item(
            id: "w4",
            name: "Wand of Fire",
            type: .weapon,
            description: "Burns enemies for 3 damage/turn",
            value: 140,
            effects: [.statusEffect(type: "burn", duration: 2)]
        ),
        Item(
            id: "w5",
            name: "Sacred Hammer",
            type: .weapon,
            description: "Heals 5% HP after each hit",
            value: 160,
            effects: [.heal(amount: 0)] // Calculated during combat
        ),
        Item(
            id: "a1",
            name: "Plate Armor",
            type: .armor,
            description: "Heavy metal armor",
            value: 200,
            effects: [.defenseBoost(amount: 15)]
        ),
        Item(
            id: "a2",
            name: "Druid Tunic",
            type: .armor,
            description: "Regenerates 2 MP per turn",
            value: 180,
            effects: [.restoreMana(amount: 2)]
        ),
        Item(
            id: "a3",
            name: "Shadow Cloak",
            type: .armor,
            description: "10% dodge chance",
            value: 170,
            effects: [.defenseBoost(amount: 5)]
        ),
        Item(
            id: "a4",
            name: "Flaming Robe",
            type: .armor,
            description: "Reduces ice damage by 30%",
            value: 190,
            effects: [.affinityBoost(affinity: .fire, power: 30)]
        ),
        Item(
            id: "c1",
            name: "Healing Potion",
            type: .consumable,
            description: "Restores 50 HP",
            value: 30,
            effects: [.heal(amount: 50)]
        ),
        Item(
            id: "c2",
            name: "Mana Potion",
            type: .consumable,
            description: "Restores 20 MP",
            value: 25,
            effects: [.restoreMana(amount: 20)]
        ),
        Item(
            id: "s1",
            name: "Dragon Soul Fragment",
            type: .special,
            description: "Mystical dragon essence",
            value: 500,
            effects: []
        ),
        Item(
            id: "s2",
            name: "Secret Scroll",
            type: .special,
            description: "Can break certain curses",
            value: 400,
            effects: []
        ),
        Item(
            id: "s3",
            name: "Elixir of Honor",
            type: .special,
            description: "Fulfills the hero's last wish",
            value: 600,
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