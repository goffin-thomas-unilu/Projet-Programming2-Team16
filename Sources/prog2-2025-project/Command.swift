import Glibc
var finished = false
func printCommand(){
    // Show others commands
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
            // Show the map
            stageMTN.displayMap()
            menu()
        case "inventory":
            // Show inventory
            // function to print inventory
            print("You have in your inventory :")
            menu()
        case "status":
            // Show health point, mana point + stats
            print("This is your status : 150hp, 23mp ")
            menu()    
        case "stage":
            // Show informations on the current stage
            print()
            print("Info on the Current course: \n nom: \(stageMTN.name), \n id: \(stageMTN.id), \n description: \(stageMTN.description), \n linked to id: \(stageMTN.connexion) ")
            menu()
        case "assess":
            // Show informations about enemy
            print()
            // function to print informations about a specific enemy, printEnemyInfo("Gobelin")
        case "interact":
            // interact with mecanism
            print("No mechanism to interact with")
            // fonction pour intéragir avec les énigmes 
        case "exit":
            // leave the game
            print("Leaving the game")
            game.finished = true
            //exit(0)
        default:
            // if Typing error
            print("Order does not exist, return to menu...")
            menu()
    }

}
// ask the user where he want to go 

func askMove(){
    print()
    //boolNextStage = false
    print("Where do you want to go : \n-up \n-left \n-right \n-down")
    let moveChoice = readLine()
    // Check for each case if the player is on a tile to change stage
    switch moveChoice?.lowercased() {
        case "up":
            stageMTN.move(direction: "up")
            if boolNextStage{
                askStage()
            } else if automodebool {
                autoMode()
            }
            menu()
        case "down":
            stageMTN.move(direction: "down")
            if boolNextStage{
                askStage()
            }else if automodebool {
                autoMode()
            }
            menu()
        case "left":
            stageMTN.move(direction: "left")
            if boolNextStage{
                askStage()
            }else if automodebool {
                autoMode()
            }
            menu()
        case "right":
            stageMTN.move(direction: "right")
            if boolNextStage{
                askStage()
            }else if automodebool {
                autoMode()
            }
            menu()
        default:
            print("Direction unknown, please try again")
            menu()
        }
        

}
// ask the user if he want to change from a stage to another and if yes which stages

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
// function for the first riddle

func enigme0(){
    print()
    print("Would you like to place something on the Hero's grave ?")
    /* 
    if inventory.contains("Elixir of Honor"){
        print("You pour the beverage over the grave of the deceased hero")
        print("The Hero challenges you to single combat to honor his last wish")
        func fight("Hero")
        print("\u{001B}[36mSucces: Becoming a hero\u{001B}[0m")
        print("\u{001B}[32mYou have finished the game by becoming a Hero\u{001B}[0m") // 1st ENDING CONDITION
        game.finished = true
        exit(0)
    
    }else{
        print("You don't have the required item")
    }
    */
}

// function for the second riddle

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
func enigme2(){
    print()
    print("Would you like to use your Secret Scroll ?")
    /* 
    if inventory.contains("Secret Scroll"){
        print("You read the secret scroll breaking the curse of the fallen king Valdrakar")
        print("Valdrakar looks at you and says: ")
        print("\u{001B}[3mYou didn't brandish a weapon... but a hope.\nThe curse is lifted... thanks to you.\nI'm free... and this kingdom can finally heal\nRemember: the greatest power is the power to forgive.\u{001B}[0m")
        print("\u{001B}[36mSucces Chain Breaker: For freeing a tormented soul without resorting to violence.\u{001B}[0m")
        print("\u{001B}[32m🎉 Alternative ending unlocked! \nYou broke the curse without violence.\nPeace has prevailed over blood.\n🕊️ REDEMPTION.\u{001B}[0m") // 2nd ENDING CONDITION
        game.finished = true
        exit(0)
    
    }else{
        print("You don't have the Secret Scroll in your inventory")
    }
    */

}
func encounterPnj0(){
    print()
    print("A hooded old man approaches. His eyes shine with a strange glint. Before you can react, he whispers: \n<Let me lead your steps for a moment...>")
    //func auto mode
}
func autoMode(){
    
    print("\u{001B}[36mSuccess: Becoming a puppet\u{001B}[0m")
    //let listeMoves = ["down","up","left","right"]
    switch stageMTN.id {
        case 0:
            print()
            stageMTN.move(direction: "down")
            stageMTN.move(direction: "down")
            changeStage(from: stageMTN, to: CatacombStage)
        case 2:
            print()
            stageMTN.move(direction: "down")
            stageMTN.move(direction: "left")
            stageMTN.move(direction: "left")
            stageMTN.move(direction: "down")
            stageMTN.move(direction: "left")
            stageMTN.move(direction: "down")
            stageMTN.move(direction: "down")
            stageMTN.move(direction: "left")
            
            changeStage(from: stageMTN, to: AbyssSoulsStage)
        case 4:
            stageMTN.move(direction: "down")
            stageMTN.move(direction: "down")
            stageMTN.move(direction: "left")
            stageMTN.move(direction: "down")
            stageMTN.move(direction: "left")
            stageMTN.move(direction: "left")
            changeStage(from: stageMTN, to: GiantDenStage)
        case 6:
            print("oui")
            //stageMTN.move(direction: "down")
            //stageMTN.move(direction: "down")
            //changeStage(from: stageMTN, to: LibraryStage)
            /*
            if inventory.contains("Secret Scroll"){
                stageMTN.move(direction: "down")
                stageMTN.move(direction: "down")
                stageMTN.move(direction: "left")
                stageMTN.move(direction: "left")
                changeStage(from: stageMTN, to: KingHallStage)
            }else {
                stageMTN.move(direction: "down")
                stageMTN.move(direction: "down")
                stageMTN.move(direction: "left")
                stageMTN.move(direction: "left")
                changeStage(from: stageMTN, to: LibraryStage)
            }
            */
        case 9:
            stageMTN.move(direction: "left")
            stageMTN.move(direction: "down")
            stageMTN.move(direction: "down")
            stageMTN.move(direction: "right")
            stageMTN.move(direction: "left")
            stageMTN.move(direction: "left")
            changeStage(from: stageMTN, to: GiantDenStage)
        default:
            print("ERR")
        }
}
func encounterPnj1(){
    print()
    print("Answer the spectrum 🩻 question if you have the courage")
    print("The spectre murmurs in a cavernous voice 👻")
    print("\u{001B}[3mWhat is the greatest burden a mortal can bear?\u{001B}[0m")
    print("1: The weight of his faults \n2: Ignorance of the truth \n3: The loss of a loved one")
    print("Your Answer: ")
    if let input = readLine(), let number = Int(input) {
        print("You have entered the number : \(number)")
        switch number {
        case 1:
            print("\u{001B}[32m+5ATK\u{001B}[0m")
            print("\u{001B}[31m-5DEF\u{001B}[0m")
            // Update the player stats
        case 2:
            print("\u{001B}[32m+5HP\u{001B}[0m")
            print("\u{001B}[31m-5MP\u{001B}[0m")
            // Update the player stats
        case 3:
            print("\u{001B}[32m+5SPD\u{001B}[0m")
            print("\u{001B}[31m-5DEF\u{001B}[0m")
            // Update the player stats
        default:
            print("Err")
        }
    } else {
        print("❌ Ce n'est pas un nombre valide.")
    }
}

func encounterPnj2(){
    print("In front of a hero's grave ")
    afficherAsciiArt()

}
func afficherAsciiArt() {
    print("""
                      
                     (    )
                     __)(__
               _____/      \\\\_____
              |                   ||
              |  _      ___   _   ||
              | | \\     |   | \\ ||
              | |  |     |   |  | ||
              | |_/      |   |_/  ||
              | | \\     |   |    ||
              | |  \\    |   |    ||
              | |   \\. _|_. | .  ||
              |                   ||
      *       | *   **    * **    ||**      **
       
    """)
}
