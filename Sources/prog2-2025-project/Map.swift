// Map creation

let DungeonEntryMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .pnj("The mad Puppeteer"))],
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .nextStage([1,2])), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .nextStage([1,2]))]
]
let CatacombMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .pnj("The mad Puppeteer"))],
    [Tile1(type: .item(healingPotion)), Tile1(type: .enemy(goblin)), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .item(swordOfCrusader))],
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .enemy(skeleton))],
    [Tile1(type: .enemy(skeleton)), Tile1(type: .empty), Tile1(type: .enemy(goblin)), Tile1(type: .empty), Tile1(type: .enemy(skeleton))],
    [Tile1(type: .nextStage([0,1,4])), Tile1(type: .empty), Tile1(type: .enemy(skeleton)), Tile1(type: .empty), Tile1(type: .item(naturalStaff))]
]
let HauntedForestMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .enemy(undead))],
    [Tile1(type: .item(healingPotion)), Tile1(type: .enemy(werewolf)), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .item(bowOfHunter))],
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .enemy(undead)), Tile1(type: .empty)],
    [Tile1(type: .enemy(undead)), Tile1(type: .empty), Tile1(type: .enemy(werewolf)), Tile1(type: .empty), Tile1(type: .item(wandOfFire))],
    [Tile1(type: .nextStage([0,2,3])), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .enemy(undead))]
]
let BridgeSoulsMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .item(manaPotion))],
    [Tile1(type: .nextStage([1,4,5])), Tile1(type: .empty), Tile1(type: .pnj("Guardian of the Sanctuary")), Tile1(type: .empty), Tile1(type: .empty)]
]
let AbyssSoulMap: [[Tile1]] = [
    [Tile1(type: .enemy(iceSpecter)), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .pnj("The mad Puppeteer"))],
    [Tile1(type: .enemy(iceSpecter)), Tile1(type: .enemy(iceSpecter)), Tile1(type: .enemy(iceSpecter)), Tile1(type: .empty)],
    [Tile1(type: .item(sacredHammer)), Tile1(type: .enemy(iceSpecter)), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .nextStage([2,3,5,6])), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .enemy(iceSpecter))]
]
let ForbiddenSanctuaryMap: [[Tile1]] = [
    [Tile1(type: .item(flamingRobe)), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .nextStage([3,7,9])), Tile1(type: .empty), Tile1(type: .item(shadowCloak))]
]
let GiantDenMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .pnj("The mad Puppeteer"))],
    [Tile1(type: .item(druidTunic)), Tile1(type: .enemy(caveGiant)), Tile1(type: .empty)],
    [Tile1(type: .nextStage([3,7,9])), Tile1(type: .empty), Tile1(type: .empty)]
]
let HeroTombMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .riddle(0)), Tile1(type: .pnj("Heros Tomb")), Tile1(type: .empty)],
    [Tile1(type: .nextStage([5])), Tile1(type: .empty), Tile1(type: .item(plateArmor))]
]
let KingHallMap: [[Tile1]] = [
    [Tile1(type: .item(healingPotion)), Tile1(type: .empty), Tile1(type: .item(manaPotion))],
    [Tile1(type: .empty), Tile1(type: .enemy(valdrakar)), Tile1(type: .empty)],
    [Tile1(type: .nextStage([5,6])), Tile1(type: .riddle(2)), Tile1(type: .pnj("The mad Puppeteer"))]
]
let LibraryMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .pnj("The mad Puppeteer"))],
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .riddle(1))],
    [Tile1(type: .nextStage([6,10])), Tile1(type: .empty), Tile1(type: .item(secretScroll))]
]
let LaboratoryMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .empty), Tile1(type: .enemy(madAlchemist)), Tile1(type: .empty)],
    [Tile1(type: .nextStage([9])), Tile1(type: .empty), Tile1(type: .item(elixirOfHonor))]
]
// Initialise le stage avec sa map

    var DungeonEntryStage = Stage1(
        id: 0,
        name: "Entrance to the Keep",
        description: "A spine-chilling cavern",
        map: DungeonEntryMap,
        connexion: [1,2],
        effect: "None"
    )
    var ForestStage = Stage1(
        id: 1,
        name: "Haunted Forest",
        description: "A forest of monsters and spirits",
        map: HauntedForestMap,
        connexion: [0,2,3],
        effect: "Fog"
    )
    var CatacombStage = Stage1(
        id: 2,
        name: "Abandoned catacombs",
        description: "A place full of skeletons and other ghostly creatures",
        map: CatacombMap,
        connexion: [0,1,4],
        effect: "Darkness"
    )
    var BridgeSoulsStage = Stage1(
        id: 3,
        name: "Bridge of Souls",
        description: "A mysterious spectre seems to be waiting for you",
        map: BridgeSoulsMap,
        connexion: [1,4,5],
        effect: "None"
    )
    var AbyssSoulsStage = Stage1(
        id: 4,
        name: "Abyss of Lost Souls",
        description: "Stairs leading down into a seemingly bottomless abyss",
        map: AbyssSoulMap,
        connexion: [2,3,5,6],
        effect: "Frozen Tundra"
    )
    var ForbiddenSanctuaryStage = Stage1(
        id: 5,
        name: "Forbidden Sanctuary",
        description: "A room resembling a place of worship for a hero of the past",
        map: ForbiddenSanctuaryMap,
        connexion: [3,7,8],
        effect: "None"
    )
    var GiantDenStage = Stage1(
        id: 6,
        name: "Giant's Den",
        description: "A dark cavern with a giant inside",
        map: GiantDenMap,
        connexion: [4,8,9,],
        effect: "Earth"
    )
    var HerosTombStage = Stage1(
        id: 7,
        name: "Tomb of the Hero",
        description: "A magnificent tomb stands right in the middle of the area",
        map: HeroTombMap,
        connexion: [5],
        effect: "None"
    )
    var KingHallStage = Stage1(
        id: 8,
        name: "King's Hall",
        description: "A strange man sits on a ruined throne ",
        map: KingHallMap,
        connexion: [5,6],
        effect: "Fire"

    )
    var LibraryStage = Stage1(
        id: 9,
        name: "Cursed Library",
        description: "A mysterious library hiding many secrets",
        map: LibraryMap,
        connexion: [6,10],
        effect: "Light"
    )
    var LaboratoryStage = Stage1(
        id: 10,
        name: "Alchemical Laboratory",
        description: "A laboratory with a funereal odour, a strange figure stands in the middle of it. ",
        map: LaboratoryMap,
        connexion: [9],
        effect: "Water"
    )
// Start at the Entry of the dungeon / Actual Stage
var stageMTN: Stage1 = DungeonEntryStage
// a list of all stages
var listeStage : [Stage1] = [DungeonEntryStage,ForestStage,CatacombStage,BridgeSoulsStage,AbyssSoulsStage,ForbiddenSanctuaryStage,GiantDenStage,HerosTombStage,KingHallStage,LibraryStage,LaboratoryStage]
// Check if two stages are connected --> return a boolean
func connecTo(stageActuel : Stage1,stageSuivant : Stage1) -> Bool{
    return stageActuel.connexion.contains(stageSuivant.id)
}
// function to change from a stage to a another
func changeStage(from currentStage: Stage1, to newStage: Stage1){
        if connecTo(stageActuel: currentStage, stageSuivant: newStage) {
            print("Transition to the zone \(newStage.name)...")
            stageMTN = newStage
        } else {
            print("This course is not connected.")
        }
    }