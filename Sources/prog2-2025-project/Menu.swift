func menu (){
    print()
    print("Que voulez faire ? ")
    print("- Afficher la map : map")
    print("- Se déplacer : move")
    print("- Exécuter une commande : command")
    if let reponse = readLine() {
        switch reponse {
        case "map":
            stageMTN.displayMap()
            menu()
        case "move":
            askMove()
            menu()
        case "command":
            printCommand()
        default:
            print("Erreur, veuillez réessayer")
            menu()
        }
    }
}