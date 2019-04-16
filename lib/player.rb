class Player
attr_accessor :name
attr_accessor :life_points

	def initialize(name)
		@name = name
		@life_points = 10
	end

	def show_state
		print "#{@name} a #{@life_points} points de vie"
	end

	def gets_damage(player, damage)
		player.life_points -= damage
		if player.life_points == 0 || player.life_points <0
			print "le joueur #{player.name} a été tué"
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