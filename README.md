# The Perplexing Puzzles of UNDOT

**An Interactive Fiction Backdrop for a Mafia Game**

**Created by CirclMastr, Ported to Inform by TwelveBaud**


During [a Mafia game](https://forums.somethingawful.com/showthread.php?threadid=4062609) on Something Awful, the game moderator CirclMastr created a text adventure game as a framing device, inviting his players to explore the Un-Named Dungeon or Tower, with each Mafia "day" lasting a single puzzle. CirclMastr moderated the text adventure himself, but that requires involving him in every step of every playthrough, and can lead to inconsistencies.

[Inform 7](https://ganelson.github.io/inform-website/) is a programming language for text adventures and other similar kinds of interactive fiction. Although it does not understand the full expressivity of English, it has been designed from first principles to follow a natural language model, and as a result the source code it accepts tracks very closely with typical English sentences, making it much easier to understand and express complicated relationships.

I've taken CirclMastr's game world, as he's expressed it to his players, and ported it to Inform 7 to allow replayability and hypothesizing alternatives.

If you would like to play it, you can use the `gblorb` file in the Releases section with most modern interactive fiction programs:

* [Gargoyle](https://github.com/garglk/garglk/releases) (Windows, Mac, and Linux)
* [Spatterlight](https://github.com/angstsmurf/spatterlight/releases) (Mac)
* [Glulxe](https://www.ifarchive.org/indexes/if-archive/programming/glulx/interpreters/glulxe/) (Windows, Mac, DOS, Classic Mac, Solaris, Amiga, ...)
* [Fabularium](https://www.ifwiki.org/Fabularium) (Android)
* [iFrotz](https://apps.apple.com/us/app/frotz/id287653015) (iOS)

If you don't already have an interactive fiction program you enjoy using, you can also use [Parchment](https://github.com/curiousdannii/parchment) and [play now](https://iplayif.com/?story=https://github.com/twelvebaud/if-mafia/releases/latest/download/UNDOT.gblorb), right here in your browser. You may want to reference [the actions of the thread](https://github.com/twelvebaud/if-mafia/releases/latest/download/solution-thread.txt) or [a speedrun](https://github.com/twelvebaud/if-mafia/releases/latest/download/solution-speedrun.txt), but they do spoil things quite a bit.

If you want to expand the story, fix any mistakes or inconsistencies(probably my fault), or just see how things are made, the main story file is [here](https://github.com/twelvebaud/if-mafia/blob/main/Interactive%20Fiction%20Mafia.inform/Source/story.ni).

I'll leave you with the description of the very last item in the game:

> Congratulations! You have worked together to achieve the first victory of - hopefully - many, paving the way for a new rise in Interactive Fiction with the addition of multiplayer! Your help has been instrumental in making this game a real product, and I couldn't have done it without you! I'd also like to take this opportunity to thank:
>
> * Steve 'Jaspor' Orr and Bill Putrino, for writing the puzzles adapted here.
> * Bill Putrino, Christian Petermann, AeronDrake, and QalarValar for maps and images.
> * TwelveBaud, for writing and coding.
> * AFancyQuestionMark, Hal Incandenza, kaschei, Maerlyn, My Second Re-Reg, Opoponax, Tea Party Crasher, Your Personal Muse, and yuming, for being the first beta testers of this game.
>
> Now go forth, and engage in jolly co-operation!