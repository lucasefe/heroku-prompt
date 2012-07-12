require "fileutils"
require 'readline'

class Heroku::Command::Prompt < Heroku::Command::Base

  def index
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

Heroku::Command::Help.group("Accounts") do |group|
  group.command "prompt", "access the prompt"
end

