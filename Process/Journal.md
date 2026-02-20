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

## 01.22.25 | Thoughts on Aesthetics

In the end, [Saito's _Everyday Aesthetics_](https://github.com/mouseandthebillionaire/planetVelocityMap/blob/main/Texts.md#saito-y-everyday-aesthetics-2007) seeks to create some new rules around aesthetic evaluation of objects, particularly (obviously) those in everyday life. Thus, things like, green values, ambience, and moral values become important. While not directly helpful to contemplative play aesthetics, it does provide an example for how to move forward. Is there a way to establish some properties of contemplative play aesthetics? And maybe this is not the way of thinking about it for the final paper, but a way to start laying down the ideas. If we take the four categories of player, plaything, playspace, and playtime, is there a particular aesthetic value that can be used there? In the proposal I am using the lenses themselves as the aesthetic, but I think it makes more sense to think about how those lenses engender specific 'attitudes' or 'properties' (read: aesthetics) For instance, I'm already thinking "player" is a great space to talk about [Nguyen's concept of _agency_]. So we get a contemplative/play aesthetic of agency, which feels good? There are contemplative experiences that can happen where you have no agency (film, painting, literature), but play is unique in that regard? What then might the other three be? Plaything = interaction? Playspace = imagination? Playtime = ... time? I should maybe first try and cull together some essential aspects of the contemplative stance, and see what might apply to play. At the very least, an organizing principal while I write and make these things.

Also, I'm on to a quick readthrough of [The Aesthetics of Everyday Life](https://cup.columbia.edu/book/the-aesthetics-of-everyday-life/9780231135023/) to see if anything else jumps out at me.

## 02.02.25 | What do I Mean by Contemplation?

After reading [Navarro-Remesal's _Zen and Slow Games_](https://mitpress.mit.edu/9780262553568/zen-and-slow-games/) and discussing my thoughts about it with PJB, the need to define my terms becomes obvious. What indeed do I mean by "contemplative play?" Or contemplation at all for that matter. Navarro-Remesal even states that "We might call them reflective games, or perhaps ­people would settle on contemplative games," (178) but I don't quite think we mean the same thing[^4]. I don't think that his insistence on "slow" is necessary for contemplation. Today I began rereading [Han's _Vita Contemplativa_](Texts.md/## Han, B. _Vita Contemplativa_, 2023), hoping to cement what I mean by this in light of his definition. Clearly even here it is easy to focus on the ideas of slowness (his use of inactivity feels particularly damning), and a hasty search for [external reviews](https://c-scp.org/2025/09/05/byung-chul-han-vita-contemplativa-in-praise-of-inactivity) shows this to be true, but I think there's more here. His use of inactivity does not require stillness, meditation, slowness, etc. There can still be movement. Output. Art. An action without action. Again this idea of "ceremonious inactivity" where "we do something but to no end." (5) Through the first chapter he references ceremonious inactivities such as:

* A luxury train ride (5)
* The Flâneur (in opposition to the speedy commuter) (5)
* Play - "hands, when liberated from the 'in-order-to', no longer _grasp_. They _play_." (6)
* Festivals - "Festivals are free from the needs of mere life. Eating becomes contemplative: 'Eating, in this respect, is not a _melachah_, an activity directed toward an aim, but an inoperativity and _menuchah_, a Sabbath of nourishment.'" (7)
* Sleep (10)
* Boredom (10)
* Waiting (11)
* Not-knowing (12)
* Poetry - "Information is the _active form of language_. Poetry, by contrast, suspends language as information. In poetry, language enters the mode of contemplation. It becomes inactive." (19)

When you look at all this it is really easy to make the argument that 'slowness' is the goal here, but I think that misses the point. Slowness _can_ be a part of contemplation (and often is, especially as an antidote to our fast-paced life), but the real need is for "uselessness."

_"Those who are creatively active differ from those who are usefully active to the extent that their doing is _for nothing. It is the _proportion of inactivity in their activity_ that makes possible the emergence of something _altogether different_, something that has never _been there before_." (17-18)_

Han is saying that contemplation is something that stands outside of normal life. It is anti-consumerist. It is anti-productivity. Navarro-Remesal does highlight this in his chapter on Zen where he argues that the McMindfulness bent of many products gets it all wrong in just this way: by making commercial that which should never be. So art, poetry, and play, can be contemplative experiences because they take us out of that normal "compulsion of production." (19) 

What becomes interesting, then, is the way that games in particular _put that productivity back in!_ Leader boards, timers, goals, speed-runs. All these things are productivity sneaking back into our leisure time. Crossword puzzles should be a leisure activity, but every week I do the NYT Monday puzzle at a breakneck speed in a quest to beat my previous time. I think this is why the idea of a contemplative _play_ is more exciting. In play (especially of the DeKoven flavor) we are removed from the moment, we are doing something entirely free from purpose. The soundwalker (as for the flâneur) is walking without purpose. Playful objects (like [Niedderer's Performative Objects](http://www.mitpressjournals.org/doi/pdf/10.1162/desi.2007.23.1.3), [Carelman's _Catalogue d'Objects Introuvables](https://www.are.na/block/38386431)_, and even [Dick Moby](https://mouseandthebillionaire.com/dickMoby/)) are objects divorced from their purposes. Can we argue that contemplative architecture subverts the goal of a space to quickly and easily move people through it? Or at least, that the _goal_ is not for productivity? 

_"We owe true happiness to the useless and purposeless, to what is intentionally convoluted, what is unproductive, and direct, exuberant, superfluous, to beautiful forms and gestures that have no use and serve no purpose."_ (5)

I will continue to ponder this.


## 02.20.26 | Mappings First Pass

Thinking through what "mechanics for contemplation," might be coming out of these four 'areas.' This is based on both ideas from the readings, and the foci of the projects thus far.

* Players (Attunement) - Designers can invite attunement. Through their agency (Nguyen) the players can enact a more attuned stance, shifting their focus from mastery/conquest to receptive, sustained, relational attention (Oliveros/Cardiff).

* Playthings (Enstrangement) - Designers can make the object/interface more 'enstranged' (Shlovsky). These objects resist automatic use. They resist flow. Perception is re-awakened through friction (Khaled).  

* Playgrounds (Allusivity) - Designers can create more 'allusive' (Seerveld) playspaces/magic circles (Huizinga, if we must). These spaces suggest rather than declare - with atmospheric cues, symbolic textures, and indirect meaning (as in contemplative Architecture).  

* Playtime (Ritualization) - Designers can ritualize time, focusing on depth rather than productive clock-time (Han). Relying on foreground/background-shifting (Eno) as well as repetition, returning, and ceremonious intervals (Vesper5/Ritual of the Moon).  



---
## Notes: 

[^1]: Already the section on "Time" feels less defensible as being tied to Ambient Media, but it's also probable that I'm just too tired to give it the attention it deserves. Don't abandon it yet!

[^2]: MacTex is 6gb which seems ridiculously big for what I'm using it for, but...

[^3]: Note that the citation plugin uses your vault as its root location, but as you can see above, the PanDoc plugin uses it's _own_ location as its root - that one took a while to figure out...

[^4]: More to come with this when I reread the book for the Related Texts section
