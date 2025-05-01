
// Affiche la map initiale
stageMTN.displayMap()

// Exemples de déplacements
stageMTN.move(direction: "left")
stageMTN.move(direction: "up")
// appel du menu
menu()

var rep = connecTo(stageActuel: stageMTN, stageSuivant: ForestStage)
print(rep)

changeStage(from: stageMTN, to: ForestStage)
stageMTN.displayMap()

changeStage(from: stageMTN, to: DungeonEntryStage)
stageMTN.displayMap()