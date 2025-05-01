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
    
    default:
        print("La commande renseignée n'existe pas, retour au menu..")
        menu()
    }

}