# Scrabbler

This is a small project I created 

## Usage

Run `bundle exec bin/console` to start the app

then `print("WORD1", "WORD2", "WORD3", "WORD4")`

This will then print all results in the console.
Example : 
```
# => print("SCRABBLE", "INTERSECTION", "POSITIONS", "EXERCISE")

--------------------------------------
|                                    |
| P                                  |
| O                    E             |
| S                    X             |
| I                    E             |
| T                    R             |
| I  N  T  E  R  S  E  C  T  I  O  N |
| O                    I             |
| N                    S             |
| S  C  R  A  B  B  L  E             |
|                                    |
--------------------------------------
-----------------------------
|                           |
|       E                   |
|       X                 I |
|       E                 N |
|       R                 T |
|    S  C  R  A  B  B  L  E |
|       I                 R |
| P  O  S  I  T  I  O  N  S |
|       E                 E |
|                         C |
|                         T |
|                         I |
|                         O |
|                         N |
|                           |
-----------------------------
-----------------------------
|                           |
|          E              I |
|          X              N |
|          E              T |
|    S  C  R  A  B  B  L  E |
|          C              R |
| P  O  S  I  T  I  O  N  S |
|          S              E |
|          E              C |
|                         T |
|                         I |
|                         O |
|                         N |
|                           |
-----------------------------
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/scrabbler. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/scrabbler/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Scrabbler project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/scrabbler/blob/master/CODE_OF_CONDUCT.md).
