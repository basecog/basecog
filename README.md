# Basecog: Open-source feature management platform

Basecog aims to build a feature management platform for modern software teams.

We believe that more software should be built by continuously experimenting and exploring.

We're aiming to be radically transparent, open-source and community-driven. 

This codebase is currently in a very early stage of development.

## Tech stack

Built with vanilla Rails, Tailwind and Postgres. Refreshingly simple!

## Development

Before you get started, ensure you have the following minimum versions:

* [Ruby 3.3+](https://www.ruby-lang.org/en/downloads/) (specific version is in `Gemfile`)
* [PostgreSQL 16](https://www.postgresql.org/download/)

Set up the development environment:

```shell
cd basecog
bundle install
rails db:setup
```

You can then run the Rails web server:

```shell
bin/dev
```
Visit [http://localhost:3000](http://localhost:3000). Happy hacking!

## Contributing

This project is in its initial stages so lots of things will break. However, any contributions are highly valuable.

Got an improvement? Feel free to submit a pull request.

Got a feature idea? [Open a new issue](https://github.com/maybe-finance/synth/issues/new).
