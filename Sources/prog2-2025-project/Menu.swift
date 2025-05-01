func menu (){
    print("Que voulez faire ? ")
    print("- Afficher la map : map")
    print("- Se déplacer : move")
    print("- Engager le combat : attack")
    print("- Exécuter une commande : command")
    if let reponse = readLine() {
        switch reponse {
        case "map":
            stageMTN.displayMap()
            menu()
        case "move":
            stageMTN.move(direction: "up")
        case "attack":
            print("Vous engagez le combat")
        case "command":
            printCommand()
        default:
            print("Erreur, veuillez réessayer")
            menu()
        }
    }
}