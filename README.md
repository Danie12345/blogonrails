![](https://img.shields.io/badge/Microverse-blueviolet)

## Blog App

> A classic blog app made with Rails. This is a fully functional website that shows a list of the authors. For each author is shows a list of their posts and empowers readers to interact with them by adding comments and liking posts.

## Built With

- Ruby on Rails
- PostgreSQL
- devise / devise-jwt - for authentication
- cancancan - for authorization

### Getting Started

To get a local copy up and running follow these simple steps:

### Prerequisites

- Ruby ruby-3.1.2 installed
- PostgreSQL dbms running

## Setup Project

- Open your terminal and navigate to the folder you would like to save the project.

- Type these commands into the terminal:

```
git clone git@github.com:Danie12345/blogonrails.git
cd blogonrails
bundle install
```

- Edit file config/database.yml to provide credentials for db access:

  - Replace values for user_name, password and host.

- Type this command into the terminal to reset the database:

```
rails db:reset
```

### Run application

- Type this commands into the terminal:

```
rails server
```

- Open your web browser at [http://127.0.0.1:3000/](http://127.0.0.1:3000/)

### Run tests

- Type these commands into the terminal:

```
rspec spec -f doc lib
```

## Author

👤 **Daniel Malo**

- GitHub: [@Danie12345](https://github.com/Danie12345)
- Twitter: [@DanielMalo_v4](https://twitter.com/DanielMalo_v4)
- LinkedIn: [Daniel Malo](https://linkedin.com/in/daniel-malo)

## Collaborator

👤 **Roberto A. Baños Alvarez**

- GitHub: [@rbanos-mv](https://github.com/rbanos-mv)
- Twitter: [@RobertoBanosMV](https://twitter.com/RobertoBanosMV)
- LinkedIn: [Roberto A Baños Alvarez](https://linkedin.com/in/roberto-a-baños-alvarez-500766234)

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Danie12345/blogonrails/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Microverse](https://www.microverse.org/) for the motivation.
