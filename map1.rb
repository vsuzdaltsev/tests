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

def format_elem(elem)
  "#{elem[:id]}/vm/none"
end

p select arr
