class Player
attr_accessor :name
attr_accessor :life_points

	def initialize(name)
		@name = name
		@life_points = 10
	end

	def show_state
		if @life_points > 0
		print "#{@name} a #{@life_points} points de vie"
		else
		print "#{@name} est morte"
		end
	end

	def gets_damage(player, damage)
		player.life_points -= damage
		if player.life_points == 0 || player.life_points <0
			print "Le joueur #{player.name} a été tué.\n"
		end	
	end

	def attacks(player)
		puts "Le joueur #{@name} attaque le joueur #{player.name} !"
		damage = compute_damage
		puts "Il lui inflinge #{damage} points de dommages"
		gets_damage(player, damage)
		
	end

	def compute_damage
    	return rand(1..6)
  	end
end

class HumanPlayer < Player
attr_accessor :weapon_level

	def initialize(name)
		@life_points = 100
		@weapon_level = 1
		@name = name
	end

	def show_state
		print "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
	end

	def compute_damage
		rand(1..6) * @weapon_level
	end

	def search_weapon
		dice_weapon = rand(1..6)
		puts "Tu as trouvé une arme de niveau #{dice_weapon}"
		if dice_weapon > @weapon_level
			@weapon_level = dice_weapon
			puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends !"
		else
			puts "Mince, cette nouvelle arme n'est pas mieux que ton arme actuelle.. donc tu ne la garde pas!"
		end
	end

	def search_health_pack
		dice_health_pack = rand(1..6)
		if dice_health_pack == 1
			puts "Tu n'as malheureusement rien trouvé..."
		elsif dice_health_pack >= 2 && dice_health_pack <= 5
			if @life_points + 50 < 100
				@life_points += 50
				puts "Tu as trouvé un pack de 50 points de vie, tu as maintenant #{@life_points} points de vie"
			else
				@life_points = 100
				puts "Tu as trouvé un pack de 50 points de vie, ton niveau de vie est au maximum (100)"
			end
		elsif dice_health_pack == 6
			if @life_points + 80 > 100
				@life_points += 80
				puts "Tu as trouvé un pack de 80 points de vie, tu as maintenant #{@life_points} points de vie"
			else
				@life_points = 100
				puts "Waow, tu as trouvé un pack de 80 points de vie, ton niveau de vie est au maximum (100)"
		    end
		end
	end
end

