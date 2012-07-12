require "fileutils"
require 'readline'

class Heroku::Command::Prompt < Heroku::Command::Base

  def index

    stty_save = `stty -g`.chomp

    cmd_prefix = ARGV.join(" ")

    while cmd = Readline.readline(prompt, true)
      exit if /exit/ =~ cmd
      if cmd != ""
        full_cmd = "heroku #{cmd} #{cmd_prefix}"
        puts " [executing #{full_cmd}]"
        system(full_cmd)
      end
    end
  end

  private

  def prompt
    if ARGV.include?("--app")
      "[ #{ARGV[ARGV.index("--app") + 1]} ] > "
    else
      "> "
    end
  end
end

Heroku::Command::Help.group("Accounts") do |group|
  group.command "prompt", "access the prompt"
end

