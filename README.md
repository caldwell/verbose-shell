# VerboseShell

VerboseShell adds `-x`-like logging to FileUtils functions. Example:

    require 'verbose-shell'
    Vsh = VerboseShell
    Vsh.system(*%W'ls -l')
    Vsh.verbose = true
    Vsh.system(*%W'echo Hello')
    Vsh.cp('/etc/passwd', '/tmp/passwd')

This outputs:

    + echo Hello
    Hello
    + cp /etc/passwd /tmp/passwd

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'verbose-shell'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install verbose-shell

## Usage

Set `VerboseShell.verbose` to `true` or `false`. The default is `false`, so
no logging will occur until it is changed.

All FileUtils functions are supported. They may not log correctly--if you
find one that doesn't log in a sane way, file a bug or (hopefully) a pull
request.

In addition, the following functions are available (all will log when
`verbose` is set):

- `VerboseShell.system(*args)`: Similar to Kernel.system except it only
  accepts the multiple argument form (for safety). It is therefore never run
  through the shell, and shell meta characters are unsupported (so no `|`,
  `&&`, `||`, etc.). When `verbose` is not set, output will be captured and
  stored in an exception if there is an error, or discarded if there is no
  error. If `verbose` is set, output will display immediately and not be
  captured (even on errors).

- `VerboseShell.system_or_true(*args)`: Similar to the above, but will never throw
  exceptions.

- `VerboseShell.capture(*args)`: A wrapper around IO.popen(). Returns the
  stdout of the command given. Like `VerboseShell.system()`, only the
  multiple argument form is accepted (so no shell is involved).

- `which?(exe_name)`: Searches through `ENV['PATH']` and returns the full
  path of exe_name if found, and `nil` if not found.

- `install_D(source, dest)`: Like `install -D` (see INSTALL(1)).

## Development

After checking out the repo, run `bin/setup` to install dependencies. You
can also run `bin/console` for an interactive prompt that will allow you to
experiment.

To install this gem onto your local machine, run `bundle exec rake
install`. To release a new version, update the version number in
`version.rb`, and then run `bundle exec rake release`, which will create a
git tag for the version, push git commits and tags, and push the `.gem` file
to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/caldwell/verbose-shell.

## License

The gem is available as open source under the terms of
the [MIT License](http://opensource.org/licenses/MIT).
