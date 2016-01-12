class EHash
  define_method(:initialize) do
    @Keys = Array.new( )
    @Values = Array.new( )
  end

  define_method(:store) do |key, value|
    return if key.class == NilClass || value.class == NilClass 
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

  define_method(:is_equal?) do |hash|
    for i in 0..@Keys.length
      key_value = hash.get_key_value_by_index( i )
      if @Keys[ i ] != key_value[ 0 ] || @Values[ i ] != key_value[ 1 ]
        return false
      end
    end
    return true
  end

  define_method(:get_key_value_by_index) do |index|
    key_value = Array.new( )
    for i in 0..@Keys.length
      if i == index
        key_value.push( @Keys[ i ] )
        key_value.push( @Values[ i ] )
        return key_value
      end
    end
  end

  define_method(:has_key?) do |key|
    return @Keys.include?(key)
  end

  define_method(:has_value?) do |value|
    return @Values.include?(value)
  end

  define_method(:length) do
    return @Keys.length
  end

  define_method(:merge) do |hash|
    merged_hash = EHash.new()

    for j in 0..hash.length
      first_key_value = hash.get_key_value_by_index( j )
      merged_hash.store( first_key_value[ 0 ], first_key_value[ 1 ] )
    end

    for i in 0..@Keys.length
      second_key_value = get_key_value_by_index( i )
      merged_hash.store( second_key_value[ 0 ], second_key_value[ 1 ] )
    end

    return merged_hash
  end
end
