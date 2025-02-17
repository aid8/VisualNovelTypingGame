extends Node

const VERSION = "1.0.3"
const MAX_CHAPTERS = 8
const ALTERNATIVE_CHAPTERS = [0, 1, 1, 1, 1, 1, 0, 0]
const LETTER_MASTERY_ACCURACY_BOUND = 0.90
#Words that have (word_mastery_accuracy_bound) 94% mastery that is typed more than or equal to (word_mastery_cound_bound) 100 times will be ignored in story mode
const WORD_MASTERY_ACCURACY_BOUND = 0.94 #0.94
const WORD_MASTERY_COUNT_BOUND = 100 #100

#const HTTP_HEADERS = ["Content-Type: application/x-www-form-urlencoded"]
#const URLFORM = "https://docs.google.com/forms/u/1/d/e/1FAIpQLScCUJsnlPklq-3GZWOoeOUJQNjR1xzrpihZKq6c7T58jrXOsQ/formResponse"
#const FORM_ENTRY_CODES = {
#	"day" : "entry.1937603671",
#	"name" : "entry.1677198908" ,
#	"date" : "entry.1636518983",
#	"wpm" : "entry.783576330",
#	"accuracy" : "entry.2103345753", 
#	"other_info" : "entry.308180882",
#}

#const TOTAL_COLLECTION_TIME = 600
#const STORY_MODE_COLLECTION_TIME = 300
#const CHALLENGE_MODE_COLLECTION_TIME = 300
#const IDLE_TIME = 8

const TUTORIAL_TEXT = [
	#Challenge 1
	[
		"FRUITS WILL FALL ON EACH PLATFORM", 
		"TYPE THE WORDS ON THE PLATFORM TO SWITCH THE CHARACTER", 
		"PRESS TAB TO CANCEL THE WORD BEING TYPED",
		"GET THE FRUITS TO SCORE. FAILING TO DO SO WILL LOSE LIVES", 
		"THE GOAL IS TO COLLECT FRUITS AND SCORE AS MUCH AS POSSIBLE",
	],
	
	#Challenge 2
	[
		"SLIMES WILL APPROACH YOUR BASE",
		"TYPE THE WORDS ABOVE THE SLIME TO KILL THEM",
		"ONCE THE SLIMES REACH THE BASE, YOU WILL LOSE LIVES",
		"SCORE AND SURVIVE AS LONG AS POSSIBLE",
	],
	
	#Challenge 3
	[
		"MATCH TILES BY TYPING THE WORD ON THE TILE WITH SAME COLORS",
		"EACH COLOR OF THE TILES WILL HAVE DIFFERENT POWERUPS",
		"GREEN TILES INCREASES SCORE MULTIPLIER",
		"BLUE TILES FREEZES TIME TIMER AND RED TILES SPEEDS UP TILE RESPAWN",
		"A TIMER BAR WILL BE SHOWN ABOVE INDICATING TIME LEFT FOR EACH POWERUPS",
		"PRESS TAB TO CANCEL THE TILE BEING TYPED",
		"MATCH TILES AS MANY AS POSSIBLE FOR 1 MINUTE",
		"USE THE POWERUPS FOR YOUR ADVANTAGE TO FURTHER INCREASE YOUR SCORE",
	],
	
	#Challenge 4
	[
		"BRICKS WILL FALL DOWN ON THE STAGE",
		"TYPE THE WORDS ON THE BRICK TO DESTROY IT",
		"ONCE THE BRICK HAS REACHED BELOW THE STAGE, IT WILL BE DISABLED",
		"BRICKS STACKED WITH EACH OTHER WILL ALSO BE DISABLED",
		"THE WORDS ON THE DISABLED BRICKS WILL TURN RED AND WILL NOT BE TYPABLE",
		"SCORE AND DESTROY BRICKS AS MANY AS POSSIBLE",
	],
	
	#Challenge 5
	[
		"BALLS WILL BE SCATTERED AROUND THE MAP",
		"TYPE THE WORD ON THE DIRECTION OF THE TEXT TO MOVE IN THAT DIRECTION",
		"PRESS TAB TO CANCEL, GET THE BALLS TO SCORE",
		"COLLECT BALLS AS MANY AS POSSIBLE FOR 1 MINUTE",
	],
	
]

const CREDITS = [
	[
		"Typing Tales by Barbara Fan Club"
	],
	[
		"Programming and Researchers",
		
		"Christian Dia",
		"Samuel Mark Dy Reyes",
		"Josef Papillera",
	],
	[
		"Art Styles",
		
		"NORANEKO",
		"EXUIN",
		"FSHIFT",
		"ANSIMUZ",
		"ANALOG STUDIOS",
		"KENNEY",
		"FINALBLUEBOSS",
		"STA.TOASTY",
		"HUNGRYMONKEY9",
		"https://4you.bz/rule",
	],
	[
		"Novel",
		
		"LITTLE WOMEN BY Louisa May Alcott",
	],
	[
		"Music",
		
		"Tim Reichert",
		"Saurabh Chaudary",
	],
	[
		"Sound Effects",
		
		"https://www.fesliyanstudios.com",
		"https://www.bfxr.net/",
	],
	[
		"Tools used",
		
		"Developed with Godot Engine",
	],
	[
		"Special thanks",
		
		"Adrian Leo Pajarillo",
	],
	[
		"Version",
		
		VERSION
	]
]

const DISCLAIMER_TEXT = "THE CURRENT BUILD OF THIS VERSION IS FOR RESEARCH PURPOSES. GAME DATA SUCH AS WPM AND ACCURACY WILL BE SENT TO THE RESEARCHERS. THANK YOU FOR YOUR PARTICIPATION."

var characters = {
	#Character 1
	"Amy" : {
		"ImagePath" : "",
	},
	#Character 2
	"Beth" : {
		"ImagePath" : "", 
	},
	#Character 3
	"Meg" : {
		"ImagePath" : "",
	},
	"Laurie" : {
		"ImagePath" : "",
	},
}

var backgrounds = {
	#HOME
	"Home_Fireplace" : {
		"Animation" : "Home",
		"Frame" : 0,
		"Location" : "Home, Fireplace",
	},
	
	"Home_Attic" : {
		"Animation" : "Home",
		"Frame" : 1,
		"Location" : "Home, Attic",
	},
	
	"Home_Bedroom" : {
		"Animation" : "Home",
		"Frame" : 2,
		"Location" : "Home, Bedroom",
	},
	
	"Home_Fireplace1" : {
		"Animation" : "Home",
		"Frame" : 3,
		"Location" : "Home, Fireplace 2",
	},
	
	"Home_Garret_Stairs1":{
		"Animation" : "Home",
		"Frame" : 4,
		"Location" : "Home, Garret Stairs1",
	},
	
	"Home_Garret_Stairs":{
		"Animation" : "Home",
		"Frame" : 5,
		"Location" : "Home, Garret Stairs",
	},
	
	"Home_Outside":{
		"Animation" : "Home",
		"Frame" : 6,
		"Location" : "Home, Outside",
	},
	
	"Home_Kitchen":{
		"Animation" : "Home",
		"Frame" : 7,
		"Location" : "Home, Kitchen",
	},
	
	"Home_DiningRoom":{
		"Animation" : "Home",
		"Frame" : 8,
		"Location" : "Home, Dining Room",
	},
	
	"Laurence_Home":{
		"Animation" : "LaurenceHome",
		"Frame" : 0,
		"Location" : "Laurence Home, Living Room",
	},
	
	"Laurence_Home_Living_Room":{
		"Animation" : "LaurenceHome",
		"Frame" : 1,
		"Location" : "Laurence Home, Living Room",
	},
	
	"Laurence_Home_Study_Room":{
		"Animation" : "LaurenceHome",
		"Frame" : 2,
		"Location" : "Laurence Home, Grandpa Study Room",
	},
	
	#SCHOOL
	"School_Classroom1" : {
		"Animation" : "School",
		"Frame" : 0,
		"Location" : "School_Classroom1",
	},
	
	"School_Entrance" : {
		"Animation" : "School",
		"Frame" : 1,
		"Location" : "School Entrance",
	},
	
	"School_Hallway" : {
		"Animation" : "School",
		"Frame" : 2,
		"Location" : "School Hallway",
	},
	
	"School_library" : {
		"Animation" : "School",
		"Frame" : 3,
		"Location" : "School Library",
	},
	
	"School_Piano_Room" : {
		"Animation" : "School",
		"Frame" : 4,
		"Location" : "School Piano Room",
	},
	
	#OUTSIDE
	"School_sunrise" : {
		"Animation" : "Outside",
		"Frame" : 0,
		"Location" : "School Outside",
	},
	
	"Festival" : {
		"Animation" : "Outside",
		"Frame" : 1,
		"Location" : "Outside Festival",
	},
	
	"Convenience_Store_Outside" : {
		"Animation" : "Outside",
		"Frame" : 2,
		"Location" : "Convenience Store Outside",
	},
	
	"Convenience_Store_Inside" : {
		"Animation" : "Outside",
		"Frame" : 9,
		"Location" : "Convenience Store Inside",
	},
	
	"Ball" : {
		"Animation" : "Outside",
		"Frame" : 10,
		"Location" : "Ballroom",
	},
	
	"Slums" : {
		"Animation" : "Outside",
		"Frame" : 3,
		"Location" : "Slums",
	},
	
	"Street_Day" : {
		"Animation" : "Outside",
		"Frame" : 4,
		"Location" : "Streets",
	},
	
	"Street_Evening" : {
		"Animation" : "Outside",
		"Frame" : 5,
		"Location" : "Streets",
	},
	
	"Street_Night" : {
		"Animation" : "Outside",
		"Frame" : 6,
		"Location" : "Streets",
	},
	
	"Street_Rain" : {
		"Animation" : "Outside",
		"Frame" : 7,
		"Location" : "Streets",
	},
	
	"Street_Stars" : {
		"Animation" : "Outside",
		"Frame" : 8,
		"Location" : "Streets",
	},
	
	"Frozen_Lake" : {
		"Animation" : "Outside",
		"Frame" : 11,
		"Location" : "Lake",
	},
	
	"Theme_Park_Day" : {
		"Animation" : "Outside",
		"Frame" : 12,
		"Location" : "Theme Park",
	},
	
	"Outdoor_Terrace" : {
		"Animation" : "Outside",
		"Frame" : 13,
		"Location" : "Outdoor Terrace",
	},
}

var bgms : Dictionary = {
	"Main_Menu" : "res://assets/bgms/1_Menu_Master.ogg",
	"Day_1" : "res://assets/bgms/2_Day_1_Master.ogg",
	"Night_1" : "res://assets/bgms/3_Night_1_Master.ogg",
	"Dramatic_1" : "res://assets/bgms/4_Dramatic_1_Master.ogg",
	"Dramatic_2" : "res://assets/bgms/5_Dramatic_2_Master.ogg",
	"For_Everyone" : "res://assets/bgms/For Everyone Main.ogg",
	"Guitar_on_the_Water" : "res://assets/bgms/Guitar on the Water.ogg",
	"In_Legends" : "res://assets/bgms/In Legends.ogg",
	"Jazzy_Shop" : "res://assets/bgms/Jazzy Shop.ogg",
	"Lurking" : "res://assets/bgms/Lurking.ogg",
	"Magical" : "res://assets/bgms/Magical Full.ogg",
	"Poppy_Shop" : "res://assets/bgms/Poppy Shop.ogg",
	"Quircky_Shop" : "res://assets/bgms/Quircky Shop.ogg",
	"Time_for_Rest" : "res://assets/bgms/Time for Rest.ogg",
	"Challenge1BGM" : "res://assets/bgms/challenge_bgms/Challenge1BGM.ogg",
	"Challenge2BGM" : "res://assets/bgms/challenge_bgms/Challenge2BGM.ogg",
	"Challenge3BGM" : "res://assets/bgms/challenge_bgms/Challenge3BGM.ogg",
	"Challenge4BGM" : "res://assets/bgms/challenge_bgms/Challenge4BGM.ogg",
	"Challenge5BGM" : "res://assets/bgms/challenge_bgms/Challenge5BGM.ogg",
}

var sfxs : Dictionary = {
	"Confirm" : "res://assets/sfxs/UI Simple Confirm.wav",
	"Select" : "res://assets/sfxs/UI Simple Select.wav",
	"Cancel" : "res://assets/sfxs/UI Simple Cancel.wav",
	"Bright" : "res://assets/sfxs/UI Bright.wav",
	"Bell_1" : "res://assets/sfxs/UI Bell 1.wav",
	"Bell_2" : "res://assets/sfxs/UI Bell 2.wav",
	"ChapterDone" : "res://assets/sfxs/6_Stinger_Victory_1_Master.wav",
	"BadEnd" : "res://assets/sfxs/7_Stinger_Defeat_1_Master.wav",
	"Key1" : "res://assets/sfxs/keyboard_clicks/Key1.wav",
	"Key2" : "res://assets/sfxs/keyboard_clicks/Key2.wav",
	"Key3" : "res://assets/sfxs/keyboard_clicks/Key3.wav",
	"Key4" : "res://assets/sfxs/keyboard_clicks/Key4.wav",
	"Key5" : "res://assets/sfxs/keyboard_clicks/Key5.wav",
	"Key6" : "res://assets/sfxs/keyboard_clicks/Key6.wav",
	"ErrorKey" : "res://assets/sfxs/keyboard_clicks/ErrorKey.wav",
	"Correct_1" : "res://assets/sfxs/correct.wav",
	"Correct_2" : "res://assets/sfxs/correct2.wav",
	"Correct_3" : "res://assets/sfxs/correct3.wav",
	"Lose" : "res://assets/sfxs/lose.wav",
	"Powerup" : "res://assets/sfxs/powerup.wav",
}

var expressions = {
	"Frown" : 0,
	"Frown_blush" : 1,
	"Open" : 2,
	"Open_blush" : 3,
	"Smile" : 4,
	"Smile_blush" : 5,
	"Closed_frown" : 6,
	"Closed_frown_blush" : 7,
	"Closed_open" : 8,
	"Closed_open_blush" : 9,
	"Closed_smile" : 10,
	"Closed_smile_blush" : 11,
}

var chapter_details = {
	"Chapter 1" : {
		"Title" : "CHAPTER 1: \n",
		"Subtitle" : "PLAYING PILGRIMS",
	},
	
	"Chapter 2" : {
		"Title" : "Chapter 2: \n",
		"Subtitle" : "A Merry Christmas",
	},
	
	"Chapter 3" : {
		"Title" : "Chapter 3: \n",
		"Subtitle" : "The Laurence Boy",
	},
	
	"Chapter 4" : {
		"Title" : "Chapter 4: \n",
		"Subtitle" : "Burdens",
	},
	
	"Chapter 5" : {
		"Title" : "Chapter 5: \n",
		"Subtitle" : "Being Neighborly",
	},
	
	"Chapter 6" : {
		"Title" : "Chapter 6: \n",
		"Subtitle" : "Beth Finds the Palace Beautiful",
	},
	
	"Chapter 7" : {
		"Title" : "Chapter 7: \n",
		"Subtitle" : "Amy's Valley of Humiliation",
	},
	
	"Chapter 8" : {
		"Title" : "Chapter 8: \n",
		"Subtitle" : "You meet Apollyon",
	},
}

#Add more if there are characters that should not be included
var unnecessary_characters =  [".",",",":","?"," ","-",";","!"]
var ignored_keyboard_click_sfx_scancodes = [16777237, 16777241, 16777217]

#Transitions: Fade, Shards, Curtain, SpiralSquare, DiamondTilesCover, SpinningRectangle, Shade, Zip, HorizontalBars
#Character_Animations: UpDown, Shake
var dialogues = {
	"Test" : [
		#Ini dapat kaipuhan pag mashow ka palang ning bagong character (si mga may #important)
		#Maski dai na ang remove_character/remove_all_characters, pag nag lag saka ko gamiton
		#Note, na reset ni kada chapter so kaipuhan mo ulit specify si starting outfit, position, etc
		#Mayong duplicate keys digdi, show once lang dapat ang keys yan nang character, location, etc.
		{
			"character" : "Narrator",
			"dialogue" : "What do you want?",
			"skip_dialogue" : true,
			"show_selection" : [
				["I'm so glad you came before we began!", "Chapter 2", 33],
				["But we haven't had any breakfast yet!", "Chapter 2 Alt 1", 0],
			],
			"show_selection_timer" : 10,
			"dialogue_remark" : "sighed Meg.",
		},
		
		{
			"character" : "Meg", #Always important
			"location" : "", #Important sa starting dialouge kang chapter
			"outfit" : "Casual", #important pag bagong show kang character
			"position" : "LEFT", #important pag bagong show kang character
			"expression" : "Open", #important pag bagong show kang character
			"dialogue" : "Hello there!", #Always important 
			"dialogue_remark" : "sighed Meg.", #Optional
		},
		
		{
			"character" : "Meg",
			#"location" : "", #no need kung dai ma change
			#"outfit" : "Casual", #no need kung dai man ma change
			#"position" : "LEFT", #no need kung dai man ma change
			#"expression" : "Open", #no need kung dai man ma change
			"dialogue" : "I am Meg!",
			"show_selection" : [
				["I'm so glad you came before we began!", "Chapter 2", 33],
				["But we haven’t had any breakfast yet!", "Chapter 2 Alt 1", 0],
			],
			"show_selection_timer" : 10,
		},
		
		#Since bago man ini, kaipuhan man yan important
		{
			"character" : "Amy",
			#"location" : "", #no need kung dai ma change
			"outfit" : "Casual", #important
			"position" : "RIGHT", #important
			"expression" : "Open", #important
			"dialogue" : "Hello, I am Amy",
			"dialogue_remark" : "replied Amy.", #Optional
		},
		
		#Pag you, dapat mayo outfit, position, expression, magkakaeeror ni kung igwa
		{
			"character" : "You",
			"dialogue" : "And my name is [name].",
		},
		
		#Arog kani pag ma hide
		{
			"character" : "Narrator",
			"dialogue" : "The three greeted!",
			"hide_character" : ["Amy", "Meg"],
			#"hide_all_characters" : true, #Pwede man ni kung gabos
			"skip_dialogue" : true,
		},
		
		#Tigswitch ko digdi si position ninda meg tas amy
		#And tigdagdag ko si laurie
		{
			"character" : "Meg",
			#Ini gagamiton mo kung dai pa siya na show/introduce previously
			"show_more_characters" : [
				{
					"character" : "Laurie",
					"outfit" : "Casual",
					"expression" : "Open_blush",
					"position" : "MIDDLE",
				},
				#Or kung gusto mo palitan si bako na current character ngunyan
				#Example digdi si meg baga nakafocus, kung gusto mo palitan kay Amy, pwede man ni
				{
					#Pero digdi gabos importante kaag ining 4, maski dai mo man papalitan
					"character" : "Amy",
					"outfit" : "Casual", #Dai ko man gusto palitan pero kaipuhan yaon ni digdi, pag digdi lang sa show_more_characters
					"expression" : "Frown", #Gusto ko palitan expression ni amy digdi, since naka focus kay meg, arog dapat kani
					"position" : "LEFT", #Gusto ko palitan position ni amy digdi, since naka focus kay meg, arog dapat kani
				},
			],
			"show_character" : ["Amy", "Meg"],
			"position" : "RIGHT", #need ta gusto ko ichange
			"dialogue" : "Hello there Laurie!",
		},
		
		#Since tigshow mo naman si laurie previously dai naman neeed si iba kung dai man babagohon
		{
			"character" : "Laurie",
			#"outfit" : "Casual", #no need kung dai man ma change
			#"position" : "LEFT", #no need kung dai man ma change
			#"expression" : "Open", #no need kung dai man ma change
			"dialogue" : "Yow, byebye",
			#Bako dapat digdi ang hide ta mawawara na si laurie pakasabi niya byebye
		},
		
		{
			"character" : "Narrator",
			"dialogue" : "This is Beth and Amy",
			"show_more_characters" : [
				{
					"character" : "Beth",
					"outfit" : "Casual",
					"expression" : "Open_blush",
					"position" : "LEFT",
				},
				{
					"character" : "Amy",
					"outfit" : "Casual",
					"expression" : "Frown",
					"position" : "RIGHT",
				},
			],
			"skip_dialogue" : true,
		},
		
		{
			"character" : "Amy",
			"dialogue" : "Wait!",
			"hide_character" : ["Laurie"],
		},
		
		{
			"character" : "Laurie",
			"show_character" : ["Laurie"],
			"dialogue" : "What?",
		},
		
		{
			"character" : "You",
			"dialogue" : "The one piece is real.",
		},
		
		{
			"character" : "You",
			"dialogue" : "The one piece is real.",
		}
	]
}

var quests = [
	{
		"Type" : "Daily",
		"Desc" : "Type 5 words"
	}
]

func _ready():
	load_chapters()

func load_chapters():
	for i in range(1, MAX_CHAPTERS + 1):
		var file = File.new()
		file.open("res://assets/chapters/chapter" + String(i) + ".json", file.READ)
		var text = file.get_as_text()
		var res = JSON.parse(text).result
		var chap_name = res.keys()[0]
		dialogues[chap_name] = res[chap_name] 
		file.close()
	
	for i in range(1, ALTERNATIVE_CHAPTERS.size() + 1):
		for j in range(1, ALTERNATIVE_CHAPTERS[i-1] + 1):
			var file = File.new()
			file.open("res://assets/chapters/chapter" + String(i) + "Alt" + String(j) + ".json", file.READ)
			var text = file.get_as_text()
			var res = JSON.parse(text).result
			var chap_name = res.keys()[0]
			dialogues[chap_name] = res[chap_name] 
			file.close()
