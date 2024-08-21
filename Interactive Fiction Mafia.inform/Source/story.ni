"The Perplexing Puzzles of UNDOT" by CirclMastr

The story headline is "An Interactive Fiction Backdrop for a Mafia Game"

Use scoring. The maximum score is 10. Use no deprecated features. Index map with grid-size set to 54 and room-size set to 54. Index map with EPS file. Release along with the source text, a solution, and the "Parchment" interpreter.

Part I - Introductory Matters

Chapter F - Frustration

The frustration is a number that varies. Frustration pending is a truth state that varies.
To get angrier:
	increase the frustration by 1;
	now frustration pending is true;
	if there is a Description corresponding to a Frustration of the frustration in the Table of Frustrations:
		do nothing;
	otherwise:
		say "Your blood pressure soars, causing a small vessel in your brain to rupture. You sink into coma and die without pain.";
		end the story.
		
A turn sequence rule (this is the notify frustration changes rule):
	if frustration pending is true:
		say "[bold type][bracket]Your blood pressure just went up![close bracket][roman type][paragraph break]";
		now frustration pending is false.
The notify frustration changes rule is listed after the notify score changes rule in the turn sequence rulebook.

Table of Frustrations
Frustration	Description
0	--
1	"Annoyed"
2	"Irritated"
3	"Frustrated"
4	"Exasperated"
5	"Angry"
6	"Enraged"
7	"Livid"
8	"Apoplectic"

Chapter M - Changes to the Standard Rules

To say passing mention of (macguffin - a thing):
	now the macguffin is mentioned.
	
A thing can be discussed. A thing is usually not discussed. A carry out examining rule when the noun is a thing (this is the once mentioned is forever mentioned rule): now the noun is discussed.

Before listing nondescript items (this is the damn it CirclMaster rule):
	repeat with item running through things in the location:
		if the item is not handled, now the item is not marked for listing.

The print empty inventory rule response (A) is "Your pockets are like your mindscape: vast but empty.".
The parser error internal rule response (N) is "Sorry, I don't know how to [word number 1 in the player's command].".

Rule for printing the description of a dark room: say "It is pitch black. You are likely to be eaten by a grue.".

Table of Rankings
Score	Rank
0	"Newbie"
1	"Beginner"
2	"Rookie"
3	"Novice"
4	"Amateur"
5	"Greenhorn"
6	"Neophyte"
7	"Trainee"
8	"Postulant"
9	"Apprentice"
10	"Novitiate"

Instead of examining yourself: try requesting the score; try taking inventory.

The announce the score rule is not listed in the carry out requesting the score rulebook.

The announce the score rule response (A) is "You currently have [score] points, out of a possible [maximum score] points[if the printing the player's obituary activity is not going on].[end if]".
The announce the score rule response (D) is "Your score has gone up!".
The announce the score rule response (E) is "Your score has gone down!".

A carry out requesting the score rule (this is the announce the ranking rule): say "You are [if the score is 4 or the score is 9]an[otherwise]a[end if] [Rank corresponding to a Score of the score in the Table of Rankings].".
A carry out requesting the score rule (this is the announce frustration rule): if the frustration is greater than zero, say "You currently are [Description corresponding to a Frustration of the frustration in the Table of Frustrations]."
A carry out requesting the score rule (this is the curtailed announce the score rule): say "You currently have [score] points, out of a possible [maximum score] points."

Understand "xyzzy" as a mistake ("Do not cite the deep magic to me, I was there when it was written!").

Shouting is an action applying to nothing. Understand "shout" as shouting. Instead of shouting, try answering yourself that "nothing".
Instead of answering, say "Your cry out to the heavens for succor, but receive no answer.[paragraph break](Hint: If you're stuck, try to [bold type]think about[roman type] your problem!)"

Understand "break [text]" as a mistake ("You won't get anywhere by breaking things![paragraph break](Hint: If you're stuck, try to [bold type]think about[roman type] your problem!)").

Understand "wake up" as a mistake ("I don't see an up here. [bracket]Ed. note - insert an easter egg ending for this[close bracket]").

Understand "hunt [text]" as a mistake ("The ethical discussion around hunting and conservationism aside, you don't have a hunting permit.").

Understand "dance [text]" or "dance" as a mistake ("You dance like nobody's watching, because no one is.").

Knocking is an action applying to one thing. Understand "knock on [something]" as knocking. To knock is a verb.

Check knocking: 
	if the noun is not a door: 
		say "That's not a door!" instead. 

Report knocking: say "[We] [knock] on [the noun], but there is no answer."

Understand the command "place" as "put".

To try is a verb.

This is the brief examine containers rule:
	if the noun is a container:
		if the noun is open or the noun is transparent:
			let V be the list of described unmentioned not concealed not scenery things in the noun;
			let C be the list of described concealed not scenery things in the noun;
			add the list of mentioned things on the noun to C;
			remove the player from V, if present;
			remove the player from C, if present;
			if the number of entries in V is not 0:
				say "[if the number of entries in C is not 0]Also in[otherwise]In[end if] [the noun] " (A);
				list the contents of the noun, as a sentence, tersely, not listing
					concealed items, prefacing with is/are;
				say ".";
				now examine text printed is true;
			otherwise if examine text printed is false:
				if the player is in the noun:
					make no decision;
				say "[The noun] [are] empty." (B);
				now examine text printed is true.
The brief examine containers rule is listed instead of the examine containers rule in the carry out examining rulebook.

This is the brief examine supporters rule:
	if the noun is a supporter:
		let V be the list of described unmentioned not concealed not scenery things on the noun;
		let C be the list of described concealed not scenery things on the noun;
		add the list of mentioned things on the noun to C;
		remove the player from V, if present;
		remove the player from C, if present;
		if the number of entries in V is not 0:
			say "[if the number of entries in C is not 0]Also on[otherwise]On[end if] [the noun] " (A);
			list the contents of the noun, as a sentence, tersely, not listing
				concealed items, prefacing with is/are, including contents,
				giving brief inventory information;
			say ".";
			now examine text printed is true.
The brief examine supporters rule is listed instead of the examine supporters rule in the carry out examining rulebook.

[From Writing With Inform, section 18.28: "Here's how to abolish what may be the most contentious rule in the whole Standard Rules:"]
The describe what's on scenery supporters in room descriptions rule is not listed in any rulebook.
The describe what's on mentioned supporters in room descriptions rule is not listed in any rulebook.

Instead of searching something: try examining the noun.

Requesting the list of exits is an action out of world. Understand "exits" as requesting the list of exits.

Carry out requesting the list of exits:
	calculate visibility ceiling at low level;
	if the visibility ceiling count calculated is 0:
		say "It is pitch dark, and you can't see a thing.";
	otherwise:
		let X be a list of directions;
		repeat with the way running through directions:
			if the room-or-door the way from the location is not nothing:
				add the way to X;
		say "[regarding the number of entries in X]There [are] [if the number of entries in X is 1]an exit[otherwise]exits[end if] to [X with definite articles].".
		[There is an exit to the up, LOL.]
		
The additional commands flag is a truth state that varies. The additional commands flag variable translates into Inter as "held_back_mode".

To walk is a verb.

The can't go that way rule response (A) is "[if the additional commands flag is true]In [our] haste, [we] [walk] into a wall.[otherwise][We] [can't go] that way.[end if]".

Every turn when going:
	if the additional commands flag is true and the reason the action failed is the can't go that way rule:
		now the additional commands flag is false;
		get angrier.

Chapter P - Puzzles

A corpse is a kind of thing. A corpse is always scenery. A corpse can be intact. A corpse is usually intact. Understand "body" as a corpse. Understand "adventurer" as a corpse. Understand "dead" as a corpse. Understand "dust" as a not intact corpse. Understand "pile" as a not intact corpse. Understand "skeleton" as a corpse. Understand "remains" as a corpse.

A note is a kind of thing. A note has a number called the target score.
Check examining a note: 
	If the score is not less than the target score of the noun:
		say "You reminisce about solving the earlier puzzle.";
		stop the action.

Mister Boddy is a corpse. Mister Boddy is not intact.

A puzzle is a kind of object. A puzzle has a corpse called the supplicant. A puzzle has a door called the gate. A puzzle can be solved or unsolved. A puzzle is usually unsolved.

Controlling relates various devices to one puzzle. The verb to be controlled by means the reversed controlling relation. The verb to control means the controlling relation.

Check solving is a puzzle based rulebook. Check solving has outcomes the puzzle is solved and the puzzle is failed.
Success at solving is a puzzle based rulebook.
Failure to solve is a puzzle based rulebook.
Success report pending is a truth state that varies.
Failure report pending is a truth state that varies.
Laser target is a corpse that varies.

To verify (the test - a puzzle):
	follow the check solving rules for the test;
	if the outcome of the rulebook is the puzzle is solved outcome:
		follow the success at solving rules for the test;
	otherwise if the outcome of the rulebook is the puzzle is failed outcome:
		follow the failure to solve rules for the test.
		
Rule success at solving a puzzle (called test) (this is the standard puzzle solve rule):
	now the test is solved;
	increment the score;
	now the gate of the test is open;
	now success report pending is true.

Rule failure to solve a puzzle (called test) (this is the standard puzzle failure rule):
	repeat with activator running through the devices that control the test:
		now the activator is switched off;
	if the supplicant of the test is intact:
		now the laser target is the supplicant of the test;
	otherwise:
		get angrier;
	now failure report pending is true.

Every turn (this is the make pile of dust rule):
	if the laser target is intact:
		now the printed name of the laser target is "pile of dust";
		now the laser target is not intact;
		now the laser target is Mister Boddy.
		
Check switching on a device that controls a solved puzzle:
	say "You laugh to yourself as you contemplate what might happen if you did that.";
	stop the action.
	
Some lettering is a kind of thing. Lettering is always scenery. The indefinite article is "some". The description is "[detailed description of the noun]".

A statue is a kind of thing. A statue is always scenery.

To say detailed description of (L - a lettering):
	let mount be a random thing that incorporates L;
	choose row with an incorporator of the mount in Table of Lettering Details;
	if the scruitable entry is false:
		say "The lettering is in a language you don't understand.[no line break]";
	otherwise:
		say "The lettering is the word '[translation entry]' in the [tongue entry].[no line break]".

Table of Lettering Details
incorporator (things)	translation	tongue	scruitable
treefolk statue	"We"	"sylvan tongue"	false
filigree pattern	"If you're not an Apprentice, don't waste your time out here!"	"gnomish tongue"	false
lute	"The"	"common tongue"	true
mug of ale	"All"	"halfling tongue"	false
statue of an elven ranger	"Together"	"elvish tongue"	false
barbarian statue	"Are"	"draconic tongue"	false
prayer book	"Key"	"dwarven tongue"	false
[scraps of paper	"?"	"?"	false]

The first carry out examining rule (this is the Volo rule):
	let L be a lettering;
	let found be false;
	if the noun is a lettering: 
		now L is the noun;
		now found is true;
	if the noun is a thing that encloses a lettering:
		now L is a random lettering enclosed by the noun;
		now found is true;
	if found is true:
		let mount be a random thing that incorporates L;
		choose row with an incorporator of the mount in Table of Lettering Details;
		if the scruitable entry is false and the player holds Volo's Guide to Spirits:
			say "You briefly peruse [Volo's Guide to Spirits].";
			now the scruitable entry is true.
		

Part II - The Story

Chapter 1 - The Courtyard

Courtyard is a region.
		
Tower Courtyard is a room in Courtyard. The description is "After a long journey through the countryside, you have come upon the UNDOT [bracket]ed. note - come up with better name than Un-Named Dungeon Or Tower for 1.0 release[close bracket]. Its imposing [black gates] are suspiciously cast open, and you can see a path flanked by statues leading north to the door."
The black gates are an open unopenable plural-named door. They are south of Tower Courtyard.

After reading a command when the player is in Tower Courtyard (this is the Tower Courtyard hazy statues rule):
	if the player's command includes "statues":
		say "From here, most of the statues appear to be in disrepair. You'll need to move closer to get a better look." instead.

Inner Courtyard is a room in Courtyard. The description is "You find yourself surrounded on your left and right sides by [white marble statues], eroded by time. Most are unrecognizable, but one statue of a treefolk person looking into the distance seems to have held up better than the others. Ahead of you, the stone path widens to a dais leading up to the castle doors. [bracket]ed. note - maybe add multiple floors if it's going to be a tower or castle.[close bracket]". Inner Courtyard is north of Tower Courtyard. 

The treefolk statue is a statue in Inner Courtyard. The description is "The treefolk statue stands tall, though its face is too weathered to read whether it is looking wistfully or expectantly into the distance. A few leaves carved in its hair have broken off, and its cloth garments suggest that this particular treefolk is no stranger to urban areas. As you look closer, it appears that one of the arms has lettering carved into it. [Detailed description of a random lettering that is part of the treefolk statue]". The treefolk statue incorporates some lettering.

Some white marble statues are scenery in Inner Courtyard.
After reading a command when the player is in Inner Courtyard (this is the Inner Courtyard statue depluralization rule):
	if the player's command does not include "marble" and the player's command does not include "white" and the player's command includes "statues":
		replace the matched text with "white marble statues".

UNDOT Entrance is a room in Courtyard. The description is "You step onto the raised dais, and see the [great stone double doors] that lead into the UNDOT. [passing mention of the stonework decorations]Decorations are carved into the stonework near your feet. A marble statue[if the broken marble statue is discussed] torso[end if], toppled and broken, lies in front of the door." UNDOT Entrance is north of Inner Courtyard. Index map with room-name of UNDOT Entrance set to "Entrance".

The broken marble statue is a statue in UNDOT Entrance. The description is "The statue was once a humanoid figure, but any distinguishing marks were worn away long ago. The torso, head, and each arm are now separate pieces. The feet and base are nowhere to be seen." Understand "torso" as the broken marble statue when the broken marble statue is discussed. Does the player mean doing something with the broken marble statue: it is likely. Instead of pushing, pulling, flipping, or taking the broken marble statue, say "[We] [try] [our] best to lift [the noun], but [it's] too heavy for [us] to move.". After examining the broken marble statue for the first time: now everything in UNDOT Entrance is handled; continue the action.

Flipping is an action applying to one touchable thing. Understand "flip [something]" as flipping.
Check flipping (this is the block flipping rule): 
	if the noun is not a statue:
		say "[parser error internal rule response (B)] flip.";
	otherwise:
		say "[We] [try] [our] best to lift [the noun], but [it's] too heavy for [us] to move.";
	rule fails.

The statue head is a privately-named thing in UNDOT Entrance. Understand "head" as the statue head. The printed name is "marble head". A statue arm is a kind of thing. Statue arms are privately-named. Understand "arm" as a statue arm. The printed name is "marble arm". Rule for printing the plural name of a statue arm: say "marble arms". The description is "The arm is broken off near the shoulder, and examining the break reveals it to be a solid piece of marble, not hollow. It weighs quite a bit on its own." Two statue arms are in UNDOT Entrance. 
After reading a command (this is the statue arms pluralization rule):
	if the player's command includes "arms", replace the matched text with "all arm".

The great stone double doors are a plural-named unopenable door. The description is "The double doors leading into the UNDOT are large, heavy, and imposing. There are no handles, no keyhole, and no hinges, so the door must swing inward. But the mechanism to open the door is not apparent." They are north of UNDOT Entrance. Does the player mean doing something with the great stone double doors: it is likely. Instead of pushing or opening the great stone double doors, say "[We] [push] with all your might, but the door doesn't budge.". Instead of pulling the great stone double doors, say "Sorry, I don't see anything to pull here.". The great stone double doors are scenery.

The stonework decorations are scenery in UNDOT Entrance. The description is "The dominant carving is a large [passing mention of the diamond pressure plate] diamond inlaid with three overlapping circles. Around and above it ('above' meaning it is between the diamond and the door) is an elaborate [filigree pattern]."

The filigree pattern is part of the stonework decorations. It is scenery. The description is "At first glance, it appears to be purely decorative. After a few moments of study, however, it appears there is lettering in the filigree. [Detailed description of a random lettering that is part of the filigree pattern]". The filigree pattern incorporates some lettering.

[This puzzle is different than the other device-based puzzles because of score timing and the activation being piling things in a container.]
The diamond pressure plate is a privately-named fixed in place supporter. It is part of the stonework decorations. The description is "The diamond is inlaid with three large circles that slightly overlap, forming a triangle inside the center of the diamond. A closer look at the stone itself reveals a small gap between the diamond and the rest of the stonework. It is apparently a separate piece, and not mortared to the other stones around it." Understand "diamond" as the diamond pressure plate. The diamond pressure plate can be triggered. The diamond pressure plate is not triggered.
Jumping on is an action applying to one thing. Understand "jump on [something]" as jumping on. Understand "stand on [something]" as jumping on.
Report jumping on: 
	if the noun is the diamond pressure plate and the diamond pressure plate is not triggered, say "As you land on the diamond, it sinks downward, and a loud grinding sound echoes through the courtyard as the doors begin to open inward. When you jump upward and off the diamond, however, the diamond rises back up and the doors quickly slam fully shut."
After putting something on the diamond pressure plate:
	if the diamond pressure plate is not triggered:
		if two statue arms are on the diamond pressure plate and the statue head are on the diamond pressure plate:
			now the diamond pressure plate is triggered;
			now the great stone double doors are open;
			say "The combined weight of all three pieces is enough to depress the mechanism, and the door opens with a loud grinding sound.";
		otherwise:
			say "The diamond sinks slightly, but otherwise nothing happens.";
	otherwise:
		continue the action.
			
The last carry out going rule (this is the diamond pressure plate solve rule):
	if the score is 0 and the door gone through is the great stone double doors:
		say "With no more obstacles to your progress, you enter the UNDOT.";
		increase the score by 1

Chapter 2 - The Grand Foyer

Grand Foyer is a region.

To enter is a verb.
Grand Foyer Downstairs is a room in Grand Foyer. The description is "[We] [enter] the grand foyer of the UNDOT, which is grand mostly because of the grand staircase leading up to a door with an imposing lock. There are also doors to the West Wing and East Wing of the castle. The old adventuring credo of the Left Hand Rule would suggest going to the West Wing first." The printed name of Grand Foyer Downstairs is "The Grand Foyer". It is north of the great stone double doors. Index map with room-name of Grand Foyer Downstairs set to "Foyer".

WW Doors are a plural-named open unopenable door. The printed name of WW Doors is "Doors to the West Wing". Understand "west wing" and "west wing doors" as WW Doors. They are west of Grand Foyer Downstairs. They are scenery.

EW Doors are a plural-named open unopenable door. The printed name of EW Doors is "Doors to the East Wing". Understand "east wing" and "east wing doors" as EW Doors. They are east of Grand Foyer Downstairs. They are scenery.

The first check climbing rule: if the noun is the grand staircase, say "You were never very athletic, so climbing is not in your wheelhouse." instead.

The grand staircase is an open unopenable door. It is up from Grand Foyer Downstairs and down from Grand Balcony. Understand "stairs" as the grand staircase. 

Grand Balcony is a room in Grand Foyer. The description is "You ascend the stairs to the grand balcony overlooking the foyer. There is a [massive stone door], with an equally [massive triangular lock system]." Index map with Grand Balcony mapped north of Grand Foyer Downstairs and room-name of Grand Balcony set to "Balcony".

After deciding the scope of the player while the location is Grand Balcony, place Grand Foyer Downstairs in scope, but not its contents. Instead of examining Grand Foyer Downstairs when the location is Grand Balcony, say "[We] [look] over the balcony, and immediately regret it. [We] [don't] want to fall that far!". Instead of entering Grand Foyer Downstairs when the location is Grand Balcony: try going down.

The massive stone door is a closed openable locked lockable door. The massive stone door is north of Grand Balcony. The description is "[visuals of the massive stone door]".

A large metal slab is a privately-named part of the massive stone door. Understand "slab" as the large metal slab when the massive stone door is open. Understand "metal slab" as the large metal slab when the massive stone door is open. The large metal slab has a number called descent steps. The description of the metal slab is "It's a [if descent steps is 0]slightly[otherwise]partially[end if] descended metal slab, embedded within the wall."

The massive triangular lock system is part of the massive stone door. Understand "lock" as the massive triangular lock system. The description is "The lock is a large triangle, inset with a pyramid of 120 keyholes. At each corner of the triangle is a stylized star symbol." Instead of unlocking the massive triangular lock system with anything: try unlocking the massive stone door with the second noun. Instead of locking the massive triangular lock system with anything: try locking the massive stone door with the second noun.

A key is a kind of thing. The golden key is a key. Understand "gold" as the golden key. The description is "It is a large key coated with gold. On its shaft is written, 'Five to the left, with three in between.'".The silver key is a key. The silver key is in the safe of keys. The description is "It is a large key coated with silver. On its shaft is written, 'Five to the right, with three in between.'".

A pawl is a kind of thing. A pawl is always privately-named. A pawl can be locked or unlocked. A pawl is usually locked. A pawl has a number called the row. A pawl has a number called the column. A pawl has an object called the matching key.

To say visuals of the massive stone door:
	if the massive stone door is open and the descent steps of the large metal slab is less than 5:
		say "The stone door is open, beckoning [us] forward. [blockage of the massive stone door]";
	otherwise if the massive stone door is open:
		say "The stone door is open. [blockage of the massive stone door]";
	otherwise:
		say "The stone door is held shut by four clamps, one in each corner of the door.[no line break]";
		let L be the list of pawls that are part of the massive stone door;
		let U be the list of unlocked pawls that are part of the massive stone door;
		remove U from L, if present;
		if L is empty:
			say " All [number of entries in U in words] of the clamps are open.[no line break]";
		otherwise if U is not empty:
			let T be "[regarding the number of entries in U] [Number of entries in U in words] of the clamps [are] open.[no line break]";
			say T in sentence case.
		
To say blockage of the massive stone door:
	let obstruction percentage be descent steps of the large metal slab times 20;
	if obstruction percentage is 0:
		stop;
	otherwise if obstruction percentage is 100:
		say "[We] [see] behind it a large metal slab completely blocking the path forward.";
	otherwise:
		say "[We] [see] behind it a large metal slab covering the top [obstruction percentage in words] percent of the doorway. Fortunately, [it] [aren't] enough to stop [us] from ducking under it to get through the door.".

The first pawl is a pawl. The row is 13. The column is 5. The matching key is the silver key. The first pawl is part of the massive stone door.

The second pawl is a pawl. The row is 13. The column is 9. The matching key is the golden key. The second pawl is part of the massive stone door.

The third pawl is a pawl. The row is 5. The column is 1. The matching key is the golden key. The third pawl is part of the massive stone door.

The fourth pawl is a pawl. The row is 5. The column is 5. The matching key is the silver key. The fourth pawl is part of the massive stone door.

Instead of inserting a key into the massive stone door: try unlocking the second noun with the noun.
Instead of locking or unlocking the massive stone door with a key:
	now the input prompt is "Row? >";
	solicit a number;
	let requested row be the numeric equivalent of the solicited input;
	now the input prompt is "Column? >";
	solicit a number;
	let requested column be the numeric equivalent of the solicited input;
	if the requested row is less than 1 or the requested row is greater than 15 or the requested column is less than 1 or the requested column is greater than the requested row:
		say "You try pushing [the second noun] directly into the door, missing all the keyholes. Needless to say, nothing happens.";
		rule fails;
	let the found pawl be nothing;
	repeat with current pawl running through pawls that are a part of the massive stone door:
		if the row of the current pawl is the requested row and the column of the current pawl is the requested column and the matching key of the current pawl is the second noun:
			now the found pawl is the current pawl;
	if the found pawl is not nothing:
		if the found pawl is locked:
			say "You turn the key, and one of the metal clamps on the door springs open.";
			now the found pawl is unlocked;
		otherwise:
			say "You turn the key, and one of the metal clamps latches back onto the door.";
			now the found pawl is locked;
	otherwise:
		say "You turn the key. You see no change to the door, but hear a sound of metal against stone that lasts for a few seconds.";
		increment the descent steps of the large metal slab;
	if all pawls that are a part of the massive stone door are unlocked:
		now the massive stone door is unlocked;
	otherwise:
		now the massive stone door is locked.
	
Instead of locking or unlocking the massive stone door with anything:
	say "You don't see anywhere to put [the second noun]."
	
Report opening the massive stone door:
	say "[We] [open] [the noun]. [blockage of the massive stone door]";
	if the descent steps of the large metal slab is greater than four:
		end the story.
		
The standard report opening rule does nothing when opening the massive stone door.

East Wing is a region. [This has to be listed before the East Wing Foyer.]

East Wing Foyer is a room in Grand Foyer. [I'm putting this room in this region here because it's not a puzzle itself, just gatekeeping future puzzles.] The description is "You enter a small foyer much like the Grand Foyer, just smaller. It is unfurnished, with [a greenhorn door] to the north and [a greenhorn sign] above the door." It is east of the EW Doors. Index map with room-name of East Wing Foyer set to "Foyer".

The greenhorn door is a door. It is north of East Wing Foyer. The printed name is "stone door". Understand "door" as the greenhorn door. Understand "stone door" as the greenhorn door. Understand "ring" as the greenhorn door. Understand "pull" as the greenhorn door. The description is "The stone door is unadorned save for its iron ring pull." Instead of pulling the greenhorn door: try opening the greenhorn door.

Check opening the greenhorn door:
	If the score is less than five:
		say "You get a chill down your spine, as though you're taking your life into your hands; this is no mere blood pressure excursion. You decide to explore the West Wing more first.";
		stop the action.

The greenhorn sign is scenery in East Wing Foyer. The description is "The sign reads:[paragraph break][quotation mark]WARNING: If you are not a Greenhorn, turn back![quotation mark]". The printed name is "sign".

Section 2Z

Carry out examining the massive triangular lock system (this is the grand balcony visualization rule):
	say "The triangle has an obelisk tip at the top, with an unadorned tri-pointed star. In the bottom left corner are two overlapping quad-pointed stars, with the larger one slightly offset to the center of the lock. In the bottom right corner are two overlapping quad-pointed stars, with the larger one slightly offset to the left. There are 15 rows of keyholes; the first row has one keyhole, the second has two, et cetera, until the last row has 15.";
	continue the action.
	
The grand balcony visualization rule is listed after the examine undescribed things rule in the carry out examining rulebook.
	
Section 2G (for Glulx only)

Figure of the Massive Triangular Lock is the file "massive-lock.png".

This is the grand balcony illustration rule:
	If examining the massive triangular lock system:
		if graphics are supported, display the Figure of the Massive Triangular Lock;
		otherwise abide by the grand balcony visualization rule;
	continue the action.

The grand balcony illustration rule is listed instead of the grand balcony visualization rule in the carry out examining rulebook.

Chapter 3 - The Noisy Levers

West Wing is a region.

West Wing Foyer is a room in West Wing. It is west of WW Doors. The description is "You step into another, smaller foyer. Like the grand foyer, it is largely unfurnished. A [lever-pulling success door] leads north, while the west wall features a row of levers. On the floor beneath the levers, you see [if the lever-pulling skeleton is intact][passing mention of the lever-pulling skeleton]the skeletal remains of an unfortunate adventurer who came before you[otherwise][a lever-pulling skeleton][end if]. To the south, there is a life-sized statue of a human bard." Index map with room-name of West Wing Foyer set to "Foyer".

The bard statue is a statue in West Wing Foyer. The description is "The statue is of a human bard strumming a lute. She is wearing a fancy cap with a feather in it and her mouth is open in song. As you look closer, the neck of the lute has lettering carved into it. [Detailed description of a random lettering that is part of the lute]"

The lute is part of the bard statue. It is scenery. The description is "The lute is carved out of marble, like the rest of the statue. As you look closer, the neck of the lute has lettering carved into it. [Detailed description of a random lettering that is part of the lute]". The lute incorporates some lettering.

The lever-pulling skeleton is a corpse in West Wing Foyer. The description is "The skeleton is old and skeletonized enough that you cannot tell how they died.". The printed name is "skeleton".

Instead of examining the lever-pulling skeleton:
	say "[description of the noun][run paragraph on]";
	let stuff be {the small golden chalice, the lever-pulling paper};
	if the small golden chalice is handled, remove the small golden chalice from stuff;
	if the lever-pulling paper is handled, remove the lever-pulling paper from stuff;
	if the number of entries in stuff is 0:
		say "";
	otherwise if the lever-pulling skeleton is not intact:
		say " Piled on top is [stuff with indefinite articles].";
	otherwise if the number of entries in stuff is 1:
		say " One hand is gripping [an entry 1 of stuff].";
	otherwise if the number of entries in stuff is 2:
		say " One hand is gripping [an entry 1 of stuff]; the other is gripping [an entry 2 of stuff].";
	otherwise:
		say " Piled on top is [stuff with indefinite articles]."


A small golden chalice is a thing in West Wing Foyer. The description is "The chalice is small and made of gold, with a [silver band] around the stem." The silver band is a part of the small golden chalice. The description is "It appears to be a simple decorative band." Understand "ring chalice" as a mistake ("Tink.").

The lever-pulling success door is a privately-named closed unopenable door. It is north of West Wing Foyer. The description is "The stone door is a featureless slab within the doorframe. Based on the very slight gap at the bottom, you can surmise that the door lifts up somehow.". The printed name of the lever-pulling success door is "stone door". Understand "door" as the lever-pulling success door. Understand "stone door" as the lever-pulling success door. Instead of opening the lever-pulling success door, say "You can't get your fingers into the gap.".

The lever-pulling paper is a privately-named note in West Wing Foyer. Understand "paper" as the lever-pulling paper. Understand "note" as the lever-pulling paper. The printed name is "[if not discussed]small piece of paper[otherwise]hand-written note[end if]". The description is "[if the player carries the lever-pulling paper]The paper reads:[paragraph break][italic type]The second lever will sound like a roar[line break]A primary first helps open the door[line break]The last lever pulled is the color of sky[line break]After the second will buzz like a fly[roman type][otherwise]The paper seems to be a small hand-written note.[end if][if the lever-pulling paper is not handled] You can't read it without taking it from the skeleton's grasp.[end if]". The target score is 2.

The row-of-levers is privately-named scenery in West Wing Foyer. Understand "row of levers" as the row-of-levers. The printed name is "row of levers". The description is "There are five levers with colored handles."
Rule for printing the name of a lever (called the handle) while examining the row-of-levers:
	if any lever that is part of the row-of-levers is switched on:
		say "[color of the handle] [if the handle is switched off](up)[otherwise](down)[end if]";
	otherwise:
		say "[color of the handle]".
		
Carry out examining the row-of-levers (this is the lever status rule):
	say "There are five levers with colored handles[if every lever that is part of the row-of-levers is switched off], all in the 'up' position[end if]. From left to right, the levers are [list of levers that are part of the row-of-levers].";
	now examine text printed is true.
The lever status rule substitutes for the standard examining rule when the noun is the row-of-levers.
	
After reading a command when the player is in West Wing Foyer (this is the levers aggregation rule):
	if the player's command does not include "row" and the player's command includes "levers", replace the matched text with "row of levers".

A lever is a kind of device. Levers have some text called the color. Levers have some text called the adjective. Levers have some text called the noise. Levers have a number called the index. Levers have a number called the correct pull. Levers have a number called the actual pull.
instead of pulling a lever: try switching on the noun.
check switching off a lever: 
	say "No matter how hard you try, the lever doesn't budge.";
	rule fails.

The lever-pulling puzzle is a puzzle. The supplicant is the lever-pulling skeleton. The gate is the lever-pulling success door.

A success at solving rule for the lever-pulling puzzle:
	now the description of West Wing Foyer is "You are standing in the foyer of the west wing of the UNDOT. [If the lever-pulling skeleton is intact]A [lever-pulling skeleton][otherwise]A small [lever-pulling skeleton] that used to be a skeleton[end if] sits under five levers in the 'down' position. An open door to the north leads further into the west wing. An open door to the east leads back to the Grand Foyer. Also the statue of the bard is still there.".
	
Carry out an actor switching on a lever (called the handle) that are part of row-of-levers (this is the Kronk rule): 
	now the actual pull of the handle is the number of levers that are switched on that control the lever-pulling puzzle;
	verify the lever-pulling puzzle.
The Kronk rule is listed after the standard switching on rule in the carry out switching on rulebook.
	
A check solving rule for the lever-pulling puzzle:
	if any levers that are part of the row-of-levers are switched off:
		make no decision;
	repeat with handle running through levers that are part of the row-of-levers:
		if the correct pull of the handle is not the actual pull of the handle:
			the puzzle is failed;
	the puzzle is solved.

Report an actor switching on a lever that is part of the row-of-levers (this is the lever report switching on rule):
	say "[The actor] [pull] the lever into the down position. As [they] [do], the room fills with the sound of a [adjective of the noun] [noise of the noun].[run paragraph on]";
	if success report pending is true:
		say " As the sound of the [noise of the noun] fades away, the door open.[run paragraph on]";
		now success report pending is false;
	if failure report pending is true:
		say " A bright bolt of energy shoots from the levers, [if the lever-pulling skeleton is intact]hitting the [lever-pulling skeleton] and disintegrating it[otherwise]striking you in the chest. The pain is brief, but tremendous[end if]. After that, all the levers reset to the 'up' position.[run paragraph on]";
		now failure report pending is false;
	say paragraph break;
	rule succeeds.
The lever report switching on rule is listed before the standard report switching on rule in the report switching on rulebook.

[This is much better done in a table, but current versions of Inform are bugged (I7-2351). Alas, we have to write it out in full...]
A black lever is a lever. It is part of the row-of-levers. The index is 1. The correct pull is 2. The color is "black". The adjective is "roaring". The noise is "lion". A yellow lever is a lever. It is part of the row-of-levers. The index is 2. The correct pull is 3. The color is "yellow". The adjective is "buzzing". The noise is "bee". A blue lever is a lever. It is part of the row-of-levers. The index is 3. The correct pull is 5. The color is "blue". The adjective is "strumming". The noise is "lute". A green lever is a lever. It is part of the row-of-levers. The index is 4. The correct pull is 4. The color is "green". The adjective is "rushing". The noise is "wind". A red lever is a lever. It is part of the row-of-levers. The index is 5. The correct pull is 1. The color is "red". The adjective is "ringing". The noise is "bell". The black lever controls the lever-pulling puzzle. The yellow lever controls the lever-pulling puzzle. The blue lever controls the lever-pulling puzzle. The green lever controls the lever-pulling puzzle. The red lever controls the lever-pulling puzzle. 

Chapter 4 - The Pushing Glyphs

West Wing Hall is a room in West Wing. West Wing Hall is north of the lever-pulling success door. The description is "You step into a long hallway, with a [west hall carpet] running north along the floor. On the western side of the hall is a [passing mention of the barbarian statue]statue of a dragonkin barbarian clad in furs[if the battle-axe is not handled], with a large [battle-axe] across its back[end if]." Index map with room-name of West Wing Hall set to "Hall 1".

The west hall carpet is a backdrop. It is in West Wing Hall and West Wing Hall 2.  The description is "The carpet is a cool red color, without much frill or decoration. It must be here for comfort, since there's not much style to it and it's impossible to get lost in a hallway." Understand "red" as the west hall carpet. Understand "carpet" as the west hall carpet. The printed name is "red carpet".

The barbarian statue is a statue in West Wing Hall. Understand "dragonkin" as the barbarian statue. The description is "It is a statue of a tall dragonkin barbarian, [if the battle-axe is handled]formerly [end if]holding a two-handed axe in a position to swing downwards with a ferocious attack. Upon closer inspection, you see lettering in the scales on his chest. [Detailed description of a random lettering that is part of the barbarian statue]". The barbarian statue incorporates some lettering.

A battle-axe is a thing in West Wing Hall. The description is "[if the battle-axe is not handled]The glint of the axe suggests it is surprisingly sharp. Wait a minute, the axe isn't marble! It's not actually a part of the statue![otherwise]The axe is in pristine condition, with a sharp edge and no sign of wear. It's easy to tell that no one has actually used this axe in combat.[end if]". Understand "axe" as a battle-axe.

West Wing Hall 2 is a room in West Wing. West Wing Hall 2 is north of West Wing Hall. The description is "[passing mention of the west hall carpet]The carpet of the hall leads to [a glyph door], set into [a glyph archway] covered with glyphs. A [glyph adventurer] lies in front of the door.". Index map with room-name of West Wing Hall 2 set to "Hall 2".

A glyph button is a kind of device. Glyph buttons are privately-named. Glyph buttons have a text called translation. Glyph buttons have a number called correct push. Glyph buttons have a text called ordinal. Glyph buttons have a number called actual push. Understand the translation property as describing a glyph button when the player has the glyph translation scroll. The printed name is "[if the player has the glyph translation scroll]stone with '[translation]'[otherwise]stone with a mysterious glyph[end if]". The description of a glyph button is "This archway stone has a carving on it. [if the player has the glyph translation scroll]According to your scroll, the carving means [quotation mark][translation of the noun][quotation mark].[otherwise]You have no idea what this might represent.[end if]". Does the player mean doing something to a glyph button: it is unlikely. Instead of pushing a glyph button: try switching on the noun. 
Check switching off a glyph button:
	say "[The noun] is flush against the wall, and you can't get a good grip.";
	rule fails.

[This is much better done in a table, but current versions of Inform are bugged (I7-2351). Alas, we have to write it out in full...]
war glyph button is a glyph button. It is part of the glyph archway. The translation is "WAR". The correct push is 4. The ordinal is "fourth". 
shelter glyph button is a glyph button. It is part of the glyph archway. The translation is "SHELTER". 
fey glyph button is a glyph button. It is part of the glyph archway. The translation is "FEY". 
fire glyph button is a glyph button. It is part of the glyph archway. The translation is "FIRE". The correct push is 2. The ordinal is "second". 
decision glyph button is a glyph button. It is part of the glyph archway. The translation is "DECISION". 
goblins glyph button is a glyph button. It is part of the glyph archway. The translation is "GOBLINS". 
death glyph button is a glyph button. It is part of the glyph archway. The translation is "DEATH". 
chaos glyph button is a glyph button. It is part of the glyph archway. The translation is "CHAOS". 
guardian glyph button is a glyph button. It is part of the glyph archway. The translation is "GUARDIAN". 
safe passage glyph button is a glyph button. It is part of the glyph archway. The translation is "SAFE PASSAGE". 
camp glyph button is a glyph button. It is part of the glyph archway. The translation is "CAMP". 
holy site glyph button is a glyph button. It is part of the glyph archway. The translation is "HOLY SITE". 
air glyph button is a glyph button. It is part of the glyph archway. The translation is "AIR". 
sun glyph button is a glyph button. It is part of the glyph archway. The translation is "SUN". 
earth glyph button is a glyph button. It is part of the glyph archway. The translation is "EARTH". The correct push is 1. The ordinal is "first". 
water glyph button is a glyph button. It is part of the glyph archway. The translation is "WATER". The correct push is 3. The ordinal is "third". 
When play begins:
	Repeat with insignia running through the glyph buttons that are part of the glyph archway:
		now the insignia controls the glyph puzzle.

The glyph archway is scenery in West Wing Hall 2. The printed name is "archway". Understand "glyphs" as the glyph archway. The description is "There are sixteen glyphs, each on a stone that makes up the archway around the door.".

The glyph adventurer is a corpse in West Wing Hall 2.  The printed name is "dead adventurer". The description is "The adventurer is long dead, a humanoid skeleton clad in tatters.[if the glyph translation scroll is not handled] In its bony fingers, it grips a scroll.[end if]"

The glyph translation scroll is a note in West Wing Hall 2. The description is "You unfurl the scroll, and see that the adventurer had translated the glyphs. Of course, he didn't solve the puzzle, so how much help could it really be?". The printed name is "scroll of glyphs". The target score is 3. Check an actor examining the glyph translation scroll: if the actor is not carrying the noun, carry out the implicitly taking activity with the noun; if the actor is not carrying the noun, stop the action.

The glyph door is a closed unopenable door. It is north of West Wing Hall 2. The printed name is "stone door". The description is "The door is dominated by a carving of a sword, which eclipses a circle with a sun and moon along its arc.  Beneath the carving, there are handwritten scrawls in red ink. Above the carving are two rows of gems: four emeralds above three rubies.".

Carry out an actor examining the glyph door (this is the rubies and emeralds rule):
	say "[description of the noun][run paragraph on]";
	Let the gemstones be a list of text;
	if the earth glyph button is switched on, add "the first emerald" to the gemstones;
	if the fire glyph button is switched on, add "the second emerald" to the gemstones;
	if the water glyph button is switched on, add "the third emerald" to the gemstones;
	if the war glyph button is switched on, add "the fourth emerald" to the gemstones;
	if the ruby count of the glyph puzzle is greater than 0, add "the first ruby" to the gemstones;
	if the ruby count of the glyph puzzle is greater than 1, add "the second ruby" to the gemstones;
	if the number of entries in the gemstones is greater than 0:
		let shiniest be entry 1 of the gemstones;
		replace word number 1 in shiniest with "The";
		remove entry 1 in the gemstones;
		add shiniest at entry 1 in the gemstones;
		say " [The gemstones][regarding the number of entries in the gemstones] [are] glowing with magical light.[run paragraph on]";
	say paragraph break;
	now examine text printed is true.
The rubies and emeralds rule substitutes for the standard examining rule when the noun is the glyph door.

The scrawls are part of the glyph door. The description is "The scrawls are faded with time, but you can make out 'Life of a sword? Birth of a sword?'".

The glyph puzzle is a puzzle. The supplicant is the glyph adventurer. The gate is the glyph door. The glyph puzzle has a number called emerald count. The glyph puzzle has a number called ruby count.

Carry out an actor switching on a glyph button (called the symbol) that is part of the glyph archway (this is the Dee-Dee rule):
	if the correct push of the symbol is not 0:
		increment the emerald count of the glyph puzzle;
		now the actual push of the symbol is the emerald count of the glyph puzzle;
	otherwise:
		increment the ruby count of the glyph puzzle;
	verify the glyph puzzle;
	continue the action.
The Dee-Dee rule is listed after the standard switching on rule in the carry out switching on rulebook.

A failure to solve rule for the glyph puzzle:
	now the ruby count of the glyph puzzle is 0; now the emerald count of the glyph puzzle is 0.
	
A check solving rule for the glyph puzzle:
	if the emerald count of the glyph puzzle is less than 4 and the ruby count of the glyph puzzle is less than 3:
		make no decision;
	If the ruby count of the glyph puzzle is three, the puzzle is failed;
	repeat with gemstone running through glyph buttons:
		if the correct push of the gemstone is not 0 and the correct push of the gemstone is not the actual push of the gemstone:
			the puzzle is failed;
	the puzzle is solved.
		
report an actor switching on a glyph button that is part of the glyph archway (this is the glyph report switching on rule):
	say "[The actor] [push] the glyph, and the archstone sinks back flush to the wall. [if the correct push of the noun is not 0]The [ordinal of the noun] emerald on the door begins to glow.[run paragraph on][otherwise]A ruby on the door begins to glow.[run paragraph on][end if]";
	if success report pending is true:
		say " Suddenly, the door lifts open.[run paragraph on]";
		now success report pending is false;
	if failure report pending is true:
		say " Suddenly, a bolt of magical energy shoots out from the carving, [if the glyph adventurer is intact]disintegrating the remains of the dead adventurer[otherwise]striking you in the chest. The pain is brief, but tremendous[end if]. All the archstones that were pressed reset to their original positions, and all the gems stop glowing.[run paragraph on]";
		now failure report pending is false;
	say paragraph break;
	rule succeeds.
The glyph report switching on rule is listed before the standard report switching on rule in the report switching on rulebook.

Section 4Z

To decide what text is the label-translation of (B - a glyph button) (this is translating):
	Decide on "'[the translation of B]'".

Carry out examining the glyph archway (this is the glyph archway visualization rule):
	let stones be the list of glyph buttons;
	say "Based on the scroll, they are: [translating applied to stones].";
	continue the action.
	
Carry out examining the glyph translation scroll (this is the glyph scroll visualization rule):
	let stones be the list of glyph buttons;
	say "Written in red ink, you see translations for: [translating applied to stones].";
	continue the action.
	
The glyph archway visualization rule is listed after the examine undescribed things rule in the carry out examining rulebook.
The glyph scroll visualization rule is listed after the examine undescribed things rule in the carry out examining rulebook.

Section 4G (for Glulx only)

Figure of the Unnamed Glyphs is the file "unnamed-glyphs.PNG". Figure of the Named Glyphs is the file "named-glyphs.PNG".

This is the glyph archway illustration rule:
	if examining the glyph archway:
		if graphics are supported, display the Figure of the Unnamed Glyphs;
		otherwise abide by the glyph archway visualization rule;
	continue the action.
	
This is the glyph scroll illustration rule:
	if examining the glyph translation scroll:
		if graphics are supported, display the Figure of the Named Glyphs;
		otherwise abide by the glyph scroll visualization rule;
	continue the action.
	
The glyph archway illustration rule is listed instead of the glyph archway visualization rule in the carry out examining rulebook.
The glyph scroll illustration rule is listed instead of the glyph scroll visualization rule in the carry out examining rulebook.

Chapter 5 - The Pedestal Puzzle

A pedestal is a kind of supporter. A pedestal is always scenery. A pedestal has a direction called the corner. 
Instead of doing anything with a direction when the player is in Pedestal Room:
	repeat with podium running through pedestals:
		if the corner of the podium is the noun:
			now the noun is the podium;
	continue the activity.

Pedestal Room is a room in West Wing. The description is "You enter a room dominated by four waist-high pedestals, arranged in a 2x2 pattern. To the north is a featureless [pedestal door].[if the score is less than 4][paragraph break](Hint: use compass directions to distinguish which pedestal you mean: NW, SW, NE, SE.) [bracket]Ed. note - come up with a readme or instruction manual for stuff like this.[close bracket][end if]". Pedestal Room is north of the glyph door. Index map with room-name of Pedestal Room set to "Pedestals".

After reading a command when the player is in Pedestal Room (this is the pedestal corner disambiguation rule):
	if the player's command includes "pedestal":
		cut the matched text.

[There appears to be no consequence for failure here, just tickling the parser the right way with ##write, so this isn't a capital-P Puzzle.]
The northeast pedestal is a pedestal in Pedestal Room. The corner is northeast. The description is "[if the feather quill is on the northeast pedestal]Atop this pedestal rests [a feather quill].[otherwise]This pedestal is empty.[end if]".

The southeast pedestal is a pedestal in Pedestal Room. The corner is southeast. The description is "[if the broken sword is on the southeast pedestal]Atop this pedestal rests a piece of a [broken sword] blade, its surface [surface finish of the broken sword].[otherwise] This pedestal is empty.[end if]".

The northwest pedestal is a pedestal in Pedestal Room. The corner is northwest. The description is "This pedestal has a [stone bowl] embedded in its top. The bowl is filled with fine white [sand], the surface of which is smooth and flat."

The southwest pedestal is a pedestal in Pedestal Room. The corner is southwest.The description is "You see a series of [runes] carved into the top surface of the pedestal, with a horizontal line below them."

The pedestal door is a privately-named closed unopenable door. The pedestal door is north of Pedestal Room. Understand "door" as the pedestal door. The printed name is "stone door".

The feather quill is a thing on the northeast pedestal. The feather quill can be filled. The feather quill is not filled.

The broken sword is a thing on the southeast pedestal. The broken sword has a text called surface finish. The surface finish is "highly polished".

This is the naked blade rule:
	if the noun is the broken sword:
		if the second noun is the southwest pedestal or the second noun is the runes:
			now the broken sword is on the southwest pedestal;
			now the broken sword is fixed in place;
			now the description of the sword is "Looking down at the sword from where you are, you see the runes inverted in the polished blade's reflection.";
			rule succeeds.
			
The naked blade rule is listed last in the carry out putting it on rulebook.
			
This is the shiny rule:
	if the noun is the broken sword and the broken sword is on the southwest pedestal:
		say "The broken sword fits neatly on the line beneath the runes.";
		rule succeeds.
		
The shiny rule is listed first in the report putting it on rulebook.

The runes are a plural-named part of the southwest pedestal.

The stone bowl is part of the northwest pedestal. The description is "The bowl is filled with fine white [sand], the surface of which is smooth and flat."

The sand is part of the stone bowl. Instead of pushing, pulling, rubbing, or taking the sand: say "That seems rather... gritty. Better not."; stop the action.

Understand "use [something] [text]" as a mistake ("Try performing that action by starting with its name instead.") [We can't handle using a noun on/in a second noun to verb a _third_ topic; the parser will explode.]

Writing on is an action applying to one touchable thing and one topic. Understand "write [text] on/in [something]" as writing on (with nouns reversed).

Check writing on (this is the utensil rule):
	if the actor does not carry the feather quill:
		if the feather quill is not in the location:
			say "[We] [don't] have something to write with.";
			stop the action;
		carry out the implicitly taking activity with the feather quill;
		if the actor does not carry the feather quill:
			stop the action.

Check writing on (this is the wet quill rule):
	If the feather quill is filled:
		say "You don't want to get ink all over [the noun].";
		stop the action.
			
Check writing on (this is the writing surface rule):
	if the noun is not the broken sword and the noun is not the sand:
		say "Having a quill with no ink, there's only one way to write anything, and that's in the sand.";
		stop the action.
			
Carry out writing on the sword (this is the sword easter egg rule): 
	now the surface finish of the broken sword is "somewhat averagely polished".
	
Report writing on the sword (this is the other sword easter egg rule):
	say "The broken sword is now slightly less polished.".
	
Carry out writing on the sand (this is the pedestal puzzle solve rule):
	If the topic understood matches the text "reflected" and the topic understood matches the text "inverted" and the topic understood matches the text "runes":
		if the score is less than 4:
			increment the score;
			now the pedestal door is open;
		
Report writing on the sand:
	say "You move over to the northwest pillar and write in the sand.[run paragraph on]";
	If the topic understood matches the text "reflected" and the topic understood matches the text "inverted" and the topic understood matches the text "runes":
		say " [one of]When you are finished, the door to the north slides open.[or]Those squiggles are just as interesting as the first time [we] wrote them.[stopping]";
	otherwise:
		say " When you are finished, a gust of wind suddenly rises up around the pillar. The sand in the bowl is blown smooth and flat once again.".
		
Septentrially examining is an action applying to one thing. Understand "turn south and examine [a thing]" as septentrially examining. Understand "turn south and look at [a thing]" as septentrially examining. Understand "turn south and read [a thing]" as septentrially examining. Understand "examine [a thing] from the/-- north" as septentrially examining. Understand "look at [a thing] from the/-- north" as septentrially examining. Understand "read [a thing] from the/-- north" as septentrially examining.

Check septentrially examining:
	if the noun is the runes:
		continue the action;
	if the noun is the broken sword:
		if the southwest pedestal supports the broken sword:
			continue the action;
	try examining the noun instead.
	
Carry out septentrially examining the runes:
	say "You look at the runes from the north, by the bowl of sand."

Carry out septentrially examining the broken sword:
	say "You look at the sword's reflection from the north, by the bowl of sand. Inverted and reflected in the sword's blade, the runes appear as such:".
	
Instead of putting something on the runes: try putting the noun on the southwest pedestal.

Section 5Z

To say rune transcription note: say "[first time][bracket]Tr. note: This is a difficult puzzle to make work properly on a text display. Include feelies in the big box copy?[close bracket][only]"

Carry out examining the runes (this is the runes visualization rule):
	say "It appears to read '[unicode 658][unicode 43007][unicode 9074][unicode 1898][unicode 5805]'.";
	continue the action.
	
Carry out examining the sword when the noun is on the southwest pedestal (this is the reflected runes visualization rule):
	say "It appears to read '[unicode 658][unicode 43007][unicode 9073][unicode 12492][unicode 5801]'.";
	continue the action.
	
Carry out septentrially examining the runes (this is the inverted runes visualization rule):
	say "It appears to read '[unicode 2004][unicode 11618][unicode 9073][unicode 43007][unicode 400]'.";
	continue the action.
	
Carry out septentrially examining the sword when the noun is on the southwest pedestal (this is the inverted reflected runes visualization rule):
	say "It appears to read '[unicode 5806][unicode 11362][unicode 9074][unicode 43007][unicode 400]'.";
	
The runes visualization rule is listed after the examine undescribed things rule in the carry out examining rulebook.
The reflected runes visualization rule is listed after the examine undescribed things rule in the carry out examining rulebook.
The inverted runes visualization rule is listed last in the carry out septentrially examining rulebook.
The inverted reflected runes visualization rule is listed last in the carry out septentrially examining rulebook.

Section 5G (for Glulx only)

Figure of the Unaltered Runes is the file "pedestal-runes.png". Figure of the Reflected Runes is the file "pedestal-runes-reflected.png". Figure of the Inverted Runes is the file "pedestal-runes-inverted.png". Figure of the Inverted Reflected Runes is the file "pedestal-runes-inverted-reflected.png".

This is the runes illustration rule:
	if examining the runes:
		if graphics are supported, display the Figure of the Unaltered Runes;
		otherwise abide by the runes visualization rule;
	continue the action.
	
This is the reflected runes illustration rule:
	if examining the sword when the noun is on the southwest pedestal:
		if graphics are supported, display the Figure of the Reflected Runes;
		otherwise abide by the reflected runes visualization rule;
	continue the action.
	
This is the inverted runes illustration rule:
	if septentrially examining the runes:
		if graphics are supported, display the Figure of the Inverted Runes;
		otherwise abide by the inverted runes visualization rule;
	continue the action.
	
This is the inverted reflected runes illustration rule:
	if septentrially examining the sword when the noun is on the southwest pedestal:
		if graphics are supported, display the Figure of the Inverted Reflected Runes;
		otherwise abide by the inverted reflected runes visualization rule;
	continue the action.
	
The runes illustration rule is listed instead of the runes visualization rule in the carry out examining rulebook.
The reflected runes illustration rule is listed instead of the reflected runes visualization rule in the carry out examining rulebook.
The inverted runes illustration rule is listed instead of the inverted runes visualization rule in the carry out septentrially examining rulebook.
The inverted reflected runes illustration rule is listed instead of the inverted reflected runes visualization rule in the carry out septentrially examining rulebook.
	

Chapter 6 - The Mirrored Study

Mirrored Study is a room in West Wing. Mirrored Study is north of the pedestal door. The description is "You enter a large study at the end of the west wing. The center is dominated by [a dining table] with seating and place settings for six. The northern wall has two [bookshelves], separated by [a writing desk]. On the eastern wall is [a large fireplace] and [mantle], flanked [if the fireplace tools are in Mirrored Study]on one side by [fireplace tools] and on the other by [a mirror statue][otherwise]by [a mirror statue][end if]. The southern wall is decorated with [ornamental weapons], and [a suit of armor] stands on either side of the southern door. The western wall is covered by [a grand mirror] that runs the entire width and height of the wall, and in front of the mirror lies [a mirrored adventurer]." Index map with room-name of Mirrored Study set to "Study".

A thing has a text called the reflection. The reflection is usually "".

Examining the reflection is an action applying to one visible thing and requiring light. Understand "look at/-- [something] in mirror" as examining the reflection. Understand "examine [something] in mirror" as examining the reflection. Understand "examine the/-- reflection of [something]" as examining the reflection. Understand "look at/-- the/-- reflection of/-- [something]" as examining the reflection.

Check examining the reflection (this is the reflexive examination rule):
	if the noun is yourself, try examining the noun instead.
Check examining the reflection (this is the needs a mirror rule):
	If the location is not Mirrored Study:
		If the noun is not the runes or the broken sword is not on the southwest pedestal:
			say "You don't see a mirror here.";
			stop the action.

Carry out examining the reflection:
	if the noun provides the property reflection and the reflection of the noun is not "":
		say "[the reflection of the noun][paragraph break]";
	otherwise:
		try examining the noun.

The mirrored adventurer is a  corpse in Mirrored Study. The printed name is "dead adventurer". The description is "The adventurer's body is collapsed in front of the mirror. Given its emaciated state, it's entirely possible the adventurer starved to death in this room.[if the torn-out page is not handled] In its hand is [a torn-out page].[end if]".

The writing desk is a supporter in Mirrored Study. The writing desk is scenery. The description is "It is a small writing desk with a single chair. [A pot of ink][if the feather quill is in the pot of ink] and quill[end if] sits in a corner of the desk.". The reflection is "It is a small writing desk with a single chair. A pot of ink and quill sits in a corner of the desk.".

The pot of ink is an open unopenable container. The pot of ink is part of the writing desk. 
Check inserting something into the pot of ink: 
	if the noun is not the feather quill: 
		say "That doesn't fit in there.";
		stop the action.
Report inserting the feather quill into the pot of ink:
	say "You set the quill into the pot of ink. It now matches its reflection in the mirror.";
	rule succeeds.		
Rule for deciding the concealed possessions of the pot of ink: yes.

Filling is an action applying to one carried thing and one touchable thing. Understand "fill [something]" as filling. Understand "fill [something] with [something]" as filling. Rule for supplying a missing second noun while filling: if the location is Mirrored Study, now the second noun is the pot of ink; otherwise say "I don't see anything to fill [the noun] with.".
Check filling:
	if the noun is the golden chalice and the second noun is the pot of ink:
		say "You decide not to contaminate [the golden chalice] with something you're not sure isn't toxic.";
		stop the action;
	if the noun is not the feather quill or the second noun is not the pot of ink:
		say "I don't know how to fill [the noun] with [the second noun].";
		stop the action.
Carry out filling:
	say "You dip [the noun] into [the second noun].";
	now the feather quill is filled.

The fireplace tools are a privately-named, plural-named thing in Mirrored Study. The description is "The fireplace tools include a poker, tongs, shovel, flint and steel, pan, and brush.". Understand "poker" as the fireplace tools. Understand "tongs" as the fireplace tools. Understand "shovel" as the fireplace tools. Understand "flint and steel" as the fireplace tools. Understand "pan" as the fireplace tools. Understand "brush" as the fireplace tools. Understand "tools" as the fireplace tools.
After reading a command (this is the fireplace disambiguation rule):
	if the player's command includes "fireplace tools", replace the matched text with "tools".
Report dropping the fireplace tools when the location is Mirrored Study:
	say "You place the fireplace tools next to the fireplace. It now matches its reflection in the mirror.";
	rule succeeds.

The large fireplace is a container in Mirrored Study. The large fireplace is scenery. The description is "[fireplace status] [mantle status]". The reflection is "The fireplace is lit, with a gently burning fire illuminating the study. The mantle above it is empty save for a gold key." Understand "fire" as the large fireplace.

To say fireplace status:
	If the large fireplace is lit, say "The fireplace is lit, with a gently burning fire illuminating the study.[no line break]";
	otherwise say "The fireplace is unlit[if the pile of wood is in the large fireplace], though wood has been stacked inside in preparation for lighting it[end if].[no line break]".
	
To say mantle status:
	let detritus be the list of things on the mantle;
	if detritus is empty:
		say "The mantle above it is empty.[no line break]";
	otherwise if the number of entries in detritus is 1:
		say "The mantle above it is empty save for [an entry 1 in detritus].[no line break]";
	otherwise:
		say "On the mantle above it are [detritus with indefinite articles].[no line break]"
		
Rule for deciding the concealed possessions of the large fireplace: if the particular possession is the pile of wood, yes; otherwise no.

The pile of wood is in the large fireplace.

The mantle is a supporter. It is part of the large fireplace. Instead of examining the mantle: try examining the large fireplace.

The block burning rule is not listed in the check burning rulebook.
A check burning rule (this is the use the fireplace rule):
	if the player carries the noun and the player is in Mirrored Study:
		if the noun is a note or the noun is the pile of wood:
			say "(putting [the noun] in [the large fireplace])[command clarification break]".
A check burning rule (this is the fireplace one stop shop rule):
	if the noun is in the large fireplace, try burning the large fireplace instead.
A check burning rule (this is the burn held item rule):
	if the noun is not the large fireplace:
		say "This dangerous act [would achieve] little.";
		stop the action.
A check burning rule (this is the can only burn wood and wood products rule):
	let occupants be the list of things in the large fireplace;
	let kindling be the list of notes;
	remove kindling from occupants, if present;
	remove the pile of wood from occupants, if present;
	if occupants is not empty:
		say "I don't think setting [occupants with definite articles] alight would be a good idea.";
		stop the action.
A check burning rule (this is the ongoing blaze rule):
	if the large fireplace is lit:
		say "[fireplace status]";
		stop the action.
A check burning rule (this is the need flint and steel rule):
	if the fireplace tools are not discussed:
		say "[text of parser error internal rule response (N)] Maybe if I had the right tool...";
		stop the action;
	if the actor is not carrying the fireplace tools:
		carry out the implicitly taking activity with the fireplace tools;
	if the actor is not carrying the fireplace tools:
		stop the action.
A check burning rule (this is the need fuel rule):
	if the large fireplace does not contain the pile of wood:
		say "The fireplace is bereft of wood.";
	let kindling be the list of notes in the large fireplace;
	if kindling is empty:
		say "You create sparks, but the logs don't catch fire.";
		stop the action;
	if kindling is not empty and the number of entries in kindling is less than 3:
		say "You think about lighting it, but you want to make sure you have enough kindling first.";
		stop the action.
Carry out burning the large fireplace:
	now the noun is lit;
	now everything in the noun is nowhere.
Report burning the large fireplace:
	say "You light the fire in the fireplace.".
Instead of inserting something into a lit large fireplace: try burning the noun.

The grand mirror is scenery in Mirrored Study. The description is "The mirror reflects the entire room, and you could [bold type]look at[roman type] anything in the room in the mirror.". The reflection is "The grand mirror stares back at you.". Understand "take [text] from mirror" as a mistake ("You put your hand against the mirror, feel silly, and pull your hand away again.") when the location is Mirrored Study.

The suit of armor is scenery in Mirrored Study. The description is "Each suit of armor is a set of full plate, sized to fit a halfling or gnome, so it's much too small for you to wear.". Understand "give [something] to [the suit of armor]" as a mistake ("The armor, being empty, cannot take anything.") when the location is Mirrored Study.
Check attacking the suit of armor when the player has the battle-axe:
	say "The armor, whose interlocking plates are designed to deflect blades, deflects the blade.";
	stop the action.

The mirror statue is a privately-named statue in Mirrored Study. The printed name is "stone statue". Understand "stone" as the mirror statue. Understand "statue" as the mirror statue. Understand "halfling" as the mirror statue. The description is "The statue depicts a smiling halfling, lifting [a mug of ale] in the air as a toast. Across the face of the mug is lettering. [Detailed description of a random lettering that is part of the mug]".

The mug of ale is part of the mirror statue. The description is "[Detailed description of a random lettering that is part of the mug]". The mug of ale incorporates some lettering.

The bookshelves are a plural-named closed unopenable container in Mirrored Study. The bookshelves are scenery. The description is "The bookshelves reach the height of the ceiling and, barring the space in between for the writing desk, cover the entire width of the wall. They seem to be sorted by author rather than subject[if the bookshelves contain two books], and no gaps indicate any missing books[end if].". Understand "books" as the bookshelves. The carrying capacity is 2.

After reading a command when the location is Mirrored Study (this is the bookshelf search redirection rule):
	if the player's command matches "read books":
		replace the matched text with "search bookshelves";
	if the player's command includes "search for a book":
		say "I only understood you as far as wanting to look for a book.";
		reject the player's command.

Instead of searching the bookshelves: 
	now the bookshelves are open;
	say "You scan over the book spines, with most of the tomes being too dense or irrelevant to be worth notice. Near the end, however, you spot one that stands out. Just after 'Volo's Guide to Monsters' you see 'Volo's Guide to Spirits: Drinks and How to Order Them (In Any Language)'.".
	
A book is a kind of thing.

Volo's Guide to Monsters is a book in the bookshelves. The description is "[bracket]Description removed by Hasbro[close bracket]".

Volo's Guide to Spirits is a book in the bookshelves. The printed name is "Volo's Guide to Spirits: Drinks and How to Order Them (In Any Language)". Understand "drinks" as Volo's Guide to Spirits. Understand "Volo's drinks guide" as Volo's Guide to Spirits. The description is "It's too long to read in one sitting. Maybe you should just take it with you.".

The dining table is a supporter in Mirrored Study. The dining table is scenery. The description is "The table has chairs and place settings for six people, with plates, silverware, and folded napkins all laid out. [if the chalice is on the dining table]A decorative golden chalice sits in the middle of the table. [end if]There is no food or drink on the table.". The reflection is "The table has chairs and place settings for six people, with plates, silverware, and folded napkins all laid out. A decorative golden chalice sits in the middle of the table. There is no food or drink on the table."
Rule for deciding the concealed possessions of the dining table: if the particular possession is the golden chalice, yes; otherwise no.
Report putting the small golden chalice on the dining table:
	say "You set the golden chalice on the table. It now matches its reflection in the mirror.";
	rule succeeds.

The torn-out page is a note in Mirrored Study. The description is "The page appears to be from a journal. Most of the writing is unhinged, the author wondering if they are real or if they're trapped in the mirror and what they see as the reflection is actually the real world. One bit does stand out, however. 'The key is the key. It's on the mantle, but it's not.'". The target score is 5. [It _should_ be burned by then though.]

The ornamental weapons are a fixed in place plural-named thing in Mirrored Study. The description is "There are a variety of ornamental weapons on the wall, including a pair of crossed swords, a bow, [if the ornamental weapons are complete]a pair of crossed battle-axes[otherwise]a battle-axe[end if], and a long jousting lance.". The reflection is "There are a variety of ornamental weapons on the wall, including a pair of crossed swords, a bow, a pair of crossed battle-axes, and a long jousting lance.". Understand "southern wall" as the ornamental weapons. Understand "wall" as the ornamental weapons. The ornamental weapons can be complete or incomplete. The ornamental weapons are incomplete. Instead of putting something on the ornamental weapons: try inserting the noun into the second noun.

To place is a verb.
Check inserting the battle-axe into the ornamental weapons (this is the home of the battle-axe rule):
	try silently dropping the battle-axe;
	now the battle-axe is fixed in place;
	now the battle-axe is not handled;
	now the ornamental weapons are complete;
	say "[The actor] [place] the battle-axe on the wall with its mate. It now matches its reflection in the mirror.";
	stop the action.
The home of the battle-axe rule is listed before the can't insert into what's not a container rule in the check inserting it into rules.

Every turn while the golden key is not handled (this is the mirage of the golden key rule):
	if the large fireplace is lit and the golden chalice is on the dining table and the feather quill is in the pot of ink and the ornamental weapons are complete and the fireplace tools are in Mirrored Study:
		now the golden key is on the mantle;
	otherwise:
		now the golden key is nowhere.
	
After taking the golden key for the first time:
	increment the score;
	continue the action.

Chapter 7 - The Solar Bridge

East Wing Chasm is a room in East Wing. It is north of the greenhorn door. The description is "As you enter the room, you see that the floor ahead drops away suddenly into a deep chasm that stretches the entire width of the room. The ceiling above the chasm extends upward fifty feet. Hanging from that ceiling, you see several wooden platforms suspended on chains. [if the chasm puzzle is not solved]The platforms are arranged in a scattered pattern of different locations and heights.[otherwise]The platforms seem to form a bridge across the chasm.[end if] Near the wall to the east, you see a group of six chains hanging from the ceiling. Each chain has a circular medallion hanging from the end of it." Index map with room-name of East Wing Chasm set to "Chasm".

After reading a command when the player is in East Wing Chasm (this is the medallion depluralization rule):
	let instruction be "[the player's command]";
	replace the text "medallions" in instruction with "medallion A";
	change the text of the player's command to instruction.

A medallion is a kind of thing.  A medallion is always privately-named. The description is "Each medallion has markings painted onto it." Instead of pulling a medallion that is part of a chain (called the rope): try pulling the rope.
A chain is a kind of device. Chains are always privately-named fixed in place scenery. A chain has a number called the correct pull. A chain has a number called the actual pull. Instead of pulling a chain: try switching on the noun.
Check switching off a chain:
	say "You don't know how to un-pull a chain.";
	rule fails.

Chain A is a chain in East Wing Chasm. Understand "chain A" as Chain A. The correct pull is 4.  Medallion A is a medallion that is part of Chain A. Understand "medallion A" as Medallion A.
Chain B is a chain in East Wing Chasm. Understand "chain B" as Chain B. Medallion B is a medallion that is part of Chain B. Understand "medallion B" as Medallion B.
Chain C is a chain in East Wing Chasm. Understand "chain C" as Chain C. The correct pull is 1.  Medallion C is a medallion that is part of Chain C. Understand "medallion C" as Medallion C.
Chain D is a chain in East Wing Chasm. Understand "chain D" as Chain D. Medallion D is a medallion that is part of Chain D. Understand "medallion D" as Medallion D.
Chain E is a chain in East Wing Chasm. Understand "chain E" as Chain E. The correct pull is 3.  Medallion E is a medallion that is part of Chain E. Understand "medallion E" as Medallion E.
Chain F is a chain in East Wing Chasm. Understand "chain F" as Chain F. The correct pull is 2.  Medallion F is a medallion that is part of Chain F. Understand "medallion F" as Medallion F.

The chasm puzzle is a puzzle. The gate is the bridge. The chasm puzzle has a truth state called reported on. Chain A controls the chasm puzzle. Chain B controls the chasm puzzle. Chain C controls the chasm puzzle. Chain D controls the chasm puzzle. Chain E controls the chasm puzzle. Chain F controls the chasm puzzle.

Carry out an actor switching on a chain that controls the chasm puzzle (this is the Jacob Marley rule): 
	now the actual pull of the noun is the number of chains that are switched on that control the chasm puzzle;
	verify the chasm puzzle.
The Jacob Marley rule is listed after the standard switching on rule in the carry out switching on rulebook.

Check solving the chasm puzzle:
	if the number of switched on chains that control the chasm puzzle is less than four:
		make no decision;
	repeat with rope running through chains that control the chasm puzzle:
		let AP be the actual pull of the rope;
		let CP be the correct pull of the rope;
		if AP is not CP, the puzzle is failed;
	the puzzle is solved. [Note: This causes the score to go up immediately instead of after crossing the bridge. Technically a bug, but...]
	
Failure to solve the chasm puzzle:
	repeat with rope running through chains that control the chasm puzzle:
		now the actual pull of the rope is 0.
	
Report switching on a chain that controls the chasm puzzle (this is the chain report switching on rule):
	if success report pending is true:
		say "As you pull the chain, the platforms adjust once again, moving up and down, and rotating in all directions. When the shapes finish moving, they come to a halt in a position that provides a bridge across the chasm.";
		now success report pending is false;
		rule succeeds;
	otherwise:
		say "As you pull the chain, you feel resistance from springs and mechanical devices attached to the chain in the ceiling above. The sounds of gears grinding and chains moving echo off the walls of the chamber. You notice that one of the platforms hanging from the ceiling has changed position and moved closer to the ground, while another platform moved up toward the ceiling.";
		if failure report pending is true:
			say "[line break]The chains that you've pulled begin to retract again, the platforms shifting back to their original positions near the ceiling. A sudden gust of wind erupts behind you, and you almost get blown into the chasm by the force of the magical gale. By the time you recover, it seems the entire puzzle has reset.";
			now failure report pending is false;
		rule succeeds.

The bridge is a privately-named closed unopenable door. It is north of East Wing Chasm. Understand "platforms" as the bridge. Understand "wooden platforms" as the bridge. Understand "bridge" as the bridge when the chasm puzzle is solved. Understand "cross [the bridge]" as entering. The description is "[if the bridge is closed]The platforms are arranged in a scattered pattern of different locations and heights. Some are very close to the ceiling, while others are only twenty feet above you.[otherwise]The platforms seem to have come to rest such that they form a bridge across the chasm.[end if]".

The void is privately-named scenery in East Wing Chasm. The printed name is "chasm". Understand "chasm" as the void. The description is "Looking over the edge, you see nothing but darkness. The pit descends down further than you can see.".

The ceiling is scenery in East Wing Chasm. The description is "The ceiling above the chasm extends upward fifty feet. Hanging from that ceiling, you see several wooden platforms suspended on chains.".

The first report going rule (this is the chasm puzzle solve rule):
	if the door gone through is the bridge and reported on of the chasm puzzle is false:
		now reported on of the chasm puzzle is true;
		say "You cross safely over the chasm.[paragraph break]".

Section 7Z

Carry out examining a medallion (this is the medallions visualization rule):
	say "Each medallion has a square inset for some painted markings, containing:[line break]	A: a single horizontal line,[line break]	B: a six-pointed star in front of a horizontal line,[line break]	C: an upper-left quarter circle just above the far right of a horizontal line,[line break]	D: a circle below a horizontal line,[line break]	E: an upper-right quarter circle just above the far left of a horizontal line,[line break]	F: a circle above a horizontal line.";
	now examine text printed is true.
	
The medallions visualization rule is listed before the standard examining rule in the carry out examining rulebook.
The standard examining rule does nothing when examining a medallion.


Section 7G (for Glulx only)

Figure of the Medallions is the file "medallions.png".

This is the medallions illustration rule:
	if examining a medallion:
		if graphics are supported:
			say the description of the noun;
			display the Figure of the Medallions;
		otherwise:
			abide by the medallions visualization rule;
		now examine text printed is true;
	continue the action.
	
The medallions illustration rule is listed instead of the medallions visualization rule in the carry out examining rulebook.

Chapter 8 - The Darkness

A glowing crystal is a kind of thing. It is always lit scenery.

A sconce is a kind of thing. It is always lit scenery. Understand "sconce" as a sconce. The description is "The sconce is made predominantly of iron, with thin metal bands wrapped decoratively around a glowing crystal.". Every sconce incorporates a fixed in place glowing crystal. 
Check taking a fixed in place glowing crystal: 
	say "Unsurprisingly, you cannot bend iron with your bare hands.";
	stop the action.
Check of taking a sconce: 
	say "Try as you might, you are unable to pull the sconce from the wall.";
	stop the action.

East Wing Hallway is a room in East Wing. East Wing Hallway is north of the bridge. The description is "You step into a long, carpeted hallway. A single sconce illuminates the immediate area, while the rest of the hallway disappears into darkness to the north.". East Wing Hallway contains a sconce. Index map with room-name of East Wing Hallway set to "Hall S".

East Wing Darkness is a region in East Wing. Index map with room-colour of East Wing Darkness set to "Black". Index map with room-name-colour of East Wing Darkness set to "White". Index map with room-name of East Wing Darkness set to "Dark".

Darkness South South is a dark room in East Wing Darkness. Darkness South is north of East Wing Hallway.

Darkness Center is a dark room in East Wing Darkness. Darkness Center is north of Darkness South.

Darkness North is a dark room in East Wing Darkness. Darkness North is north of Darkness Center.

Stumbling in darkness is a truth state that varies.

The last carry out going rule:
	if the room gone to is lit:
		now stumbling in darkness is false;
	if the room gone to is Darkness Center:
		now stumbling in darkness is true.
		
This is the maybe stumbling in darkness rule:
	if stumbling in darkness is true:
		now the noun is the opposite of the noun.
		
The maybe stumbling in darkness rule is listed before the determine map connection rule in the check going rulebook.

After going:
	if the location is the East Wing Septentrion Hallway and the location is unvisited:
		increment the score;
	continue the action.

East Wing Septentrion Hallway is a room in East Wing. East Wing Septentrion Hallway is north of Darkness North. The printed name is "East Wing Hallway, North". East Wing Septentrion Hallway contains a sconce. The description is "You approach a closed door illuminated by a single sconce. In the northwest corner of the room, you see [a statue of an elven ranger] with a bow and quiver slung across her back, arms spread wide in a friendly gesture." Index map with room-name of East Wing Septentrion Hallway set to "Hall N". 

The statue of an elven ranger is a statue in East Wing Septentrion Hallway. The description is "It is a stone statue of an elven ranger with a bow and quiver slung across her back, arms spread wide in a friendly gesture. Across her sleeve is some lettering. [Detailed description of a random lettering that is part of the statue of an elven ranger]". Understand "elf" as the statue of an elven ranger. Understand "bow" as the statue of an elven ranger. Understand "quiver" as the statue of an elven ranger. The statue of an elven ranger incorporates some lettering.
Check taking the statue of an elven ranger:
	say "The statue is too heavy for you to lift.";
	stop the action.

After reading a command when the player is in East Wing Septentrion Hallway (this is the EWHN weapons consolidation rule):
	if the player's command includes "and quiver":
		cut the matched text.

Chapter 9 - The Depository

Depository is a room in East Wing. The printed name is "East Wing Vault". The description is "You enter what can only be described as a treasure vault belonging to a compulsive hoarder. The room is filled with stacks of boxes, chests of drawers, and safes all piled up in a way that looks barely stable, with narrow walkways between them. In one corner of the room, [mannequins] in armor are pressed together, while in another, [figurines] are stacked and crammed together.[first time][paragraph break]As you enter the room and look around at the treasures surrounding you, you fail to notice a stack of gold coins piled against the wall. You kick over the stack and send the coins scattering across the floor. Within moments, a small crab-like creation emerges from a nearby hole in the wall and heads toward the spilled coins. You notice that the creature is made up of various gears and springs as its claws work to pick up the coins and place them back in a stack. Once the coins are ordered, the automaton disappears back into the wall.[only]". Index map with room-name of Depository set to "Vault"

Check taking anything in Depository:
	if the noun is handled and the score is less than 8:
		continue the action;
	if the noun is a note and the score is less than 8:
		continue the action;
	if the noun is a key:
		continue the action;
	say "That would be stealing, and stealing is wrong.";
	stop the action.

The depository door is a door. It is north of East Wing Septentrion Hallway and south of Depository. The printed name is "stone door". Understand "stone" as the depository door. Understand "stone door" as the depository door. The description is "It is a simple stone door with an iron handle, set in the north wall."
Report opening the depository door:
	say "The door opens easily enough.";
	rule succeeds.
	
Some mannequins are plural-named scenery in Depository. The description is "The mannequins aren't exactly posed well to show off the armor on them, like the ones from the study were.".

The mannequin armor is privately-named plural-named scenery in Depository. The printed name of the mannequin armor is "armor". Understand "armor" as the mannequin armor. Understand "armor on/from/atop/to [the mannequins]" as the mannequin armor.

Some figurines are plural-named scenery in Depository. The printed name is "statues". The description is "Most of the statues are the same sort of stone statues that have appeared throughout the UNDOT. One of the statues is of a dwarf priest in long, flowing robes, with hands folded in prayer and a small book with lettering on the cover hanging from his belt. [Detailed description of a random lettering that is part of the prayer book][first time] Another one... isn't a statue at all, but is [a depository adventurer]. The automatons must have mistaken the corpse for a statue.[only]".

After reading a command when the location is Depository (this is the figurine disambiguation rule):
	if the player's command includes "statues":
		replace the matched text with "figurines".

The dwarf priest statue is a statue in Depository. The description is "The distinctive statue is of a dwarf priest in long, flowing robes, with hands folded in prayer and a small book with lettering on the cover hanging from his belt. [Detailed description of a random lettering that is part of the prayer book]". The prayer book is part of the dwarf priest statue. The prayer book incorporates some lettering.

The depository adventurer is a corpse in Depository. The printed name is "dead adventurer". The description is "The adventurer looks emaciated, much like the one that starved to death in the study. [if the journal page is not handled]At first glance, you think the automatons must have sorted away all his possessions, but then you find a small note they must have missed.[end if]"

The journal page is a privately-named note in Depository. The printed name is "note". Understand "note" as the journal page. The description is "It is partially damaged from age, but you can make out '...keys at the end of each wing. I'll find the west wing key, you find the east...'.". The target score is 8.
Check examining the journal page when the noun is not carried:
	carry out the implicitly taking activity with the noun;
	if the noun is not carried:
		stop the action.
After examining the journal page for the first time:
	say "A crab-like automaton snatches the note from your hand. You watch as it marches to one box in particular and slips the note inside. The automaton then returns to wherever it goes inside the wall.";
	now the noun is in the box of notes;
	now the box of notes is described.
	
The stack of gold coins is scenery in Depository. The description is "They are small gold coins, stamped with the face of a person you don't recognize. They're probably currency of some foreign nation.".
	
The stack of boxes is scenery in Depository.

The box of notes is a closed openable undescribed privately-named container in Depository. Understand "box of notes" as the box of notes when box of notes is described. Understand "box [any journal page] is/was in" as the box of notes when box of notes is described. The description is "It looks like all the other boxes around it.". Instead of searching the box of notes: say "It's full of other scraps of paper, most of which are in languages you don't understand.". Does the player mean doing anything to the box of notes when the box of notes is described: it is likely.

The pile of safes is scenery in Depository.

The safe of keys is a closed openable undescribed privately-named container in Depository. Understand "safe" as the safe of keys when the safe of keys is described. Understand "safe of keys" as the safe of keys when the safe of keys is described. Understand "safe [any handled key] was in" as the safe of keys when the safe of keys is described. Understand "safe [any handled key] was taken to" as the safe of keys when the safe of keys is described. Does the player mean doing anything to the safe of keys when the safe of keys is described: it is likely.

Vault shutdown pending is a truth state that varies.
After taking a key in the Depository:
	if the golden key is carried and the silver key is carried and the score is less than 8:
		increment the score;
		now vault shutdown pending is true;
	continue the action.

After dropping a key in the Depository:
	say "You drop [the noun] on the ground, and a clockwork crab scoops it up and carries it to a safe.";
	now the noun is in the safe of keys;
	now the safe of keys is described.

This is the shut down the vault rule:
	If vault shutdown pending is true:
		now vault shutdown pending is false;
		if the journal page is carried:
			say "With no more need for the note, you drop it on the floor for the automaton to sort.";
			now the journal page is in the box of notes.
The shut down the vault rule is listed after the notify frustration changes rule in the turn sequence rulebook.
		
Instead of dropping, inserting, or putting when the location is Depository and the score is greater than 7:
	say "You should probably hold onto those keys.".

The hole is scenery in Depository. The description is "If you didn't know better, you'd think it was just mice or rats that made the hole.". Instead of searching the hole: say "[bold type]Darkness[roman type][line break][run paragraph on with special look spacing]It is pitch black. You are likely to be- nevermind.".

Chapter 10 - Fresco Room

North Wing is a region.

Fresco Room is a room in North Wing. It is north of the massive stone door. The description is "You enter an unfurnished room, with a door in [the north wall] concealed in a painted fresco that covers all four walls of the room. The fresco depicts a tavern full of people of all sorts of races and social standings. On [the east wall], a bartender serves drinks to people sitting at the bar. On [the west wall], tables and chairs are full of patrons drinking, singing, and laughing together. On [the south wall], a bardic troupe plays for the tavern while people dance in front of them. On [the north wall], [the tavern door] is painted around an actual door, and patrons sit at tables playing dice and cards." Index map with room-name of Fresco Room set to "Fresco".

The north wall fresco is scenery in Fresco Room. Understand "dice players" as the north wall. Understand "card players" as the north wall. Understand "dice and card players" as the north wall. The description is "On the north wall, the tavern door is painted around an actual closed door, and patrons sit at tables playing dice and cards.". The elven ranger painting is part of the north wall. The description is "The elven ranger is on the north wall, playing cards at a table.". Understand "sleeve" as the elven ranger painting. Understand "sleeve of elven ranger" as the elven ranger painting.
The south wall fresco is scenery in Fresco Room. Understand "bardic troupe" as the south wall. Understand "bards" as the south wall. The description is "On the south wall, a bardic troupe plays for the tavern while people dance in front of them.".
The east wall fresco is scenery in Fresco Room. Understand "bar" as the east wall. Understand "bartender" as the east wall. The description is "On the east wall, a bartender serves drinks to people sitting at the bar.". The drinks are part of the east wall. The description is "The drinks appear to be a variety of beers, wines, and spirits.".
The west wall fresco is scenery in Fresco Room. The description is "On the west wall, tables and chairs are full of patrons drinking, singing, and laughing together.". The treefolk painting is part of the west wall. The description is "The treefolk is on the west wall, sitting at a table with a drink in its hand.". Understand "sylvan" as the treefolk painting.
Understand "examine ceiling" as a mistake ("This is the UNDOT, not the Cistine Chapel!") when the location is Fresco Room.
Understand "examine floor" as a mistake ("No need to be bashful!") when the location is Fresco Room.

The tavern door is a closed unopenable door. The tavern door is north of Fresco Room. The description is "The closed door is flush to the wall, with no visible handle, keyhole, or other means of opening it.". Understand "closed door" as the tavern door.

After going to Fresco Room for the first time:
	increment the score;
	now the golden key is nowhere;
	now the silver key is nowhere;
	continue the action.

Password anagram mentioned is a truth state that varies.
Instead of answering when the location is Fresco Room:
	if the topic understood includes "we" and the topic understood includes "the" and the topic understood includes "are" and the topic understood includes "all" and the topic understood includes "together" and the topic understood includes "key":
		now password anagram mentioned is true;
	if the topic understood matches "All together we are the key" and the tavern door is closed:
		say "When you finish speaking, the door in the north wall slides open.";
		now the tavern door is open;
	otherwise:
		say "Nothing happens."
		
Chapter 11 - UNDOT Peak

UNDOT Peak is a room in North Wing. It is north of the tavern door. The description is "You enter a luxuriously appointed room with fine furniture and rugs. At the center of the room is a [small round table][if the documentation scroll is on the small round table][passing mention of the documentation scroll] with a scroll sitting atop it, labeled 'READ ME'[end if]. Off to one side is a bar with flutes of champagne and a charcuterie board.".

The small round table is a supporter in UNDOT Peak. It is scenery.

The documentation scroll is a thing on the small round table. The printed name is "a scroll labeled 'READ ME'". The description is "The scroll reads:[paragraph break][blockquote style]Congratulations! You have worked together to achieve the first victory of - hopefully - many, paving the way for a new rise in Interactive Fiction with the addition of multiplayer! Your help has been instrumental in making this game a real product, and I couldn't have done it without you! I'd also like to take this opportunity to thank:[paragraph break]Steve 'Jaspor' Orr and Bill Putrino, for writing the puzzles adapted here.[line break]Bill Putrino, Christian Petermann, AeronDrake, and QalarValar for maps and images.[line break]TwelveBaud, for writing and coding.[line break]AFancyQuestionMark, Hal Incandenza, kaschei, Maerlyn, My Second Re-Reg, Opoponax, Tea Party Crasher, Your Personal Muse, and yuming, for being the first beta testers of this game.[paragraph break]Now go forth, and engage in jolly co-operation![roman type]".

After examining the documentation scroll for the first time: increment the score; end the story finally.

The bar is a supporter in UNDOT Peak. It is scenery. The charcuterie board is a fixed in place supporter on the bar. The description is "It is a cheese board arranged with a delightful variety of cheeses, crackers, and cured meats.". A champagne flute is a kind of thing. The printed name is usually "flute of champagne". The printed plural name is usually "flutes of champagne". The description is usually "The champagne looks pleasantly bubbly; the bar is probably enchanted to prevent the drinks from going flat.". Champagne flutes are always edible. To drink is a verb. Instead of drinking a champagne flute: try eating the noun. The bar supports 16 champagne flutes. A sandwich is a kind of thing. The printed name is usually "meat and cracker sandwich". The printed plural name is usually "meat and cracker sandwiches". Understand "meat" as a sandwich. Understand "cracker" as a sandwich. Sandwiches are always edible. The charcuterie board supports nine sandwiches.

Understand "eat [things]" as eating. Understand "drink [things]" as drinking. Rule for deciding whether all includes inedible things while eating or drinking: it does not.
 
The standard report eating rule response (A) is "[if the noun is a champagne flute][We] [drink] [the noun]. A good vintage.[command clarification break]Having no further use for the glass, you cast it off the tower.[otherwise][We] [eat] [the noun]. Not bad.[end if]".

Victory Lap is a scene. Victory lap begins when the player is in UNDOT Peak for the first time. The advance time rule does nothing if Victory Lap is happening.

Part III - Appendices

Chapter T - Thinking

Understand the command "think" as something new. Pontificating is an action out of world and applying to one topic. Understand "think about/-- [text]" as pontificating. [Because "thinking" is hardcoded in the standard rules to not accept any other information. Sigh...]

Carry out pontificating:
	if the topic understood includes "mural room" and password anagram mentioned is true:
		say "[thoughts about lettering]";
		rule succeeds;
	repeat through the Table of Thoughts:
		if the topic understood includes thought entry:
			say "[response entry][paragraph break]";
			rule succeeds;
	say "Nothing comes to mind.".
	
Understand "translation" or "statue lettering" as "[foreign gibberish]".

Table of Thoughts
thought (a topic)	response
"[a lettering]" or "[a statue]" or "[foreign gibberish]"	"[thoughts about lettering]"
"entering the UNDOT"	"The mechanism to open the door must be on the dais somewhere. Have you looked at both the diamond and filigree?"
"[the golden chalice]"	"[if the Mirrored Study is not visited]You're not thirsty right now, but it might come in handy later.[otherwise]Maybe the mirror can tell us where this goes.[end if]"
"glyphs"	"[if the location is West Wing Hall 2 and the door is discussed]It is clear the glyphs open the door, and you can surmise from the behavior of the gems that either four are correct and order matters, or three are correct and order doesn't matter.[otherwise]While letters might technically qualify as 'glyphs', the glyphs on the note are not the same as any lettering you've seen.[end if]"
"where to write"	"[if the Mirrored Study is not visited]Having a quill with no ink, there's only one way to write anything, and that's in the sand.[otherwise]You probably don't need to write anymore.[end if]"
"inverted runes"	"Do the runes look the same from the north as from the south?"
"[the stone bowl]" or "[the sand]"	"You need to write something in the sand. Standing by the sand, you see inverted reflected runes on the sword blade."
"how to alter the runes"	"If you look at the runes from the bowl of sand in the blade's reflection, they are both reflected and inverted."
"[the large fireplace]"	"[if the large fireplace is lit]This seems right; what about the rest of the room?[otherwise if the number of things in the large fireplace is less than four]Do you have anything flammable from previously solved puzzles?[otherwise if the player does not have the fireplace tools]You might need something to light the fire.[otherwise]The reflection shows the logs on fire.[end if]"
"[any key]" or "keys"	"[if the large fireplace is not lit]Do you have anything flammable from previously solved puzzles?[otherwise if the golden key is not handled]If only you could make the room match its reflection...[otherwise if all keys are carried]You have all the keys.[otherwise]You may need another key.[end if]"
"platforms"	"You can't brute-force the puzzle by watching the platforms move."
"the/-- medallions" or "[a medallion]"	"[one of]The paintings on the medallions must hint at the order to pull the chains.[or]They seem to depict a celestial body moving through the sky.[cycling]"
"hallway"	"There's only one way to go, right?"
"scones"	"Scones without some kind of spread or topping are basically a food crime."
"titles for players with 6 points"	"There's nothing wrong with being a Trainee."
"[the massive triangular lock system]" or "lock"	"How many of the 120 locks need to be unlocked?"
"star/stars" or "star/stars on [the massive stone door]"	"Sometimes a star is just a star."
"[the tavern door]" or "closed door"	"Only one puzzle left, and you still haven't translated the lettering on the statues, have you?"
"any missed areas"	"What missed areas?" [note: probably something involving "the list of unvisited rooms not adjacent to the location", but the thread never brought it up before endgame, so...]

To say thoughts about lettering:
	if the score is less than 9:
		say "[one of]You can't do anything with the lettering until you find a way to translate it.[or]There must be something inside the UNDOT that could help you with translation.[or]Eventually, you'll need to find a translation guide.[cycling][no line break]";
	otherwise if Volo's Guide to Spirits is not held:
		say "You probably need some kind of book to translate them. Where have you seen books?[no line break]";
	otherwise if password anagram mentioned is true:
		say "That isn't the only way to order those words into a sentence.[no line break]";
	otherwise:
		say "Everything about this puzzle is related to language, and your clues are all words...[no line break]".

Chapter N - Numerics

[Courtesy Andrew Plotkin, the Inform 6 maintainer.]

The solicited input is a snippet that varies. The input prompt is a text that varies.

To solicit input: 
	say the input prompt;
	capture input.

To capture input:  (-
		KeyboardPrimitive(buffer, parse);
		(+ the solicited input +) = 100 + WordCount();
	-)

To decide what number is the numeric equivalent of (P - snippet): (- SnippetToNumber({P}) -).

Include (-
! This only recognizes zero and positive numbers. It accepts English words "zero" to "thirty" and digit forms up to 10000. If the snippet is not a number, or contains more than one word, this returns -1000.
[SnippetToNumber snip   snippos sniplen;
	snippos = snip/100;
	sniplen = snip%100;
	if (sniplen ~= 1)
		return -1000;
	return TryNumber(snippos);
];
-).

To solicit a number:
	solicit input;
	while the numeric equivalent of the solicited input is -1000:
		say "[text of parser error internal rule response (D)][line break]";
		solicit input.
		
Chapter G - Graphics
		
Section GZ - Z-machine Lack of Graphics (for Z-machine only)

To decide whether graphics are supported: decide no.
To say blockquote style: say "".

Section GG - Glk Graphics (for Glulx only)
		
To decide whether graphics are supported: (- (glk_gestalt(6,0) && glk_gestalt(7,3)) -).
To say blockquote style: (- (glk_set_style(7)) -).
To set the blockquote style: (- (glk_stylehint_set(0, 7, 0, 3)) -).
A startup rule:
	set the blockquote style.