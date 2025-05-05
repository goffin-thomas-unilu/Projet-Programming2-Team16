
/*

while !finished {
   menu()
   
}
*/
class MyGame{
    var finished: Bool = false 
}
// --- Point d'entrée du programme ---
let game = MyGame()

askCharacter()
while !game.finished {
    menu()
}
becomeADragon()
print("👋 Thanks for playing !")