/*
var listeStage: [Stage] = [stage1,stage2,stage3]

func changeStage(to stageId: Int, from currentStage: inout Stage) -> Stage? {
        if currentStage.connectTo.contains(stageId) {
            print("Transition vers la zone \(stageId)...")
            if let newStage = allStages.first(where: { $0.id == stageId }) {
                return newStage
            } else {
                print("Erreur : Stage non trouvé.")
            }
        } else {
            print("Ce stage n'est pas connecté.")
        }
        return nil
    }
var allStages = [stage1, stage2]
var currentStageIndex = 0
var currentStage = allStages[currentStageIndex]
if let newStage = changeStage(to: 2, from: &currentStage) {
    currentStage = newStage
    currentStage.displayMap()
}

print(player1.nom)
stage1.displayMap()
stage1.move(direction: "doWN")
stage1.move(direction: "Right")
stage1.move(direction: "down")
stage1.move(direction: "up")
stage1.move(direction: "down")
stage1.move(direction: "left")
stage2.nouvelleZone()
*/
//let map1 = [[]]
//var stage8 = Stage1(id: 1, name: "Dark Forest", description: "A shadowy forest full of secrets", map:)
//stage8.displayMap()
//var stage9 = Stage1(id: 1, name: "Dark Forest", description: "A shadowy forest full of secrets", map:)
//stage9.map[1][2] = Tile1(type: .obstacle) // Place un obstacle
//stage9.displayMap()

//stage9.move(direction: "up")     // tente de monter
//stage9.move(direction: "right")  // tente d'aller à droite

//print(listeStage[2].connectTo)


// Map creation

let DungeonEntryMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .item("Diary of an adventurer"))],
    [Tile1(type: .nextStage([1,2])), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .nextStage([1,2]))]
]
let CatacombMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .item("Health Potion")), Tile1(type: .enemy("Goblin")), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .item("Sword of the Crusader"))],
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .enemy("Skeleton"))],
    [Tile1(type: .enemy("Skeleton")), Tile1(type: .empty), Tile1(type: .enemy("Goblin")), Tile1(type: .empty), Tile1(type: .enemy("Skeleton"))],
    [Tile1(type: .nextStage([0,1,4])), Tile1(type: .empty), Tile1(type: .enemy("Skeleton")), Tile1(type: .empty), Tile1(type: .item("Natural Staff"))]
]
let HauntedForestMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .enemy("Undead"))],
    [Tile1(type: .item("Health Potion")), Tile1(type: .enemy("Werewolf")), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .item("Bow of the Hunter"))],
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .enemy("Undead")), Tile1(type: .empty)],
    [Tile1(type: .enemy("Undead")), Tile1(type: .empty), Tile1(type: .enemy("Werewolf")), Tile1(type: .empty), Tile1(type: .item("Wand of Fire"))],
    [Tile1(type: .nextStage([0,2,3])), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .enemy("Undead"))]
]
let BridgeSoulsMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .item("Letter")), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .item("Mana Potion"))],
    [Tile1(type: .nextStage([1,4,5])), Tile1(type: .empty), Tile1(type: .pnj("Guardian of the Sanctuary")), Tile1(type: .empty), Tile1(type: .empty)]
]
let AbyssSoulMap: [[Tile1]] = [
    [Tile1(type: .enemy("Ice Spectre")), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .enemy("Ice Spectre")), Tile1(type: .enemy("Ice Spectre")), Tile1(type: .enemy("Ice Spectre")), Tile1(type: .empty)],
    [Tile1(type: .item("Sacred Hammer")), Tile1(type: .enemy("Ice Spectre")), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .nextStage([2,3,5,6])), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .enemy("Ice Spectre"))]
]
let ForbiddenSanctuaryMap: [[Tile1]] = [
    [Tile1(type: .item("Flaming robe")), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .nextStage([3,7,9])), Tile1(type: .empty), Tile1(type: .item("Shadow cloak"))]
]
let GiantDenMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .item("Druid tunic")), Tile1(type: .enemy("Giant")), Tile1(type: .empty)],
    [Tile1(type: .nextStage([3,7,9])), Tile1(type: .empty), Tile1(type: .empty)]
]
let HeroTombMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .riddle(0)), Tile1(type: .pnj("Heros Tomb")), Tile1(type: .empty)],
    [Tile1(type: .nextStage([5])), Tile1(type: .empty), Tile1(type: .item("Plate armor"))]
]
let KingHallMap: [[Tile1]] = [
    [Tile1(type: .item("Health Potion")), Tile1(type: .empty), Tile1(type: .item("Mana Potion"))],
    [Tile1(type: .empty), Tile1(type: .enemy("Valdrakar")), Tile1(type: .empty)],
    [Tile1(type: .nextStage([5,6])), Tile1(type: .empty), Tile1(type: .empty)]
]
let LibraryMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .riddle(1))],
    [Tile1(type: .nextStage([6,10])), Tile1(type: .empty), Tile1(type: .item("Secret Scroll"))]
]
let LaboratoryMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .empty), Tile1(type: .enemy("Mad Alchemist")), Tile1(type: .empty)],
    [Tile1(type: .nextStage([9])), Tile1(type: .empty), Tile1(type: .item("Elixir of Honor"))]
]
// Initialise le stage avec cette map

    var DungeonEntryStage = Stage1(
        id: 0,
        name: "Entrance to the Keep",
        description: "A spine-chilling cavern",
        map: DungeonEntryMap,
        connexion: [1,2]
    )
    var ForestStage = Stage1(
        id: 1,
        name: "Haunted Forest",
        description: "A forest of monsters and spirits",
        map: HauntedForestMap,
        connexion: [0,2,3]
    )
    var CatacombStage = Stage1(
        id: 2,
        name: "Abandoned catacombs",
        description: "A place full of skeletons and other ghostly creatures",
        map: CatacombMap,
        connexion: [0,1,4]
    )
    var BridgeSoulsStage = Stage1(
        id: 3,
        name: "Bridge of Souls",
        description: "A mysterious spectre seems to be waiting for you",
        map: BridgeSoulsMap,
        connexion: [1,4,5]
    )
    var AbyssSoulsStage = Stage1(
        id: 4,
        name: "Abyss of Lost Souls",
        description: "Stairs leading down into a seemingly bottomless abyss",
        map: AbyssSoulMap,
        connexion: [2,3,5,6]
    )
    var ForbiddenSanctuaryStage = Stage1(
        id: 5,
        name: "Forbidden Sanctuary",
        description: "A room resembling a place of worship for a hero of the past",
        map: ForbiddenSanctuaryMap,
        connexion: [3,7,8]
    )
    var GiantDenStage = Stage1(
        id: 6,
        name: "Giant's Den",
        description: "A dark cavern with a giant inside",
        map: GiantDenMap,
        connexion: [4,8,9,]
    )
    var HerosTombStage = Stage1(
        id: 7,
        name: "Tomb of the Hero",
        description: "A magnificent tomb stands right in the middle of the area",
        map: HeroTombMap,
        connexion: [5]
    )
    var KingHallStage = Stage1(
        id: 8,
        name: "King's Hall",
        description: "A strange man sits on a ruined throne ",
        map: KingHallMap,
        connexion: [5,6]
    )
    var LibraryStage = Stage1(
        id: 9,
        name: "Cursed Library",
        description: "A mysterious library hiding many secrets",
        map: LibraryMap,
        connexion: [6,10]
    )
    var LaboratoryStage = Stage1(
        id: 10,
        name: "Alchemical Laboratory",
        description: "A laboratory with a funereal odour, a strange figure stands in the middle of it. ",
        map: LaboratoryMap,
        connexion: [9]
    )
var stageMTN: Stage1 = DungeonEntryStage

var listeStage : [Stage1] = [DungeonEntryStage,ForestStage,CatacombStage,BridgeSoulsStage,AbyssSoulsStage,ForbiddenSanctuaryStage,GiantDenStage,HerosTombStage,KingHallStage,LibraryStage,LaboratoryStage]

func connecTo(stageActuel : Stage1,stageSuivant : Stage1) -> Bool{
    return stageActuel.connexion.contains(stageSuivant.id)
}
func changeStage(from currentStage: Stage1, to newStage: Stage1){
        if connecTo(stageActuel: currentStage, stageSuivant: newStage) {
            print("Transition to the zone \(newStage.name)...")
            stageMTN = newStage
        } else {
            print("This course is not connected.")
        }
    }