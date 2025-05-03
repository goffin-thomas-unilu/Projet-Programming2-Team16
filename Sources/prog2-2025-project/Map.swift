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
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .item("Journal d'un aventurier"))],
    [Tile1(type: .nextStage([1,2])), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .nextStage([1,2]))]
]
let CatacombMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .item("Health Potion")), Tile1(type: .enemy("Goblin")), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .item("Iron Sword"))],
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .enemy("Skeleton"))],
    [Tile1(type: .enemy("Skeleton")), Tile1(type: .empty), Tile1(type: .enemy("Goblin")), Tile1(type: .empty), Tile1(type: .enemy("Skeleton"))],
    [Tile1(type: .nextStage([0,1,4])), Tile1(type: .empty), Tile1(type: .enemy("Skeleton")), Tile1(type: .empty), Tile1(type: .empty)]
]
let HauntedForestMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .enemy("Undead"))],
    [Tile1(type: .item("Health Potion")), Tile1(type: .enemy("Werewolf")), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .item("Bow"))],
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .enemy("Undead")), Tile1(type: .empty)],
    [Tile1(type: .enemy("Undead")), Tile1(type: .empty), Tile1(type: .enemy("Werewolf")), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .nextStage([0,2,3])), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .enemy("Undead"))]
]
let BridgeSoulsMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .item("Letter")), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .item("Mana Potion"))],
    [Tile1(type: .nextStage([1,4,5])), Tile1(type: .empty), Tile1(type: .pnj("Gardien du Sanctuaire")), Tile1(type: .empty), Tile1(type: .empty)]
]
let AbyssSoulMap: [[Tile1]] = [
    [Tile1(type: .enemy("Ice Spectre")), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .enemy("Ice Spectre")), Tile1(type: .enemy("Ice Spectre")), Tile1(type: .enemy("Ice Spectre")), Tile1(type: .empty)],
    [Tile1(type: .empty), Tile1(type: .enemy("Ice Spectre")), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .nextStage([2,3,5])), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .enemy("Ice Spectre"))]
]
let ForbiddenSanctuaryMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .nextStage([3,7,9])), Tile1(type: .empty), Tile1(type: .empty)]
]
let GiantDenMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .empty), Tile1(type: .enemy("Giant")), Tile1(type: .empty)],
    [Tile1(type: .nextStage([3,7,9])), Tile1(type: .empty), Tile1(type: .empty)]
]
let HeroTombMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .riddle(0)), Tile1(type: .pnj("Heros Tomb")), Tile1(type: .empty)],
    [Tile1(type: .nextStage([5])), Tile1(type: .empty), Tile1(type: .empty)]
]
let KingHallMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .empty), Tile1(type: .enemy("Valdrakar")), Tile1(type: .empty)],
    [Tile1(type: .nextStage([5,6])), Tile1(type: .empty), Tile1(type: .empty)]
]
let LibraryMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .riddle(1))],
    [Tile1(type: .nextStage([6,10])), Tile1(type: .empty), Tile1(type: .item("Book: Curse of the King"))]
]
let LaboratoryMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .empty), Tile1(type: .enemy("Mad Alchemist")), Tile1(type: .empty)],
    [Tile1(type: .nextStage([9])), Tile1(type: .empty), Tile1(type: .item("Elixir du Heros"))]
]
// Initialise le stage avec cette map

    var DungeonEntryStage = Stage1(
        id: 0,
        name: "Entrée du Donjon",
        description: "Une caverne qui fait froid dans le dos",
        map: DungeonEntryMap,
        connexion: [1,2]
    )
    var ForestStage = Stage1(
        id: 1,
        name: "Forêt Hantée",
        description: "Une foret regroupant monstres et esprits",
        map: HauntedForestMap,
        connexion: [0,2,3]
    )
    var CatacombStage = Stage1(
        id: 2,
        name: "Catacombes abandonnés",
        description: "Un lieu rempli de squelettes et autres créatures fantomatiques",
        map: CatacombMap,
        connexion: [0,1,4]
    )
    var BridgeSoulsStage = Stage1(
        id: 3,
        name: "Pont des Ames",
        description: "Un mystérieux spectre semble vous attendre",
        map: BridgeSoulsMap,
        connexion: [1,4,5]
    )
    var AbyssSoulsStage = Stage1(
        id: 4,
        name: "Gouffre des Abysse",
        description: "Des escaliers qui descendent dans un gouffre qui semble sans fond",
        map: AbyssSoulMap,
        connexion: [2,3,5]
    )
    var ForbiddenSanctuaryStage = Stage1(
        id: 5,
        name: "Forbidden Sanctuary",
        description: "Une salle ressemblant à un lieu de culte pour un héros du passé",
        map: ForbiddenSanctuaryMap,
        connexion: [3,7,8]
    )
    var GiantDenStage = Stage1(
        id: 6,
        name: "Giant's Den",
        description: "Une caverne sombre où se trouve un géant à l'intérieur",
        map: GiantDenMap,
        connexion: [4,8,9]
    )
    var HerosTombStage = Stage1(
        id: 7,
        name: "Tomb of the Hero",
        description: "Une tombe magnifique se trouve en plein milieu de la zone",
        map: HeroTombMap,
        connexion: [5]
    )
    var KingHallStage = Stage1(
        id: 8,
        name: "King's Hall",
        description: "Un étrange se trouve sur un trône en ruine ",
        map: KingHallMap,
        connexion: [5,6]
    )
    var LibraryStage = Stage1(
        id: 9,
        name: "Cursed Library",
        description: "Une mystérieuse bibliothèque cachant nombre de secrets",
        map: LibraryMap,
        connexion: [6,10]
    )
    var LaboratoryStage = Stage1(
        id: 10,
        name: "Alchemical Laboratory",
        description: "Un laboratoire aux odeurs funèbres , une étrange silhouette se trouve en plein milieu ",
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
            print("Transition vers la zone \(newStage.name)...")
            stageMTN = newStage
        } else {
            print("Ce stage n'est pas connecté.")
        }
    }