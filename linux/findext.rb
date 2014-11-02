#!/usr/bin/env ruby
# -*- coding:utf-8  -*-
MONOCOM = "findext"
module StateBase
  def process(&thread)
    thread.call
  end
end

module OptionValidation
  def invalid_option?(opt)
    return false if opt.nil?
    return true  if not opt =~ /(s|l|sl|ls)/
    false
  end
  
  def error_option_validation
    raise ArgumentError, "follow this line => '#{MONOCOM} -l txt' then you can list out"
  end
end

module CommandValidation
  def invalid_extension?(ext)
    return true if ext.nil?
  end

  def error_command_validation
    raise ArgumentError, "Point extension, '#{MONOCOM} -l txt' then you can list out"
  end
end

module FindCommand
  def findSort(ext);     %x(find ./ -name "*.#{ext}" | sort).split("\n"); end
  def findList(ext);     %x(find ./ -name "*.#{ext}"); end
  def findSortList(ext); %x(find ./ -name "*.#{ext}" | sort); end
end


module ZeroModule
  include StateBase
  include OptionValidation
end

module OneModule
  include StateBase
  include OptionValidation
  include CommandValidation
  include FindCommand
end

module TwoModule
  include StateBase
  include OptionValidation
  include FindCommand
end


class CommandZero
  include ZeroModule
  def initialize
    @out = "Point extension\n"
  end

  def run
    process do
      return @out
    end
  end
end


class CommandOne
  include OneModule
  def initialize(command)
    if command =~ /-[a-z]/
      @opt = command.delete("-")
      @ext = nil
    elsif command =~ /[a-zA-Z0-9]/
      @opt = nil
      @ext = command
    end
  end


  def run
    process do
      error_option_validation  if invalid_option?(@opt)
      error_command_validation if invalid_extension?(@ext)
      find
    end
  end

  private

  def find
    @out = findList(@ext).split("\n")
  end

end


class CommandTwo
  include TwoModule
  def initialize(opt, ext)
    @opt = opt.delete("-")
    @ext = ext
  end
  
  def run
    process do
      error_option_validation if invalid_option?(@opt)
      find
    end
  end

  private

  def find
    case @opt
    when "s"
      findSort(@ext)
    when "l"
      findList(@ext)
    else
      findSortList(@ext)
    end
  end
end


class FindExt
  def initialize(*command)
    command.flatten!
    @state = 
    case command.size
    when 0
      CommandZero.new()
    when 1
      CommandOne.new(command[0])
    when 2
      CommandTwo.new(command[0], command[1])
    else
      puts "You can't point argument over two."
      exit
    end
  end

  def run
    begin
      out = @state.run
      if out.instance_of?(String)
        print @state.run
      elsif out.instance_of?(Array)
        out.each do |file|
          print file, " "
        end
      end
    rescue => e
      puts e.message
    end
  end
end

command = [ARGV[0], ARGV[1]].compact
FindExt.new(command).run
