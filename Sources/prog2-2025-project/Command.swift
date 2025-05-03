var finished = false
func printCommand(){
    print()
    print("Voici la liste des commandes :")
    print("- Afficher la map : map")
    print("- Afficher votre inventaire : inventory")
    print("- Afficher le status : status")
    print("- Information sur le stage : stage")
    print("- Information sur un ennemie : assess")
    print("- Intéragir avec un mécanisme : interact")
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
        print()
        print("Info sur le stage Actuel: \n nom: \(stageMTN.name), \n id: \(stageMTN.id), \n description: \(stageMTN.description), \n relié aux id: \(stageMTN.connexion) ")
        menu()
    case "assess":
        print()
        // function to print informations about a specific enemy, printEnemyInfo("Gobelin")
    case "interact":
        print()
        // fonction pour intéragir avec les énigmes 
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
    //boolNextStage = false
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
    boolNextStage = false
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

func enigme0(){
    print()
    print("Voulez-vous déposer quelque chose sur la tombe du Héro")
    /* 
    if inventory.contains("Elixir of Honor"){
        print("Vous versez le breuvage sur la tombe du Héros défunt")
        print("Le Héros vous défie en combat singulier pour honorer sa dernière volonté")
        func fight("Hero")
        print("\u{001B}[36mSucces: Becoming a hero\u{001B}[0m")
    
    }else{
        print("Vous ne posséder l'objet requis")
    }
    */
}
func enigme1() {
    print()
    print("Vous voyez une étrange rangée de livre..")
    print("Dans une salle ancienne du donjon, quatre livres reposent sur une table poussiéreuse. Une fresque murale contient une inscription :")
    print()
    print("\u{001B}[3mDu chaos naît la sagesse,\nLa guerre mène au silence,\nEt seul le feu révèle la vérité.\u{001B}[0m")
    print()
    print("Les quatres livres s'intitulent : \nLe Feu Sacré 📕 , L'Âge du Chaos 📙 , Les Chroniques de la Guerre 📗 , La Sagesse des Anciens 📘")
    print("Veuillez indiquer votre réponse en écrivant la première lettre la couleur du livre : (rogb,rovb...)")
    let reponseEnigme1 = readLine()
    if reponseEnigme1 == "obgr" {
        print("\u{001B}[32mVous avez réussi l'énigme\u{001B}[0m")
        print("\u{001B}[36mSuccess: Sherlock Holmes in a Dungeon ?\u{001B}[0m")
        // add an item to the inventory: +25 hp,+10 mana,+15 DEF
    }else{
        print("Le mécanisme ne bouge pas, vous devez reessayer")
        enigme1()
    }

}
    