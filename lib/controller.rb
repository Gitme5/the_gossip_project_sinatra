require 'gossip'

class ApplicationController < Sinatra::Base
  

# Page d'accueil affichage des potins et de la possibilité de créer un nouveau potin
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end


# Affichage de la page selon l'url renseigné.
  get '/gossips/:id' do

    puts "Voici le numéro du potin que tu veux : #{params['id']} !"
    gossip_index = Gossip.find(params['id'])
    puts "Voici le potin #{params['id']} : #{gossip_index.content}"
    
    erb :show, locals: {gossips: Gossip.all}
 
  end

# Affichage du formulaire de saisie des potins
  get '/gossips/new/' do
  	erb :new_gossip
  end

# Permet de sauvegarder un nouveau potin tout de suite aprés la saisie
  post '/gossips/new/' do
  	Gossip.new(params["gossip_author"],params["gossip_content"]).save
  	redirect '/'
  end


  # Lancement de la classe
  # run! if app_file == $0
end