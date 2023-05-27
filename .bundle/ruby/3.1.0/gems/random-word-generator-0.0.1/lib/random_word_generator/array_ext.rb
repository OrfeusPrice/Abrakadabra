class Array

  def randomize
    arr = self.dup
    arr.collect { arr.slice!(rand(arr.length)) }
  end

  def randomize!
    arr = self.dup
    result = arr.collect { arr.slice!(rand(arr.length)) }
    self.replace result
  end

end