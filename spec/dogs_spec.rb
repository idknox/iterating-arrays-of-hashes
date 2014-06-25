require 'rspec'
require 'dogs'

describe Dogs do
  let(:dogs) { Dogs.new }

  describe "#small_dogs" do
    it "returns all of the small dogs" do
      small_dogs = dogs.small_dogs
      expect(small_dogs.length).to eq(2)
      expect(small_dogs.first).to include(name: "Yapper")
      expect(small_dogs.last).to include(name: "Trixie")
    end
  end

  describe "#huge_dog" do
    it "returns the huge dog" do
      expect(dogs.huge_dog).to include(name: 'Tank')
    end
  end

  describe "#large_dogs_names" do
    it "returns all of the big dogs" do
      expect(dogs.large_dog_names).to match_array(["Fido", "Bruiser", "Beast"])
    end
  end


  describe "#joes_large_dogs" do
    it "returns only joes large dogs" do
      expect(dogs.joes_large_dogs).to match_array(["Fido", "Bruiser"])
    end
  end

  describe "#sizes" do
    it "returns all dog sizes" do
      expect(dogs.sizes).to match_array([:small, :medium, :large, :huge])
    end
  end

  describe "#owners" do
    it "returns all of the owners" do
      expect(dogs.owners).to match_array(['Joe Smith', 'Sarah Darnum', 'Andrew Beter'])
    end
  end

  describe "#average_owners" do
    it "returns all average owners" do
      expect(dogs.average_owners).to match_array(['Sarah Darnum', 'Andrew Beter'])
    end
  end

  describe "#to_s" do
    it "returns all owners and their dogs" do
      expect(dogs.to_s).to eq("Joe owns: Fido, Yapper, and Bruiser\nSarah owns: Tank and Beast\nAndrew owns: Harleigh and Trixie")
    end
  end

  describe "#find_by_owner" do
    it "finds a dog by owner's first name" do
      joes_dogs = dogs.find_by_owner("Joe")
      expect(joes_dogs.length).to eq(3)
      expect(joes_dogs.first).to include(name: "Fido")
      expect(joes_dogs[1]).to include(name: "Yapper")
      expect(joes_dogs[2]).to include(name: "Bruiser")
    end

    it "finds a dog by owner's last name" do
      darnums_dogs = dogs.find_by_owner("Darnum")
      expect(darnums_dogs.length).to eq(2)
      expect(darnums_dogs.first).to include(name: "Tank")
      expect(darnums_dogs.last).to include(name: "Beast")
    end

    it "finds a dog by owner's full name" do
      andrews_dogs = dogs.find_by_owner("Andrew Beter")
      expect(andrews_dogs.length).to eq(2)
      expect(andrews_dogs.first).to include(name: "Harleigh")
      expect(andrews_dogs.last).to include(name: "Trixie")
    end

    it "returns nothing if no owner is found" do
      expect(dogs.find_by_owner("Some Name")).to eq([])
    end
  end

  describe "#change_owner" do
    it "changes an owner based on first name" do
      joe_to_sarah = dogs.change_owner("Fido", "Sarah")
      # joes = dogs.joes_large_dogs
      expect(joe_to_sarah.length).to eq(3)
      expect(joe_to_sarah[0]).to include(name: "Fido")
      expect(joe_to_sarah[-1]).to include(name: "Beast")
      # expect (joes).not_to include("Fido")
    end

    it "changes the owner based on last name" do
      joe_to_andrew = dogs.change_owner("Bruiser", "Beter")
      expect(joe_to_andrew.length).to eq(3)
      expect(joe_to_andrew[0]).to include(name: "Bruiser")
      expect(joe_to_andrew[-1]).to include(name: "Trixie")
    end

    it "changes the owner based on a full name" do
      andrew_to_joe = dogs.change_owner("Harleigh", "Joe Smith")
      expect(andrew_to_joe.length).to eq(4)
      expect(andrew_to_joe[3]).to include(name: "Harleigh")
      expect(andrew_to_joe[1]).to include(name: "Yapper")
    end

    it "doesn't change the owner if no owner is found" do
      expect(dogs.change_owner("Fido", "Some Name")).to eq([])
    end
  end

  describe "#change_dog_name" do
    it "changes dog's name" do
      fido = dogs.change_name("Fido", "Petie")
      expect(fido[0]).to include(name: "Petie")
    end
  end
end
