func menu (){
    print("Que voulez faire ? ")
    print("- Afficher la map : map")
    print("- Se déplacer : move")
    print("- Engager le combat : attack")
    print("- Accéder à l'inventaire : inventory")
    print("- Exécuter une commande : command")
    if let reponse = readLine() {
        switch reponse {
        case "map":
            stageMTN.displayMap()
        case "move":
            stageMTN.move(direction: "up")
        case "attack":
            print("Vous engagez le combat")
        case "inventory":
            print("vous inspectez votre inventaire")
        case "quit":
            print("Vous venez de sauvegarder votre progression")
            menu()
        default:
            print("Erreur, veuillez réessayer")
            menu()
        }
    }
}