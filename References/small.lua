-- small.lua — make [text]{.small} actually small in LaTeX/HTML/DOCX.

function Span(el)
  if not el.classes:includes("small") then
    return nil
  end

  if FORMAT:match("latex") then
    -- Wrap ONLY the contents so it’s grouped in \small
    return {
      pandoc.RawInline("latex", "{\\small "),
      table.unpack(el.content),
      pandoc.RawInline("latex", "}")
    }

  elseif FORMAT:match("docx") then
    -- Map to a DOCX character style named "Small"
    el.attributes["custom-style"] = "Small"
    return el

  else
    -- HTML/EPUB/etc: keep the class so CSS can style it
    -- (Obsidian preview and regular HTML will use .small CSS)
    el.classes:insert("small")
    return el
  end
end
