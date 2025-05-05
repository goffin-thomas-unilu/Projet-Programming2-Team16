import Glibc
var finished = false
var player = knight
func printCommand(){
    // Show others all commands
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
            player.inventory.display()
            menu()
        case "status":
            // Show health point, mana point + stats
            print()
            displayPlayerStatus()
            menu()    
        case "stage":
            // Show informations on the current stage
            print()
            print("Info on the Current course: \n nom: \(stageMTN.name), \n id: \(stageMTN.id), \n description: \(stageMTN.description), \n linked to id: \(stageMTN.connexion) ")
            menu()
        case "assess":
            askEnemy()
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
// ask the user where he want to go in the current stage (up,down,left,right)

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
     
    if  inInventory(itemGuess: elixirOfHonor){
        print("You pour the beverage over the grave of the deceased hero")
        print("\u{001B}[36mSucces: Becoming a hero\u{001B}[0m")
        print("\u{001B}[32mYou have finished the game by becoming a Hero\u{001B}[0m") // 1st ENDING CONDITION
        game.finished = true
        exit(0)
    
    }else{
        print("You don't have the required item")
    }
    
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
        player.maxHealth += 25
        player.maxMana += 10 
        player.defense += 15
    }else{
        print("The mechanism doesn't move, try again.")
        enigme1()
    }

}
func enigme2(){
    print()
    print("Would you like to read your Book : Curse of the King ?")
    
    if inInventory(itemGuess: secretScroll){
        print("You read the Secret Scroll breaking the curse of the fallen king Valdrakar")
        print("Valdrakar looks at you and says: ")
        print("\u{001B}[3mYou didn't brandish a weapon... but a hope.\nThe curse is lifted... thanks to you.\nI'm free... and this kingdom can finally heal\nRemember: the greatest power is the power to forgive.\u{001B}[0m")
        print("\u{001B}[36mSucces Chain Breaker: For freeing a tormented soul without resorting to violence.\u{001B}[0m")
        print("\u{001B}[32m🎉 Alternative ending unlocked! \nYou broke the curse without violence.\nPeace has prevailed over blood.\n🕊️ REDEMPTION.\u{001B}[0m") // 2nd ENDING CONDITION
        game.finished = true
        exit(0)
    
    }else{
        print("You don't have the Book : Curse of the King in your inventory")
    }
    

}
func encounterPnj0(){
    print()
    print("A hooded old man approaches. His eyes shine with a strange glint. Before you can react, he whispers: \n<Let me lead your steps for a moment...>")
    //func auto mode
}
func autoMode(){
    
    print("\u{001B}[36mSuccess: Becoming a puppet\u{001B}[0m")
    //let listeMoves = ["down","up","left","right"]
    // Check which stage the player is with the id of the current stage
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
            print()
            //stageMTN.move(direction: "down")
            //stageMTN.move(direction: "down")
            //changeStage(from: stageMTN, to: LibraryStage)
            
            if inInventory(itemGuess: secretScroll){
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
            player.attack += 5
            player.defense -= 5
        case 2:
            print("\u{001B}[32m+5HP\u{001B}[0m")
            print("\u{001B}[31m-5MP\u{001B}[0m")
            // Update the player stats
            player.healthPoint += 5
            player.mana -= 5
        case 3:
            print("\u{001B}[32m+5SPD\u{001B}[0m")
            print("\u{001B}[31m-5DEF\u{001B}[0m")
            // Update the player stats
            player.speed += 5
            player.defense -= 5
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
func afficherAsciiArtDragon() {
    print("""
                       
               ,                   ,     
              / \\    )\\__/(     / \\       
             /   \\  (_\\  /_)   /   \\      
        ____/_____\\__\\@  @/___/_____\\____ 
        |             |\\../|              |
        |              \\VV/               |
        |        ----------------          |
        |_________________________________ |
        |    /\\ /      \\\\       /\\     | 
        |   /   V        ))       V  \\    | 
        |  /     `       //      '    \\   | 
        `                V             '
            
    """)
}

func becomeADragon(){
    player = dragon
    if inInventory(itemGuess: dragonSoulFragment){
        print("Do you want to use this Soul ? (y/n)")
        let answerDragon = readLine()
        switch answerDragon{
            case "y":
                player = dragon
                print("You feel your waistline expanding and your mind rambling ")
                print("...")
                print("You've become a dragon hungry for gold and blood from now on")
                afficherAsciiArtDragon()
                print("\u{001B}[36mSucces: Become a Dragon.\u{001B}[0m")
                print("\u{001B}[32m🎉 Alternative ending unlocked! \nYou consumed the Soul of Valdrakar\u{001B}[0m") // 2nd ENDING CONDITION
                game.finished = true
            case "n":
                print("Nothing happens")
            default:
                print("Err")
                
        }
    }else{
        print("You need a Soul of a Dragon to unlock the easter egg")
    }

    
}
func askCharacter(){
    print()
    print("Choose your Character among ")
    displayPlayerCharacters()
    print("1: Knight \n2: Paladin \n3: Hunter \n4: Druid \n5: Pyromancer")
    if let inputCharacter = readLine(),let characterChoice = Int(inputCharacter) {
        switch characterChoice {
        case 1:
            player = knight
            print("You have chosen to become: \(player.characterClass)")
        case 2:
            player = paladin
            print("You have chosen to become: \(player.characterClass)")
        case 3:
            player = hunter
            print("You have chosen to become: \(player.characterClass)")
        case 4:
            player = druid
            print("You have chosen to become: \(player.characterClass)")
        case 5:
            player = pyromancer
            print("You have chosen to become: \(player.characterClass)")
        default:
            print("Error , you are a knight")
        }
        
    }
}
func displayInfoEnnemis(ennemy: Enemy){
    ennemy.displayStats()

}
func askEnemy(){
    print()
    print("Which enemies would you like to know more about ?")
    print("1: Goblin \n2: Skeleton \n3: Undead \n4: Werewolf \n5: iceSpecter \n6: caveGiant \n7: necromancer \n8: mad-Alchemist \n9: Valdrakar")
    if let enemieChoice = readLine(), let enemieID = Int(enemieChoice){
        switch enemieID {
        case 1:
            print()
            //displayInfoEnnemis(ennemy: gobelin)
        case 2:
            print()
            //displayInfoEnnemis(ennemy: skeleton)
        case 3:
            print()
            //displayInfoEnnemis(ennemy: undead)
        case 4:
            print()
            //displayInfoEnnemis(ennemy: werewolf)
        case 5:
            print()
            //displayInfoEnnemis(ennemy: iceSpecter)
        case 6:
            print()
            //displayInfoEnnemis(ennemy: caveGiant)
        case 7:
            print()
            //displayInfoEnnemis(ennemy: necromancer)
        case 8:
            print()
            //displayInfoEnnemis(ennemy: madAlchemist)
        case 9:
            print()
            //displayInfoEnnemis(ennemy: Valdrakar)
        default:
            print("This enemy does not exist in the world")
        }
    }
}