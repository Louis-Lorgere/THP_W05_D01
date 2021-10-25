class Gossip

  attr_accessor :author , :content 

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = [] #on initialise un array vide
  
    # va chercher chacune des lignes du csv do
      # crée un gossip avec les infos de la ligne
      # all_gossips << gossip qui vient d'être créé
    # end
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips #on retourne un array rempli d'objets Gossip
  end

  def self.find index_value
    return Gossip.all[index_value]
  end

  def self.update (author, content, index_value)
    rows_array = CSV.read("./db/gossip.csv")
    rows_array.each_with_index do |row, index|
      if index == index_value.to_i
        row[0] = author
        row[1] = content
      end
    end
    CSV.open('./db/gossip.csv', 'wb') { |csv| rows_array.each{|row| csv << row}}
    return
  end

end