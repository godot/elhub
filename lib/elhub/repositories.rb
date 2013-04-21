class Repository

  def self.find
    Dir.glob( File.join(ENV['HOME'],'/**/.git') )
  end

end
