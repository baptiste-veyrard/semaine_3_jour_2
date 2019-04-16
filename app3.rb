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
		name_choice = gets.chomp
		my_game = Game.new(name_choice)

	while my_game.is_still_ongoing?
			
		#On affiche l'état du joueur
		puts "\nVoici l'état du jeu :"
		puts "________________________"
		my_game.show_players
		puts "\n\n"


		#Nouveaux ennemies potentiels
		my_game.new_players_in_sight

		#Affichage du menu
		my_game.menu

		#Choix de l'utilisateur
		choice = gets.chomp
		puts "\n"

		#Actions en fonction du choix
		my_game.menu_choice(choice)

		#Les ennemies contre-attaque
		if my_game.is_still_ongoing?
		puts "\n--------------------------------"
		puts "Les autres joueurs t'attaquent !\n"
		my_game.enemies_attack
		puts "--------------------------------"
		end
	end

		#message de fin
		my_game.end_message

