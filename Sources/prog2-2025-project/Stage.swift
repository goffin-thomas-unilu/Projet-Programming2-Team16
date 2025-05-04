var boolNextStage = false
var automodebool = false
enum TileType {
    // each case for a specifc object
    case empty
    case player
    case pnj(String)
    case riddle(Int)
    case item(String)
    case enemy(String)
    case nextStage([Int])
}
struct Tile1{
    var type : TileType
}
struct Stage1 {
    let id: Int
    let name: String
    var description: String
    var map: [[Tile1]]
    var baseMap: [[Tile1]]
    var playerPosition: (x: Int, y: Int)
    var connexion: [Int]

    // Constructor to create a stage
    init(id: Int, name: String, description: String, map : [[Tile1]],connexion: [Int]) {
        self.id = id
        self.name = name
        self.description = description
        self.map = map
        self.playerPosition = (0,2)
        self.map[playerPosition.x][playerPosition.y] = Tile1(type: .player)
        self.connexion = connexion
        self.baseMap = map
    }
    // function to show the current map
    mutating func displayMap() {
        print()
        print(self.name)
        print(self.description)
        print()
        // read each line of the map
        for row in map {
            // read each index of a line
            let line = row.map { tile in
                // check for each tile type and return a specific emoji that represent the object to the exact position of the tile
                switch tile.type {
                    case .empty: return "⬜"
                    case .player: return "🧍"
                    case .riddle(let idRiddle): return "❔"
                    case .pnj(let pnjName): return "👤"
                    case .item(let name): return "🎁"
                    case .enemy(let name): return "👾"
                    case.nextStage(let idStage): return " ▼"
                }
            }.joined(separator: " ")
            print(line)
        }
    }
    // function to move the player in the map with a direction as a parameter
    mutating func move(direction: String) {
        let (x, y) = playerPosition
        // this will be the new coordinates of the player 
        var newX = x
        var newY = y

        // Check which direction the user gave
        switch direction.lowercased() {
            case "up": newX -= 1
            case "down": newX += 1
            case "left": newY -= 1
            case "right": newY += 1
            default:
                print("❌ Unknown direction.")
                return
        }

        // Vérifie que le mouvement est dans les limites de la map
        // Checks that movement is within map limits
        if newX >= 0, newX < map.count, newY >= 0, newY < map[0].count {
            // 
            //if case .nextStage(self.connexion) = map[newX][newY].type {
            //    askStage()
            //    return
            //}
            // Pattern Matching
            // ⚠️ Sauvegarde du type de la case AVANT modification
            let tileType = map[newX][newY].type
            /*
            // Mise à jour de la map
            map[x][y] = baseMap[x][y]
            map[newX][newY] = Tile1(type: .player)
            playerPosition = (newX, newY)

            print("✅ You moved \(direction).")
            displayMap()

            // Vérification si on est sur une case nextStage
            if case .nextStage(_) = tileType {
                boolNextStage = true
            }
            if case .riddle(let idRiddle) = tileType {
                switch idRiddle {
                    case 0:
                        print("Vous devez réussir cette énigme 1 ")
                        // function enigme0()
                    case 1:
                        //print("enigme 2")
                        enigme1()
                    default:
                        print("Erreur")
                }
            }
            */
             switch tileType {
                case .enemy(let name):
                    // start the fight with the enemy name
                    // func fight(enemy:name)
                    print("⚔️ You've defeated the enemy : \(name)")
                    // we update the baseMap to avoid the fact the enemy is still here even if the user kill him
                    baseMap[newX][newY] = Tile1(type: .empty)
                case .item(let itemName):
                    print("🎁 You've picked up : \(itemName)")
                    // same here , to avoid a infinite numbers a object in the inventory
                    // addToInventory(item:itemName)
                    baseMap[newX][newY] = Tile1(type: .empty)
                case .pnj(let pnjName):
                    print("In front of you is \(pnjName)")
                    switch pnjName {
                        case "The mad Puppeteer":
                            print()
                            automodebool = true
                            //autoMode()
                        case "Guardian of the Sanctuary":
                            // func pnj encounter 1
                            print()
                            encounterPnj1()
                            print("\u{001B}[36mSuccess:  Becoming friend with a Spectre\u{001B}[0m")
                        case "Heros Tomb":
                            // func pnj encounter 2
                            print()
                            encounterPnj2()
                        default:
                            print("Err")
                    }
                    baseMap[newX][newY] = Tile1(type: .empty)
                case .riddle(let idRiddle):
                    // check which riddle the user encountered
                    switch idRiddle {
                        case 0:
                            print("❓ Riddle 1 :")
                            // 1 attempt only for this riddle
                            // enigme0()
                        case 1:
                            enigme1()
                        case 2:
                            print()
                            // 1 attempt only
                            //enigme2()
                        default:
                            print("Riddle error")
                    }
                    baseMap[newX][newY] = Tile1(type: .empty) // supprime l’énigme après / Delete the riddle after 
                case .nextStage:
                    // launch the askstage function
                    boolNextStage = true
                default:
                    break
            }

            // Mise à jour de la position du joueur / Update the player position
            map[x][y] = baseMap[x][y] // restore l’ancienne case
            map[newX][newY] = Tile1(type: .player)
            playerPosition = (newX, newY)

            print("✅ You moved \(direction).")
            displayMap()
        }

        else {
            print("🚫 Can't move outside the map!")
        }
        
    }
    
}
