		require 'bundler'
		Bundler.require

		require_relative 'lib/game'
		require_relative 'lib/player'

		#Afficher le message d'accueil 
		puts "----------------------------------------------------"
		puts "Bienvenue sur ton nouveau jeu préféré"
		puts "|Le but du jeu est d'être le dernier survivant !|"
		puts "----------------------------------------------------"

		#Initialisation du joueur
		puts "Quel pseudo veux-tu choisir pour ton joueur?"
		name_1 = gets.chomp
		user = HumanPlayer.new(name_1)

		#Initialisation des ennemies
		array_enemies = []
		enemy_1 = Player.new("Josiane")
		enemy_2 = Player.new("José")
		array_enemies << enemy_1
		array_enemies << enemy_2

		#On lance le combat
		while user.life_points >0 && (enemy_1.life_points > 0 || enemy_2.life_points >0)
			puts "\n"
			puts "Voici l'état de ton personnage :"
			puts user.show_state

			#On propose un menu
			puts "Quelle action veux-tu effectuer?"
			puts "\n"
			puts "a - chercher une meilleure arme"
			puts "s - chercher à se soigner"
			puts "\n"
			puts "attaquer un joueur en vue :"
			print "0 -"
			puts "#{enemy_1.show_state}"
			print "1 -"
			puts "#{enemy_2.show_state}"
			puts "\n"
			puts "Fais ton choix"
			print ">"
			choice = gets.chomp
			#Fin du menu

			if choice == "a"
				user.search_weapon
			elsif choice == "s"
				user.search_health_pack
			elsif choice == "0"
				user.attacks(enemy_1)
			elsif choice == "1"
				user.attacks(enemy_2)
			end

			puts "\n"
			puts "Les autres joueurs t'attaquent !"
			puts "\n"
			array_enemies.each do |enemy|
				if enemy.life_points > 0
					enemy.attacks(user)
				end
			end
		end



			puts "La partie est finie"
			if user.life_points > 0
				puts "BRAVO, TU AS GAGNE"
			else
				puts "Loser ! Tu as perdu !"
			end



