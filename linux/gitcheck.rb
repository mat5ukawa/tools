#!/usr/bin/env ruby

class CommitCheck
  
  def initialize
    @notesContent = %x(git status -s).split("\n")
    @newmodItem   = @notesContent.select{|elem| elem =~ /^(A|A.|.A|M|M.|.M|\?\?).*/}
    @deletedItem  = @notesContent.select{|elem| elem =~ /^(D|D.|.D).*/}
    @illegalWord  = ["foo", "bar"]
  end

  def process
    removeDeletedItem
    confirmNewItem
    grepWithIllegal(@illegalWord)
    finalStep
  end

  private

  # 'git rm' to 'deleted:' item; under context 'not staged for commit' 
  def removeDeletedItem
    @deletedItem.each do |item|
      item.gsub!(/^(D|D.|.D) */, "")
      %x(git rm #{item})
    end
  end

  # make array with new file; except to modified file
  def confirmNewItem
    @newmodItem.each_with_index do |item, index|
      @newmodItem[index].gsub!(/^(A|A.|.A|M|M.|.M|\?\?). */, "")
    end
    @newmodItem = @newmodItem - @deletedItem # avoid including deleted file
  end

  # 1st - check filename swp or not
  # 2nd - grep with illegal word
  def grepWithIllegal(illegalWord)
    @newmodItem.each do |filename|
      next if isSwpFile?(filename)
      grepWord(filename, illegalWord)
    end
  end

  # check filename whether it is swp or not
  def isSwpFile?(filename)
    if filename =~ /^.*\.swp$/
      puts "\n### You have swp file! => #{filename}"
      return true
    end
    return false
  end
  
  # grep word in the file
  # O(n * n^x) [n is lines, x is num of illegalword]
  # not beautiful...
  def grepWord(filename, illegalWord)
    File.read(filename).split("\n").each_with_index do |line, index|
      illegalWord.each do |word|
        if line =~ /#{word}/
          puts "\n==> illegal word '#{word}' at #{filename}:#{index + 1}"
        end
      end
    end
  end

  # Do 'git add .; 'git status' at the end of script
  def finalStep
    puts "*" * 50
    puts %x(git status)
    puts "*" * 50
  end

end

CommitCheck.new.process
