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


// Crée manuellement une map 3x3
let DungeonEntryMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .nextStage(1)), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .nextStage(2))]
]
let CatacombMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .item("Potion")), Tile1(type: .enemy("Goblin")), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .nextStage(2)), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)]
]
let HauntedForestMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .item("Potion")), Tile1(type: .enemy("Goblin")), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .nextStage(2)), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)]
]
let BridgeSoulsMap: [[Tile1]] = [
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .item("Potion")), Tile1(type: .enemy("Goblin")), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)],
    [Tile1(type: .nextStage(2)), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty), Tile1(type: .empty)]
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

var stageMTN: Stage1 = DungeonEntryStage

var listeStage : [Stage1] = [DungeonEntryStage,ForestStage,CatacombStage,BridgeSoulsStage]

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