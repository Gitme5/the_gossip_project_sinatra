require 'pry'
require 'csv'

class	Gossip
	attr_accessor :author, :content, :id
	
	def initialize(author,content)

		@author = author
		@content = content

	end

# Permet de sauvegarder directement une entrée dans le CSV
	def save

		CSV.open("db/gossip.csv", "a") do |csv|
			# Testé avec 
			#csv << ["Mon super Auteur","Mon super Content"]
  			csv << [@author,@content]
		end

	end

# Permet de récupérer un contenu de potin selon l'id indiqué en fin d'url
	def self.find(id)

		self.all.each_with_index do |row,index|
			if index == id.to_i
				return row
			end
		end

	end

# Renvoi tout le contenu du CSV
	def self.all
		all_gossips = []

		CSV.foreach("db/gossip.csv") do |row|
			all_gossips << Gossip.new(row[0],row[1])
		end

		return all_gossips
	end
	
end



