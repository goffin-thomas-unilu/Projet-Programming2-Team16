func menu (){
    print()
    print("What do you want to do? ")
    print("- Show map : map")
    print("- Moving around : move")
    print("- Execute a command : command")
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
            print("Error, please try again")
            menu()
        }
    }
}