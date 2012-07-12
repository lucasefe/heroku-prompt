require "fileutils"
require 'readline'

# opens heroku prompt

class Heroku::Command::Prompt < Heroku::Command::Base

  def index
    display Heroku::Command::Help.groups.inspect

    while cmd = Readline.readline(prompt, true)
      exit if /exit/ =~ cmd
      run_command cmd, opts if cmd != ""
    end
  end

  private

  def prompt
    "[ #{app}] > "
  end

  def opts
    @opts ||= Heroku::Command.current_options.map do |k, v|
      ["--#{k}", v]
    end.flatten
  end
end

