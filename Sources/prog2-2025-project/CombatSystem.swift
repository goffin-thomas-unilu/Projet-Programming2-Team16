
// System
func simpleCombat(player: PlayerCharacter, enemy: Enemy) {
    var player = player
    var enemy = enemy
    print("A wild enemy appears!")
    
    while player.healthPoint > 0 && enemy.health > 0 {
        // TPLayer's turn
        print("\nYour turn! Choose: [1] Attack  [2] Special Skill")
        if let input = readLine() {
            if input == "2" {
                player.specialSkill.effect(&player, &enemy)
            } else {
                // Base attack
                let damage = max(player.attack - enemy.defense, 1)
                print("You attack enemy for \(damage) damage.")
                enemy.health -= damage
            }
        }
        if enemy.health <= 0 {
            print(" enemy is defeated!")
            break
        }
        
        // PLayer's trun
        let damage = max(enemy.attack - player.defense, 1)
        print("enemy attacks you for \(damage) damage.")
        player.healthPoint -= damage
        if player.healthPoint <= 0 {
            print("You are defeated!")
        }
        print("Your HP: \(player.healthPoint), enemy HP: \(enemy.health)")
    }
}


var myKnight = knight 

