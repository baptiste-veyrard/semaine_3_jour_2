require './lib/player'

class Game

	attr_accessor :human_player
	attr_accessor :players_left
	attr_accessor :enemies_in_sight

	def initialize(human_player_name)
		@human_player = HumanPlayer.new(human_player_name)
		enemy_1 = Player.new("Lionel")
		enemy_2 = Player.new("Léo")
		enemy_3 = Player.new("Roseline")
		enemy_4 = Player.new("Baptiste")
		@enemies_in_sight = []
		@enemies_in_sight << enemy_1
		@enemies_in_sight << enemy_2
		@enemies_in_sight << enemy_3
		@enemies_in_sight << enemy_4
		@life_points = 10
		@players_left = 10
	end

	def kill_player(enemy_killed)
		@enemies_in_sight.each do |enemy|
			if enemy == enemy_killed
				enemies_in_sight.delete(enemy)
			end
		end
	end

	def is_still_ongoing?
		@human_player.life_points > 0 && (@enemies_in_sight.length != 0 || @players_left !=0)
	end

	def show_players
		puts "#{human_player.name} a #{human_player.life_points} points de vie"
		puts "Il reste #{enemies_in_sight.length} ennemies à battre"
	end

	def new_players_in_sight
		if @players_left <= 0
			puts "Tous les joueurs sont déjà en vue"
		else
			dice = rand(1..6)
			if dice == 1
				puts "Aucun nouvel ennemi arrive"
			elsif dice >= 2 && dice <=4
				puts "Attention, 1 nouvel ennemi arrive !"
	            enemie_bonus = Player.new("Player#{rand(0..50000)}")
	            @enemies_in_sight << enemie_bonus
	            @players_left -= 1
	        else
	        	puts "Attention, 2 nouveaux ennemies arrivent !"
	        	enemie_bonus_1 = Player.new("Player#{rand(0..50000)}")
	        	@enemies_in_sight << enemie_bonus_1
	        	enemie_bonus_2 = Player.new("Player#{rand(0..50000)}")
	        	@enemies_in_sight << enemie_bonus_2
	        	@players_left -= 2
			end
		end
	end

	#On propose un menu
	def menu
	puts "Quelle action veux-tu effectuer?"
	puts "\n"
	puts "a - chercher une meilleure arme"
	puts "s - chercher à se soigner"
	puts "\n"
	puts "attaquer un joueur en vue :"
	i = 0
	enemies_in_sight.each do |enemy|
		i +=1
		puts "#{i} - #{enemy.name} a #{enemy.life_points} points de vie."
	end
	puts "Fais ton choix"
	print ">"
	end
	#Fin du menu

	#Les actions possibles
	def menu_choice(choice)

		if choice == "a"
			human_player.search_weapon
		elsif choice == "s"
			human_player.search_health_pack
		else
			i = 0
			enemies_in_sight.each do |enemy|
				i += 1
				if i == choice.to_i
					human_player.attacks(enemy)
					unless enemy.life_points > 0
						enemies_in_sight.delete(enemy)
					end
				end
			end
		end
	end

	def enemies_attack
		enemies_in_sight.each do |enemy|
			enemy.attacks(human_player)
		end
	end
	

	def end_message
		puts "\nLa partie est finie"
		if human_player.life_points > 0
			puts "BRAVO, TU AS GAGNE"
		else
			puts "Loser ! Tu as perdu !"
		end
	end

end