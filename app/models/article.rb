class Article < ActiveRecord::Base
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings


  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end

  def tag_list=(tags_string)
    #limpa os campos de tag para deixa-los em forma de vetor
    tag_names = tags_string.split(',').collect{|x| x.strip.downcase}.uniq
    #verifica que tags ja estão no banco
    new_or_found_tags = tag_names.collect{|name| Tag.find_or_create_by(name: name)}
    #retorna todas as tags, criadas ou ja existentes.
    self.tags = new_or_found_tags
  end

end
