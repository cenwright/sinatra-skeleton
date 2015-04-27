# Homepage (Root path)
require 'pry'
helpers do
	def current_user
		@current_user = User.find_by(id: session[:user_id]) if session[:user_id]
	end
end

before do
  redirect '/login' if !current_user && request.path != '/login' && request.path != '/signup'
end

get '/' do
	@albums = Album.all.reverse
  erb :index
end

get '/login' do
  erb :login
end

get '/logout' do
	session[:user_id] = nil
	redirect '/'
end

get '/signup' do
  erb :signup
end

get '/profile' do
	erb :profile
end

get '/albums/new' do
	erb :new_album
end


get '/profile/edit' do
	current_user
	erb :profile_edit
end

post '/profile/edit' do
	firstname = params[:firstname]
	lastname = params[:lastname]
	username = params[:username]
	email = params[:email]
	password = params[:password]

	current_user.update firstname: firstname, lastname: lastname, username: username, email: email, password: password
	redirect '/'
end

post '/albums/:id/comments/new' do
	opinion = params[:opinion]
	rating = params[:rating]
	album = Album.find(params[:id])
	new_comment = album.reviews.create opinion: opinion, rating: rating
	redirect "/albums/#{params[:id]}"
end


post '/login' do
	email = params[:email]
	password = params[:password]

	user = User.find_by(email: email)
	if user.password == password
		session[:user_id] = user.id
		redirect '/'
	else
		redirect '/login'
	end
end

post '/albums/create' do
	title = params[:title]
	artist = params[:artist]
	year = params[:year]


	new_album = current_user.albums.create title: title, artist: artist, year: year
	redirect "/albums/#{new_album.id}"
	# end
end

get '/albums/:id' do
	@album = Album.find(params[:id])
	erb :album
end

post '/signup' do
	firstname = params[:firstname]
	lastname = params[:lastname]
	username = params[:username]
	email = params[:email]
	password = params[:password]

	user = User.find_by(username: username)
	if user
		redirect '/signup'
	else
		user = User.create(firstname: firstname, lastname: lastname, username: username, email: email, password: password)
		session[:user_id] = user.id
		redirect '/'
	end
end	
	

post '/profile' do
	redirect '/'
end









