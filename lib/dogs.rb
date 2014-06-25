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

  def small_dogs
    @dogs.select {|dog| dog[:size] == :small}
  end

  def huge_dog
    (@dogs.select {|dog| dog[:size] == :huge})[0]
  end

  def large_dog_names
    large = @dogs.select {|dog| dog[:size] == :large}
    large.map {|dog| dog[:name]}
  end

  def joes_large_dogs
    joes = @dogs.select do |dog|
      (dog[:size] == :large) && (dog[:owner][:name][:first] == "Joe")
    end
    joes.map {|dog| dog[:name]}
  end

  def sizes
    @dogs.map {|dog| dog[:size]}.uniq
  end

  def owners
    (@dogs.map do |dog|
      "#{dog[:owner][:name][:first]} #{dog[:owner][:name][:last]}"
    end).uniq
  end

  def average_owners
    avg = @dogs.select {|dog| dog[:owner][:owner_quality] == AVERAGE}
    (avg.map do |dog|
      "#{dog[:owner][:name][:first]} #{dog[:owner][:name][:last]}"
    end).uniq
  end

  def to_s
    owners = @dogs.group_by {|dog| dog[:owner]}
    output = (owners.map do |owner, dog|
                dogs = dog.map {|d| d[:name]}
                if dogs.length > 2
                  "#{owner[:name][:first]} owns: #{(dogs[0...-1]).join(", ")}" + ", and #{dogs[-1]}"
                else
                  "#{owner[:name][:first]} owns: #{dogs.join(" and ")}"
                end
              end)
    output.join("\n")
  end

  def find_by_owner(input)
    @dogs.select do |dog|
      (dog[:owner][:name][:first] == input) ||
        (dog[:owner][:name][:last] == input) ||
        ("#{dog[:owner][:name][:first]} #{dog[:owner][:name][:last]}" == input)
    end
  end

  def change_owner(dog_name, name)
    # find entry where dog's name is equal to
    # par, change owner for this entry to the owner whose name
    # matches par

    owner = @dogs.select do |dog|
              (dog[:owner][:name][:first] == name) ||
              (dog[:owner][:name][:last] == name) ||
              ("#{dog[:owner][:name][:first]} #{dog[:owner][:name][:last]}" == name)
    end
    if owner != []
      @dogs.each do |dog|
        if dog[:name] == dog_name
          dog[:owner] = (owner[0])[:owner]
        end
      end
      @dogs.select do |dog|
        (dog[:owner][:name][:first] == name) ||
        (dog[:owner][:name][:last] == name)  ||
        ("#{dog[:owner][:name][:first]} #{dog[:owner][:name][:last]}" == name)
        end
    else
      owner
    end
  end

  def change_name(old, new)
    @dogs.each do |dog|
      if dog[:name] == old
        dog[:name] = new
      end
    end
    @dogs.select {|dog| dog[:name] == new}
  end

end
