var finished = false
func printCommand(){
    print()
    print("Voici la liste des commandes :")
    print("- Afficher la map : map")
    print("- Afficher votre inventaire : inventory")
    print("- Afficher le status : status")
    print("- Information sur le stage : stage")
    print("- Quitter le jeu : exit")

    let commandChoose = readLine()
    switch commandChoose {
    case "map":
        stageMTN.displayMap()
        menu()
    case "inventory":
        // fonction afficher inventaire
        print("Vous posséder dans votre inventaire :")
        menu()
    case "status":
        // Affiche santé, mana + stats
        print("Voici votre état : 150hp, 23mp ")
        menu()    
    case "stage":
        print("Info sur le stage Actuel: nom:\(stageMTN.name), id:\(stageMTN.id), description:\(stageMTN.description), relié aux id: \(stageMTN.connexion) ")
        menu()
    case "exit":
        print("Vous quittez le jeu")
        finished = true
        exit(0)
    default:
        print("La commande renseignée n'existe pas, retour au menu..")
        menu()
    }

}

func askMove(){
    print()
    print("Ou voulez-vous vous déplacer : \n-up \n-left \n-right \n-down")
    let moveChoice = readLine()
    switch moveChoice?.lowercased() {
        case "up":
            stageMTN.move(direction: "up")
            if boolNextStage{
                askStage()
            }
            menu()
        case "down":
            stageMTN.move(direction: "down")
            if boolNextStage{
                askStage()
            }
            menu()
        case "left":
            stageMTN.move(direction: "left")
            if boolNextStage{
                askStage()
            }
            menu()
        case "right":
            stageMTN.move(direction: "right")
            if boolNextStage{
                askStage()
            }
            menu()
        default:
            print("Direction inconnue, veuillez réessayer")
            menu()
        }

}

func askStage(){
    print()
    print("Vous êtes actuellement au stage: id: \(stageMTN.id), name: \(stageMTN.name)")
    print()
    print("Choisissez à quel stage vous voulez accéder, en indiquant son id")
    for stageEx in listeStage {
        for idS in stageMTN.connexion{
            if idS == stageEx.id {
                print("Vous pouvez accéder aux stages: id: \(idS), name: \(stageEx.name)")
            }
        }
    }
    print("Si vous ne voulez pas changer de stage entrez: -1")
    print("Enter an id :")
    if let input = readLine(), let idChoice = Int(input) {
        for stageEx2 in listeStage{
            if stageEx2.id == idChoice {
                stageMTN = stageEx2
                print("Vous venez d'accéder au stage: \(stageMTN.name)")
                menu()
            }
        }
    } else {
        print("❌ Invalid id.")
        menu()
    }
}