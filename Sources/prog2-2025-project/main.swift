
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

while !game.finished {
    menu()
}

print("👋 Thanks for playing !")