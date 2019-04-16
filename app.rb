require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#On créer les joueurs
player_1 = Player.new("Josiane")
player_2 = Player.new("José")

#On indique leur état avant le combat


while player_1.life_points > 0 && player_2.life_points >0 
	puts "\nVoici l'état de chaque joueur:"
	puts player_1.show_state
	puts player_2.show_state

	puts "\n"


	puts "Passons à la phase d'attaque !"
	player_1.attacks(player_2)
	unless player_2.life_points > 0
		break
	end
	player_2.attacks(player_1)
end