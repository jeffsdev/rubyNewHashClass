require('rspec')
require('./lib/EHash')

describe(EHash) do
  describe("#Fetch") do
    it("retrieves a stored value by its key") do
      test_hash = EHash.new()
      test_hash.store("kitten", "cute")
      expect(test_hash.fetch("kitten")).to(eq("cute"))
    end
  end

  describe("#has_key") do
    it("checks hash for key") do
      test_hash = EHash.new()
      test_hash.store("kitten", "cute")
      expect(test_hash.has_key?("kitten")).to(eq(true))
    end
  end

  describe("#has_value") do
    it("checks hash for value") do
      test_hash = EHash.new()
      test_hash.store("kitten", "cute")
      expect(test_hash.has_value?("cute")).to(eq(true))
    end
  end

  describe("#length") do
    it("checks hash for it's length") do
      test_hash = EHash.new()
      test_hash.store("kitten", "cute")
      expect(test_hash.length()).to(eq(1))
    end
  end

  describe("#merge") do
    it("merge two EHash groups and return result") do
      test_hash = EHash.new()
      test_hash.store("kitten", "cute")
      second_test_hash = EHash.new( )
      second_test_hash.store("dog", "fat")
      merged = test_hash.merge(second_test_hash)
      expect(merged.length).to(eq(2))
    end
  end
end
