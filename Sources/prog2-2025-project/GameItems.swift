import Foundation

// Weapons
let swordOfCrusader = Item(
    name: "Sword of the Crusader",
    type: .weapon,
    description: "Blessed sword effective against undead",
    effects: [
        .damageBoost(multiplier: 1.2),
        .affinityBoost(affinity: .light, power: 15)
    ]
)

let bowOfHunter = Item(
    name: "Bow of the Hunter",
    type: .weapon,
    description: "Precision longbow",
    effects: [.damageBoost(multiplier: 1.25)]
)

let naturalStaff = Item(
    name: "Natural Staff",
    type: .weapon,
    description: "Enhances healing at night",
    effects: [.affinityBoost(affinity: .water, power: 10)]
)

let wandOfFire = Item(
    name: "Wand of Fire",
    type: .weapon,
    description: "Burns enemies for 3 damage/turn",
    effects: [.statusEffect(type: "burn", duration: 2)]
)

let sacredHammer = Item(
    name: "Sacred Hammer",
    type: .weapon,
    description: "Heals 5% HP after each hit",
    effects: [.heal(amount: 0)]
)

// Armor
let plateArmor = Item(
    name: "Plate Armor",
    type: .armor,
    description: "Heavy metal armor",
    effects: [.defenseBoost(amount: 15)]
)

let druidTunic = Item(
    name: "Druid Tunic",
    type: .armor,
    description: "Regenerates 2 MP per turn",
    effects: [.restoreMana(amount: 2)]
)

let shadowCloak = Item(
    name: "Shadow Cloak",
    type: .armor,
    description: "10% dodge chance",
    effects: [.defenseBoost(amount: 5)]
)

let flamingRobe = Item(
    name: "Flaming Robe",
    type: .armor,
    description: "Reduces ice damage by 30%",
    effects: [.affinityBoost(affinity: .fire, power: 30)]
)

// Consumables
let healingPotion = Item(
    name: "Healing Potion",
    type: .consumable,
    description: "Restores 50 HP",
    effects: [.heal(amount: 50)]
)

let manaPotion = Item(
    name: "Mana Potion",
    type: .consumable,
    description: "Restores 20 MP",
    effects: [.restoreMana(amount: 20)]
)

// Special Items
let dragonSoulFragment = Item(
    name: "Dragon Soul Fragment",
    type: .special,
    description: "Mystical dragon essence",
    effects: []
)

let secretScroll = Item(
    name: "Secret Scroll",
    type: .special,
    description: "Can break certain curses",
    effects: []
)

let elixirOfHonor = Item(
    name: "Elixir of Honor",
    type: .special,
    description: "Fulfills the hero's last wish",
    effects: []
)