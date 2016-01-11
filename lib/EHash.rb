class EHash
  define_method(:initialize) do
    @Keys = Array.new( )
    @Values = Array.new( )
  end

  define_method(:store) do |key, value|
    @Keys.push(key)
    @Values.push(value)
  end

  define_method(:fetch) do |key|
    @Keys.each do |found_key|
      if found_key == key
        return @Values[ @Keys.index(found_key) ]
      end
    end
  end

  define_method(:has_key?) do |key|
    return @Keys.include?(key)
  end

  define_method(:has_value?) do |value|
    return @Values.include?(value)
  end

end
