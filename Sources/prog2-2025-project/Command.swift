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
        menu()
    case "down":
        stageMTN.move(direction: "down")
        menu()
    case "left":
        stageMTN.move(direction: "left")
        menu()
    case "right":
        stageMTN.move(direction: "right")
        menu()
    default:
        print("Direction inconnue, veuillez réessayer")
        menu()
    }

}