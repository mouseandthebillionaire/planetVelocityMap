-- hide-double-percent.lua
function remove_comments(inlines)
  local result = {}
  local inside = false
  for _, elem in ipairs(inlines) do
    if elem.t == "Str" and elem.text:find("%%") then
      -- toggle inside/outside comment
      inside = not inside
    elseif not inside then
      table.insert(result, elem)
    end
    -- if inside, skip this element
  end
  return result
end

function Para(elem)
  elem.content = remove_comments(elem.content)
  return elem
end
