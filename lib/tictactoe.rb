class TicTacToe
	attr_reader :player1, :player2, :board

	def initialize board = Board.new #player1, player2
		@player1 = Player.new#(player1)
		@player2 = Player.new#(player2)
		@board = board
	end

	def play
		active_player = !active_player || player1
	end

	def game_over
		
	end

	def victory?
	end
end

class Player
	@@number_of_players = 0
	attr_reader :mark, :name

	def initialize #name
		@mark = @@number_of_players == 0 ? :X : :O
		@@number_of_players += 1
		# @name = name
	end
end

class Board
	attr_accessor :spaces

	def initialize
		@spaces = build_board
	end

	def show
		puts "    1   2   3"
		[:A, :B, :C].each do |row|
			puts "#{row.to_s}  | #{@spaces[row].join(" | ")} |"
		end
	end

	def place_mark player_choice, player_mark
		column, row = convert_to_space(player_choice)
		spaces[row][column] = player_mark
	end

	private

	def build_board
		Hash.new([' ', ' ', ' '])
	end

	def convert_to_space player_choice
		space = player_choice.split('').sort.reverse
		raise "Invalid choice" unless space.all? { |a| a =~ /[abc123]/i }
		[space[0].to_i, space[1].to_sym]
	end
end