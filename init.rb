require "fileutils"
require 'readline'

# opens heroku prompt

class Heroku::Command::Prompt < Heroku::Command::Base

  def index
    while line = Readline.readline(prompt, true)
      lines = line.split(" ").map(&:strip)
      cmd = lines.shift
      exit if /exit/ =~ cmd
      begin
        run_command cmd, lines + opts if cmd != ""
      rescue Exception => e
        display "[Error]"
      end
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

