require "open-uri"

Director.destroy_all
Genre.destroy_all
Movie.destroy_all
User.destroy_all

# Images
puts "Building fake pop data..."
puts "Fetching images..."
ridley_scott = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Spike_Jonze_Her_Premiere_NYFF_2013_%28cropped%29.jpg/450px-Spike_Jonze_Her_Premiere_NYFF_2013_%28cropped%29.jpg')
blade_runner = URI.open('https://upload.wikimedia.org/wikipedia/pt/b/bb/BladeRunner-P%C3%B4ster.jpg')

spike_jonze = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Ridley_Scott_by_Gage_Skidmore.jpg/500px-Ridley_Scott_by_Gage_Skidmore.jpg')
ela = URI.open('https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSsSpHm_I6psn52k0pOtr7NcrWPA9GCw4kf7dgJdIyNUhG_TFLC')

# Director
puts "Creating directors..."
diretor1 = Director.new(name: 'Ridley Scott')
diretor1.photo.attach(io: ridley_scott, filename: 'ridley_scott.jpg', content_type: 'image/jpg')
diretor1.save!

diretor2 = Director.new(name: 'Spike Jonze')
diretor2.photo.attach(io: spike_jonze, filename: 'spike_jonze.jpg', content_type: 'image/jpg')
diretor2.save!

# Genre
puts "Creating genres..."
genero = Genre.new(name: 'Ficção científica')
genero.save!

# Movie
puts "Creating movies..."
filme1 = Movie.new(name: 'Blade Runner - O Caçador de Androides', description: 'No século 21, uma corporação desenvolve clones humanos para serem usados como escravos em colônias fora da Terra, identificados como replicantes. Em 2019, um ex-policial é acionado para caçar um grupo fugitivo vivendo disfarçado em Los Angeles.', year: 1982, platform: 'Netflix', link: 'https://www.netflix.com/title/70082907', country: 'EUA', imdb_score: 81, duration: 117, director_id: diretor1.id, genre_id: genero.id )
filme1.photo.attach(io: blade_runner, filename: 'blade_runner.jpg', content_type: 'image/jpg')
filme1.save!

filme2 = Movie.new(name: 'Ela', description: 'Em Los Angeles, o escritor solitário Theodore desenvolve uma relação de amor especial com o novo sistema operacional do seu computador. Surpreendentemente, ele acaba se apaixonando pela voz deste programa, uma entidade intuitiva e sensível, chamada Samantha.', year: 2013, platform: 'Google Play', link: 'https://play.google.com/store/movies/details?id=SjZudKgH_OY', country: 'EUA', imdb_score: 80, duration: 126, director_id: diretor2.id, genre_id: genero.id )
filme2.photo.attach(io: ela, filename: 'ela.jpg', content_type: 'image/jpg')
filme2.save!

# User
puts "Creating users and their favorites..."
usuario = User.new(name: 'George Lucas', email: 'teste@teste.com', password: '123456')
usuario.save!

# Fav Director
diretor_fav = FavoriteDirector.new(director_id: diretor1.id, user_id: usuario.id)
diretor_fav.save!

# Fav Genre
genero_fav = FavoriteGenre.new(genre_id: genero.id, user_id: usuario.id)
genero_fav.save!

# Fav Movie
filme_fav = FavoriteMovie.new(movie_id: filme1.id, user_id: usuario.id)
filme_fav.save!

puts "All done!"
