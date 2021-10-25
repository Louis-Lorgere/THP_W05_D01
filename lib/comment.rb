class Comment
  attr_accessor :author , :content , :id_gossip
  def initialize(author, content, id_gossip)
    @author = author
    @content = content
    @id_gossip = id_gossip
  end

  def save
    CSV.open("./db/comment#{@id_gossip}.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end
  
  def self.all(id)
    all_comments = [] #on initialise un array vide
  
    # va chercher chacune des lignes du csv do
      # crée un gossip avec les infos de la ligne
      # all_gossips << gossip qui vient d'être créé
    # end
    CSV.open("./db/comment#{id}.csv", "ab")
    CSV.read("./db/comment#{id}.csv").each do |csv_line|
      all_comments << Comment.new(csv_line[0], csv_line[1], id)
    end
    
    return all_comments #on retourne un array rempli d'objets Gossip
  end
end