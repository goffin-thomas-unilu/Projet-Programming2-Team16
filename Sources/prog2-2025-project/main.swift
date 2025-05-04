
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

print("👋 Thanks for playing !")