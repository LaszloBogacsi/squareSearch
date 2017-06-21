# README
### Objective
This application allows the user to search google images based on a user selecting colored squares and by adding a random filter word.

### Features

- user can select from 7 colored squares (red, pink, orange, yellow, green, blue, purple)
- The app return the top 5 image result.
- the app uses a random word from the following list to season the search:
  - man, mountain, state, ocean, country, building, cat, airline, wealth, happiness, pride, fear, religion, bird, book, phone, rice, snow, water

- the results is clickable, and pointing to the images url.
- the main page shows the previous searches in a list in one session.
  - the list is sorted by most recent on the top
  - shows the: date, time, noun, color, and the http response time in [ms].
  - the list items are links to enable re-running the search.


### The App
- Ruby version `2.3.3`
- the app runs on `rails 5`
- the app doesn't use database because it was outside of the tasks scope, although the was initialized with `postgres` database to be able to run on `Heroku`
- to run tests: run `rspec --format documentation ` from the root folder
- to use it locally:
```
clone repo
cd squaresearch
bundle install (to install dependencies)
rails s (to serve the app)
http://localhost:3000 (to visit the main page in a browser)
```

- the app runs on Heroku: [https://squaresearch.herokuapp.com/](https://squaresearch.herokuapp.com/)
