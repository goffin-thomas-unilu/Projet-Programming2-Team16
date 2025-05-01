
enum TileType {
    case empty
    case player
    case obstacle
    case item(String)
    case enemy(String)
    case nextStage(Int)
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

    mutating func displayMap() {
        print()
        print(self.name)
        for row in map {
            let line = row.map { tile in
                switch tile.type {
                case .empty: return "⬜"
                case .player: return "🧍"
                case .obstacle: return "🪨"
                case .item(let name): return "🎁"
                case .enemy(let name): return "👾"
                case.nextStage(let idStage): return " ▼"
                }
            }.joined(separator: " ")
            print(line)
        }
    }
    mutating func move(direction: String) {
        let (x, y) = playerPosition
        var newX = x
        var newY = y

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
        if newX >= 0, newX < map.count, newY >= 0, newY < map[0].count {
            // Optionnel : bloquer si c’est un obstacle
            if case .nextStage(Int) = map[newX][newY].type {
                print("🪨 You bumped into an obstacle!")
                return
            }

            // Déplace le joueur
            map[x][y] = baseMap[x][y]
            map[newX][newY] = Tile1(type: .player)
            playerPosition = (newX, newY)
            print("✅ You moved \(direction).")
            displayMap()
        } else {
            print("🚫 Can't move outside the map!")
        }
    }
}
