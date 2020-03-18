# popstream

**popstream** was made as a final project for [Le Wagon's](https://www.lewagon.com) 9 week Full-Stack Bootcamp. It's a website that offers better movie suggestions for streaming platforms, like Netflix, HBO GO, Amazon Prime, etc.

It was built with Ruby, Rails, Algolia InstantSearch.js, and features gems like Cloudinary and Shrine, and hosted on Heroku.

## Project specifications
* **Ruby v. 2.6.5 - Rails v. 5.2.4.1**
* **Gems dependencies:** 'bootstrap', 'devise, 'cloudinary', 'algoliasearch-rails', 'shrine-cloudinary', 'country_select', font-awesome-sass' and 'simple_form' gems.
* **Configuration:** environment configs can be found at `config/webpack/` and services at `config/database.yml` and `config/storage.yml` files.
* **Database creation:** `rails db:create`
* **Database initialization:** `rails db:migrate`.
* **Deployment instructions:** after running database commands, run `git push heroku master` and `heroku run rails db:migrate` to send project to Heroku.

Visit popstream at https://popstream-video.herokuapp.com/.
