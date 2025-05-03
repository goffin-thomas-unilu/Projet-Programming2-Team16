import Glibc
var finished = false
func printCommand(){
    print()
    print("Here is the list of orders :")
    print("- Show map : map")
    print("- View your inventory : inventory")
    print("- Show status : status")
    print("- Information about the course : stage")
    print("- Enemy information : assess")
    print("- Interacting with a mechanism : interact")
    print("- Quit the game : exit")

    let commandChoose = readLine()
    switch commandChoose {
    case "map":
        stageMTN.displayMap()
        menu()
    case "inventory":
        // fonction afficher inventaire
        print("You have in your inventory :")
        menu()
    case "status":
        // Affiche santé, mana + stats
        print("This is your status : 150hp, 23mp ")
        menu()    
    case "stage":
        print()
        print("Info on the Current course: \n nom: \(stageMTN.name), \n id: \(stageMTN.id), \n description: \(stageMTN.description), \n linked to id: \(stageMTN.connexion) ")
        menu()
    case "assess":
        print()
        // function to print informations about a specific enemy, printEnemyInfo("Gobelin")
    case "interact":
        print()
        // fonction pour intéragir avec les énigmes 
    case "exit":
        print("Leaving the game")
        finished = true
        exit(0)
    default:
        print("Order does not exist, return to menu...")
        menu()
    }

}

func askMove(){
    print()
    //boolNextStage = false
    print("Where do you want to go : \n-up \n-left \n-right \n-down")
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
            print("Direction unknown, please try again")
            menu()
        }
        

}

func askStage(){
    print()
    boolNextStage = false
    print("You are currently at the: id: \(stageMTN.id), name: \(stageMTN.name)")
    print()
    print("Select the course you wish to access, indicating its id")
    for stageEx in listeStage {
        for idS in stageMTN.connexion{
            if idS == stageEx.id {
                print("You can access the courses: id: \(idS), name: \(stageEx.name)")
            }
        }
    }
    print("If you don't want to change course, enter: -1")
    print("Enter an id :")
    if let input = readLine(), let idChoice = Int(input) {
        for stageEx2 in listeStage{
            if stageEx2.id == idChoice {
                stageMTN = stageEx2
                print("You have just accessed the: \(stageMTN.name)")
                menu()
            }
        }
    } else {
        print("❌ Invalid id.")
        menu()
    }
    
}

func enigme0(){
    print()
    print("Would you like to place something on the Hero's grave ?")
    /* 
    if inventory.contains("Elixir of Honor"){
        print("You pour the beverage over the grave of the deceased hero")
        print("The Hero challenges you to single combat to honor his last wish")
        func fight("Hero")
        print("\u{001B}[36mSucces: Becoming a hero\u{001B}[0m")
    
    }else{
        print("You don't have the required item")
    }
    */
}
func enigme1() {
    print()
    print("You see a strange row of books...")
    print("In an ancient dungeon room, four books rest on a dusty table. A wall fresco contains an inscription :")
    print()
    print("\u{001B}[3mFrom chaos comes wisdom \nWar leads to silence \nAnd only fire reveals the truth.\u{001B}[0m")
    print()
    print("The four books are entitled: \nSacred Fire 📕 , Age of Chaos 📙 , Chronicles of War 📗 , Wisdom of the Ancients 📘")
    print("Please indicate your answer by writing the first letter of the book color: (rogb,rovb...)")
    let reponseEnigme1 = readLine()
    if reponseEnigme1 == "obgr" {
        print("\u{001B}[32mYou've solved the riddle\u{001B}[0m")
        print("\u{001B}[36mSuccess: Sherlock Holmes in a Dungeon ?\u{001B}[0m")
        // add an item to the inventory: +25 hp,+10 mana,+15 DEF
    }else{
        print("The mechanism doesn't move, try again.")
        enigme1()
    }

}
    