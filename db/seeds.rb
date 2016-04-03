author_1 = Author.create!(name: 'Autore 1', surname: 'Cognome')
author_2 = Author.create!(name: 'Autore 2', surname: 'Cognome')
author_3 = Author.create!(name: 'Autore 3', surname: 'Cognome')

author_group_1 = Array.new
author_group_1 << author_1


author_group_2 = Array.new
author_group_2 << author_2

author_group_3 = Array.new
author_group_3 << author_1
author_group_3 << author_3

Book.create!(title: 'Libro 1', authors: author_group_1)
Book.create!(title: 'Libro 2', authors: author_group_2)
Book.create!(title: 'Libro 3', authors: author_group_1)
Book.create!(title: 'Libro 4', authors: author_group_3)
Book.create!(title: 'Libro 5', authors: author_group_3)
Book.create!(title: 'Libro 6', authors: author_group_3)
Book.create!(title: 'Libro 7', authors: author_group_1)
Book.create!(title: 'Libro 8', authors: author_group_2)
Book.create!(title: 'Libro 9', authors: author_group_2)
Book.create!(title: 'Libro 10', authors: author_group_1)
Book.create!(title: 'Libro 11', authors: author_group_2)
Book.create!(title: 'Libro 12', authors: author_group_3)