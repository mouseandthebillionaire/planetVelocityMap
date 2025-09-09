# Process Journal

## 03.26.25 | State of the State

Big breath.

Interesting to have a lot of this documented in the [Conversations](Conversations.md) document with nothing here yet. Though as per the GaR discussion of [hierarchies of practice](https://pippinbarr.com/SNAKISTS/process/journal.html#hierarchies-of-design-practice) there is something to be said for separating out these various modalities. [On the other hand](https://youtu.be/TcnBfSuqfAw?si=bHutCFGEo56JKiGr&t=97) there is also something nice about having all of the thoughts laid down in front of you chronologically. Something to be reflecting on as I work through this, especially when we start separating out the "thesis writing" work from "designing playful experience" work. For now, I will keep this space for reflective, big-picture, weekly entries about the overall process, with a goal for posting something here every Wednesday before the weekly meeting on Friday.

On the structural side (and in response to the [Etherpad suggestion](Conversations.md##-PB:-2025.03.24-(Email))) I am currently experimenting with getting an instance of that running on my server and seeing what kind of version control we have access to. I am also experimenting with various plugins in Obsidian (since I had been writing there anyway) to see about tracking comments there.

On the writing side, fleshed out the chapter breakdowns to start laying out the language (and thinking) behind what each of these is trying to say/be/do. None of them are quite there, but it's a good exercise to getting words out there and see what sticks[^1].

## 07.26.25 | Texts

Just a quick note to mention that I have created a place for jottings/musings/reflectings on the texts that I am looking at throughout this process, which can all be found [here](Texts.md). I rather enjoyed how that worked during the [comprehensive exams](https://github.com/mouseandthebillionaire/RAGE) and want to continue leveraging MDM/github for a place of meaningful engagement with the material. It should also be noted that proactively writing down the quotes helped _immensely_ once it came time to the final writing part, and that is definitely part of the decision to include that here. Still a small internal debate on whether I will call this 'texts' or 'related work' like I did during the comprehensive exams, which _might_ change the way that I approach the material but might not be consequential?

A second note that I have turned on the dictation feature on my desktop in order to get some of these musings down a little easier. This also helps a lot in dictating the quotes that I find in the texts, and in general I think it's going to be very convenient to to have this running in that way.

Side note: Four months and only my second process journal? Not great! Definitely a lot of thinking happening in other channels (Proposal, Conversations, IRL) but need to get more of the thoughts down here. 

## 08.18.25 | Obsidian Export Misc

Warning: boring. During these proposal edits I have also been working through how to export my markdown file to a pdf. My goals were to:

* figure out a way to do comments (preferably like Google docs)
* make it easier to add in references
* export to a pdf

Lots of fiddly things here and there, so I thought I'd use this as an opportunity to jot down the whole process (as much for myself as others)

* Jasper Surmont's [Comments](https://github.com/jaspersurmont/obsidian-comments) and ycnmhd's [Enhanced Annotations](https://github.com/ycnmhd/obsidian-enhanced-annotations) plugins do a pretty good job of immitating the google doc comment functionality. Comments are inline, but show up in the side bar so that you can more quickly glance through them. They also show up as a unique color which is convenient.
* Jon Gauthier's [Citation](https://github.com/hans/obsidian-citation-plugin) plugin is a great way to integrate a Zotero library. You need to install [Better BibTex](https://retorque.re/zotero-better-bibtex/) for Zotero, but once that is done it's _fairly_ straight-forward.
* Final exporting ended up being a little more annoying than I thought it would be. Obsidian's built-in export to pdf hides the comments, but doesn't swap in the citation tags for the correct citation form. To get that to work I needed to install Oliver Balfour's [PanDoc](https://github.com/OliverBalfour/obsidian-pandoc) plugin (which swaps the citation codes for the actual citations). Then I needed to install both PanDoc itself, [MacTex](https://tug.org/mactex/mactex-download.html)[^2] (to get pdf export), and download the appropriate [Chicago citation style](https://github.com/citation-style-language/styles/blob/master/chicago-author-date-17th-edition.csl). Finally I had to a) point the pandoc plugin to the library and the citation-style, and b) add some lua scripting to hide the comments. If anyone else is having an issue with this, here was my solution:

PanDoc Arguments[^3]:
```
--citeproc 
--bibliography ../References/references.bib 
--csl ../References/chicago-author-date-17th-edition.csl 
--lua-filter=../References/convert-comments.lua
```

Lua Convert-Comments:
```
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
```

Like I said, a little fiddly, but it's all working well now and will be nice to have this in working order as I move forward.

Also (this was added on 09.04) just as a note for myself
- shift+command+c is the citation hotkey
- shift+command+p is the print to pdf hotkey

## Notes: 

[^1]: Already the section on "Time" feels less defensible as being tied to Ambient Media, but it's also probable that I'm just too tired to give it the attention it deserves. Don't abandon it yet!

[^2]: MacTex is 6gb which seems ridiculously big for what I'm using it for, but...

[^3]: Note that the citation plugin uses your vault as its root location, but as you can see above, the PanDoc plugin uses it's _own_ location as its root - that one took a while to figure out...


