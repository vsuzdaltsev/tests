arr = ["role[base]", "recipe[monitoring::default]", "role[telegraf]"]

def elements(arr, pattern)
  arr.select do |e|
    e[pattern]
  end.map { |e| e.sub(pattern, '').delete('[]') }.sort
end

def recipes(arr)
  { 'recipes' => elements(arr, 'role') }
end

def roles(arr)
  { 'roles' => elements(arr, 'recipe') }
end

p h = {}.merge(recipes(arr)).merge(roles(arr))
