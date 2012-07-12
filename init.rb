require "fileutils"

class Heroku::Command::Prompt < Heroku::Command::Base

  def index
    display "Heroku Prompt: "

  end
end

Heroku::Command::Help.group("Accounts") do |group|
  group.command "prompt", "access the prompt"
end

