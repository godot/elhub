class Repository

  def self.find
    scan.map{ |dir| Grit::Repo.new(dir) }
  end

  private
  def self.scan(dir = ENV['HOME'])
    Dir.glob( File.join(dir,'/**/.git') )
  end

end
