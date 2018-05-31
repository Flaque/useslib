# useslib

`useslib` is a litle macro for checking if a user 
has a C dependency installed. It's a way for c-binding authors to alert their users that they need to have some dependencies installed without giving them difficult to understand compiler errors.

If the user has the item, then compilation will work like normal. If they don't, the project will throw a normal crystal compiler error with a message like this:

```
❯ crystal run src/useslib.cr
Error in src/useslib.cr:14: Unable to find c library 'fuzzboing' on your system. Are you sure you installed it?

useslib fuzzboing
^~~~~~~
```

## Warning

`pkg-lib` probably won't work on every system and I've only tested it so far on macOS. It's probably not a good idea to use this for everything. If you find issues with the project on other OS's please let me know.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  useslib:
    github: flaque/useslib
```

## Usage

Just put `useslib someLibrary` at the top of your file. 

```crystal
require "useslib"

useslib imagemagick

puts "this code will only get to the compiler if imagemagick is installed"
```

## Contributing

1. Fork it ( https://github.com/flaque/useslib/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [flaque](https://github.com/flaque) Flaque - creator, maintainer
