require 'spec_helper'
require 'tictactoe'

describe TicTacToe do

	describe Player do

		describe '#new' do

			describe 'attributes' do

				it 'returns :X for player 1' do
					expect(subject.mark).to eq(:X)
				end

				it 'returns :O for player 2' do
					expect(subject.mark).to eq(:O)
				end

			end

		end

	end

	describe Board do

		context 'a new game board' do

			it 'shows three rows (A, B, C) of three blank spaces (1, 2 ,3)' do
				expect { subject.show }.to output(/\s*1\s*2\s*3\s*A\W*B\W*C/).to_stdout
			end

		end

		context 'player 1 makes a mark' do

			it 'shows an X on the board' do
				# skip "need to make Player 1 make a mark first"
				subject.place_mark('a1', :X)
				expect { subject.show }.to output(/X/).to_stdout
			end

		end

		context 'when filled' do

			before(:example) do
				board = Board.new
				board.spaces.values.each do |row|
					row.map { |space| [:X, :O].sample }
				end
			end

			let(:game) { TicTacToe.new board }

			it 'calls the #game_over method' do
				expect(:game).to receive(:game_over)
			end

		end

	end

end


# user story (2 users)
# 