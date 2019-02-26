arr = [
  { primary: true,  id: 1 },
  { primary: false, id: 2 },
  { primary: false, id: 3 }
]

def select(arr)
  arr.map do |elem|
    format_elem(elem) unless elem[:primary]
  end.compact
end

def normalize(arr)
  arr.each_with_object({}) do |elem, memo|
    memo.merge!(elem)
  end
end

def format_elem(elem)
  { elem[:id] => { primary: elem[:primary] } }
end

p normalize(select(arr))
