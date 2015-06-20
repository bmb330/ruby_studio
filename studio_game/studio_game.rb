require_relative 'game'

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play

chipmunks = Game.new("chipmunks")
chipmunks.add_player(Player.new("Alvin"))
chipmunks.add_player(Player.new("Simon"))
chipmunks.add_player(Player.new("Theodore"))
chipmunks.play
