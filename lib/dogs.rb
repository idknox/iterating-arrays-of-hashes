class Dogs
  POOR = (0..5).to_a.sample
  AVERAGE = (6..10).to_a.sample
  EXCELLENT = (11..15).to_a.sample

  def initialize
    joe = {
        :name => {:first => "Joe", :last => "Smith"},
        :owner_quality => EXCELLENT
    }
    sarah = {
        :name => {:first => "Sarah", :last => "Darnum"},
        :owner_quality => AVERAGE
    }
    andrew = {
        :name => {:first => "Andrew", :last => "Beter"},
        :owner_quality => AVERAGE
    }

    @dogs = [
        {name: "Fido", size: :large, owner: joe},
        {name: "Yapper", size: :small, owner: joe},
        {name: "Bruiser", size: :large, owner: joe},
        {name: "Tank", size: :huge, owner: sarah},
        {name: "Beast", size: :large, owner: sarah},
        {name: "Harleigh", size: :medium, owner: andrew},
        {name: "Trixie", size: :small, owner: andrew}
    ]
  end

  attr_accessor :dogs

  def small_dogs
    output=[]
    @dogs.each do |dog|
      if dog[:size] == :small
        output.push(dog)
      end
    end
    output
  end

  def huge_dog
    output=[]
    @dogs.each do |dog|
      if dog[:size] == :huge
        output.push(dog)
      end
    end
    output[0]
  end

  def large_dog_names
    output = []
    @dogs.each do |dog|
      if dog[:size] == :large
        output.push(dog[:name])
      end
    end
    output
  end

  def joes_large_dogs
    output = []
    @dogs.each do |dog|
      if dog[:size] == :large && dog[:owner][:name][:first] == "Joe"
        output.push(dog[:name])
      end
    end
    output
  end

  def sizes
    output = []
    @dogs.each do |dog|
      if !output.include?(dog[:size])
        output.push(dog[:size])
      end
    end
    output.sort.reverse
  end

  def owners
    output = []
    @dogs.each do |dog|
      if !output.include?("#{dog[:owner][:name][:first]} #{dog[:owner][:name][:last]}")
        output.push("#{dog[:owner][:name][:first]} #{dog[:owner][:name][:last]}")
      end
    end
    output.sort.reverse
  end

  def average_owners
    output = []
    @dogs.each do |dog|
      if dog[:owner][:owner_quality] == AVERAGE && !output.include?("#{dog[:owner][:name][:first]} #{dog[:owner][:name][:last]}")
        output.push("#{dog[:owner][:name][:first]} #{dog[:owner][:name][:last]}")
      end
    end
    output
  end

  def to_s
    output={}
    @dogs.each do |dog|
      owner_name = (dog[:owner][:name][:first])
      if !output.has_key?(owner_name)
        output[owner_name]=[]
      end
      (output[owner_name]).push(dog[:name])
    end

    out_string=''
    output.each do |key, value|
      if value.length >= 3
        out_string += "#{key} owns: #{(value[0...-1]).join(", ")}, and #{(value[-1])}"
      else
        out_string += "\n#{key} owns: #{(value[0...-1]).join(", ")} and #{(value[-1])}"
      end
    end
    return out_string
  end


  def find_by_owner (name)
    output={}
    @dogs.each do |dog|
      # owner_first = (dog[:owner][:name][:first])
      # owner_last = (dog[:owner][:name][:last])
      if (name == (dog[:owner][:name][:first])) || (name == (dog[:owner][:name][:last]))
        output[name]=[]
        (output[name]).push(dog[:name])
      end
  print output[name]
    end
  end

end
