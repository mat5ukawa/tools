#!/usr/bin/env ruby

module Message
  module Notice
    extend self
    def description(process_name)
puts <<EOF
No process found with #{process_name}
EOF
    end
  end
end

module Usage
  extend self
  def description
  puts <<EOF
Usage:
  listps [target process command]
  listps ruby
  listps wget
EOF
  end
end

module Exit
  extend self
  include Message

  def safe(target_process)
    Notice.description(target_process)
    exit 0
  end

  def halt
    Usage.description
    exit 1
  end
end

class ListProcess
  include Exit

  USER              = 0
  ID                = 1
  COMMAND           = 10
  OPTION_IF_INCLUDE = -1
  SEPERATOR         = ' '

  def initialize
    begin
      @target_process = ARGV[0]
      raise ArgumentError if ARGV[0].nil?
      @ps_list  = `ps aux`
    rescue ArgumentError
      Exit.halt
    end
  end

  def run
    execute_listing
  end

  private

  def execute_listing
    order_ps_list
    Exit.safe(@target_process) if @ps_list.empty?
    list_vertical_target_process
    list_horizontal_target_ids
  end

  def order_ps_list
    @ps_list = @ps_list.split("\n").select { |process_record| process_record.include?(@target_process) }
  end

  def get_process_items(item)
    @ps_list.map { |process_record| process_record.split(SEPERATOR)[item] }
  end

  def list_vertical_target_process
    users       = send(:get_process_items, USER)
    process_ids = send(:get_process_items, ID)
    commands    = send(:get_process_items, COMMAND..OPTION_IF_INCLUDE)
    users.each_with_index do |record, index|
      puts "#{record}\t#{process_ids[index]}\t#{commands[index].join(SEPERATOR)}"
    end
  end

  def list_horizontal_target_ids
    process_ids = send(:get_process_items, ID)
    puts "IDs: #{process_ids.join(SEPERATOR)}"
  end
end

ListProcess.new.run
