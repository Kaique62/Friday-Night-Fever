package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import WiggleEffect.WiggleEffectType;
import flixel.util.FlxTimer;
import openfl.filters.BitmapFilter;
import lime.net.curl.CURLCode;
import openfl.filters.ShaderFilter;

#if windows
import Discord.DiscordClient;
#end



using StringTools;

#if shaders
import openfl.filters.ShaderFilter;
#end
#if windows
import Discord.DiscordClient;
#end
#if windows
import Sys;
import sys.FileSystem;
#end

class StoryMenuState extends MusicBeatState
{
	var scoreText:FlxText;

	var weekSongs:Array<Dynamic> = [
		['Tutorial'],
		['Metamorphosis', 'Void', 'Down-bad'],
		['Star-Baby', 'Last-Meow', 'Bazinga', 'Crucify'],
		['Prayer', 'Bad-Nun'],
		['Mako', 'VIM', "Farmed"],
		['Honey', "Bunnii", "Throw-it-back"],
		['Mild', 'Spice', 'Party-Crasher'],
		['Ur-girl', 'Chicken-sandwich', 'Funkin-god'],
		['Hallow', 'Portrait', 'Soul']
		//['bowling time']
	];

	public static var weekData:Array<Dynamic> = [];
	var curDifficulty:Int = 1;
	var wiggleShit:WiggleEffect = new WiggleEffect();
	var wiggleEffect:WiggleEffect;

	public static var weekUnlocked:Array<Bool> = [true, true, true, true, true, true, true, true, true];

	var weekCharacters:Array<Dynamic> = [
		['', 'bf', 'gf'],
		['dad', 'bf', 'gf'],
		['spooky', 'bf', 'gf'],
		['dad', 'bf', 'gf'],
		['pico', 'bf', 'gf'],
		['mom', 'bf', 'gf'],
		['parents-christmas', 'bf', 'gf'],
		['parents-christmas', 'bf', 'gf'],
		['senpai', 'bf', 'gf']
		//['iso', 'bf', 'gf']
	];

	var weekNames:Array<String> = [
		"SWEET SERVICE!",
		"STICKY SITUATION!",
		"SWEET AND SOUR!",
		"TAKI'S REVENGE!",
		"MELONCHOLY!",
		"BUNNI MURDER!",
		"DINNER TIME!",
		"GOD DAMN!",
		"???"
		//"BOWLING TILL YOU'RE DEAD"
	];

	var txtWeekTitle:FlxText;

	var curWeek:Int = 0;

	var txtTracklist:FlxText;

	var grpWeekText:FlxTypedGroup<MenuItem>;
	var filters:Array<BitmapFilter> = [];
	var grpWeekCharacters:FlxTypedGroup<MenuCharacter>;

	var grpLocks:FlxTypedGroup<FlxSprite>;
	var luaWiggles:Array<WiggleEffect> = [];

	var difficultySelectors:FlxGroup;
	var sprDifficulty:FlxSprite;
	var leftArrow:FlxSprite;
	var peakek:FlxSprite;
	var rightArrow:FlxSprite;
	var warningText:FlxText;
	var shadersLoaded:Bool = false;
	@:isVar var secretCode(get, never):String;
	var userInput:String;
	var secretFound:Bool = false;

	override function create()
	{
		FlxG.camera.setFilters(filters);
		FlxG.camera.filtersEnabled = true;

		// ADDING SO MANY FUCKING EASTER EGGS LMAO -iso
		userInput = secretCode;

		// VERY SHITTY SOLUTION TO THE WEEKDATA RESETTING PROBLEM LMAO BUT ITS WORKS -rifxii
		weekData = weekSongs;

		#if windows
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Story Mode Menu", null);
		#end

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		if (FlxG.sound.music != null)
		{
			if (!FlxG.sound.music.playing)
				FlxG.sound.playMusic(Paths.music('freakyMenu'));
		}

		persistentUpdate = persistentDraw = true;

		scoreText = new FlxText(12.1, 455, 0, "SCORE: 49324858", 61);
		scoreText.setFormat(Paths.font("SuperMarioScript2Demo-Regular.ttf"), 61, FlxColor.WHITE, OUTLINE, FlxColor.BLACK);

		txtWeekTitle = new FlxText(23.7, 0, 0, "", 88);
		txtWeekTitle.setFormat(Paths.font("SuperMarioScript2Demo-Regular.ttf"), 88, FlxColor.WHITE, OUTLINE, FlxColor.BLACK);
		txtWeekTitle.alpha = 1;

		var rankText:FlxText = new FlxText(0, 10);
		rankText.text = 'RANK: GREAT';
		rankText.setFormat(Paths.font("SuperMarioScript2Demo-Regular.ttf"), 32, FlxColor.WHITE, OUTLINE, FlxColor.BLACK);
		rankText.size = scoreText.size;
		rankText.screenCenter(X);

		
		var ui_tex = Paths.getSparrowAtlas('campaign_menu_UI_assets');
		var arrow = Paths.getSparrowAtlas('newStory/arrows');
		var yellowBG:FlxSprite = new FlxSprite(0, 56).loadGraphic(Paths.image("campaign thing"));

		peakek = new FlxSprite(0, 0).loadGraphic(Paths.image('newStory/week1'));
		add(peakek);
		peakek.visible = false;

		wiggleEffect = new WiggleEffect();
		wiggleEffect.effectType = WiggleEffectType.WAVY;
		wiggleEffect.waveAmplitude = 0.015;
		wiggleEffect.waveFrequency = 3;
		wiggleEffect.waveSpeed = 1;
		peakek.shader = wiggleEffect.shader;

		var blackThing:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('newStory/menu'));
		add(blackThing);
		
		grpWeekText = new FlxTypedGroup<MenuItem>();
		add(grpWeekText);

		grpWeekCharacters = new FlxTypedGroup<MenuCharacter>();

		grpLocks = new FlxTypedGroup<FlxSprite>();
		add(grpLocks);

		trace("Line 70");

		for (i in 0...weekData.length)
		{
			var weekThing:MenuItem = new MenuItem(700, 10, i);
			weekThing.targetY = i;
			weekThing.x = FlxG.width - weekThing.width + 2;
			grpWeekText.add(weekThing);

			weekThing.antialiasing = true;
			// weekThing.updateHitbox();

			// Needs an offset thingie

			if (!weekUnlocked[i])
			{
				var lock:FlxSprite = new FlxSprite(weekThing.width + 10 + weekThing.x);
				lock.frames = ui_tex;
				lock.animation.addByPrefix('lock', 'lock');
				lock.animation.play('lock');
				lock.ID = i;
				lock.antialiasing = true;
				grpLocks.add(lock);
			}
		}

		trace("Line 96");

		grpWeekCharacters.add(new MenuCharacter(0, 100, 0.5, false));
		grpWeekCharacters.add(new MenuCharacter(450, 25, 0.9, true));
		grpWeekCharacters.add(new MenuCharacter(850, 100, 0.5, true));


		trace("Line 124");


		trace("Line 150");

		//add(yellowBG);
		//add(grpWeekCharacters);

		difficultySelectors = new FlxGroup();
		add(difficultySelectors);

		leftArrow = new FlxSprite(450, 630);
		leftArrow.frames = arrow;
		leftArrow.animation.addByPrefix('idle', "arrow left", 0);
		leftArrow.animation.addByPrefix('press', "arrow left push", 0);
		leftArrow.animation.play('idle');
		difficultySelectors.add(leftArrow);

		sprDifficulty = new FlxSprite(1100, 640);
		sprDifficulty.frames = ui_tex;
		sprDifficulty.animation.addByPrefix('easy', 'EASY');
		sprDifficulty.animation.addByPrefix('normal', 'NORMAL');
		sprDifficulty.animation.addByPrefix('hard', 'NOTHARD');
		sprDifficulty.animation.addByPrefix('baby', 'BABY');
		sprDifficulty.animation.play('easy');
		sprDifficulty.screenCenter(X);
		changeDifficulty();

		//sprDifficulty.animation.addByPrefix('hard plus', 'HARD +');

		difficultySelectors.add(sprDifficulty);

		rightArrow = new FlxSprite(800, 630);
		rightArrow.frames = arrow;
		rightArrow.animation.addByPrefix('idle', 'arrow right', 0);
		rightArrow.animation.addByPrefix('press', "arrow right push", 0, false);
		rightArrow.animation.play('idle');
		difficultySelectors.add(rightArrow);

		txtTracklist = new FlxText(12.1, 499.25, 0, "Tracks", 40);
		txtTracklist.alignment = LEFT;
		txtTracklist.font = rankText.font;
		txtTracklist.color = 0xFFe55777;
		txtTracklist.setFormat(Paths.font("SuperMarioScript2Demo-Regular.ttf"), 40, FlxColor.WHITE, OUTLINE, FlxColor.BLACK);
		add(txtTracklist);
		// add(rankText);
		add(scoreText);
		add(txtWeekTitle);

		updateText();

		trace("Line 165");

		super.create();
	}

	override function update(elapsed:Float)
	{

		if (FlxG.keys.justPressed.ANY && !secretFound)
		{
			var keyPressed = FlxG.keys.getIsDown()[0].ID.toString().toLowerCase();

			if (userInput.charAt(0) == keyPressed)
			{
				userInput = userInput.substring(1, userInput.length);
				trace(userInput);

				if (userInput.length <= 0)
				{
					secretFound = true;
					trace('swag');
				}
			}
			else
			{
				userInput = secretCode;
			}
		}

		// scoreText.setFormat('VCR OSD Mono', 32);
		lerpScore = Math.floor(FlxMath.lerp(lerpScore, intendedScore, 0.5));

		scoreText.text = "WEEK SCORE:" + lerpScore;

		txtWeekTitle.text = weekNames[curWeek].toUpperCase();
		//txtWeekTitle.x = FlxG.width - (txtWeekTitle.width + 10);
		//txtWeekTitle.screenCenter(X);

		// FlxG.watch.addQuick('font', scoreText.font);

		difficultySelectors.visible = weekUnlocked[curWeek];

		grpLocks.forEach(function(lock:FlxSprite)
		{
			lock.y = grpWeekText.members[lock.ID].y;
		});

		if (!movedBack)
		{
			if (!selectedWeek)
			{
				if (controls.UP_P)
				{
					changeWeek(-1);
				}

				if (controls.DOWN_P)
				{
					changeWeek(1);
				}

				if (controls.RIGHT)
					rightArrow.animation.play('press')
				else
					rightArrow.animation.play('idle');

				if (controls.LEFT)
					leftArrow.animation.play('press');
				else
					leftArrow.animation.play('idle');

				
				if (controls.RIGHT_P)
					changeDifficulty(1);
				if (controls.LEFT_P)
					changeDifficulty(-1);

			}

			if (controls.ACCEPT)
			{
				selectWeek();
			}
		}

		if (controls.BACK && !movedBack && !selectedWeek)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			movedBack = true;
			FlxG.switchState(new MainMenuState());
		}

		wiggleEffect.update(elapsed);
		super.update(elapsed);
	}

	function get_secretCode():String
		return 'run';

	var movedBack:Bool = false;
	var selectedWeek:Bool = false;
	var stopspamming:Bool = false;

	function selectWeek()
	{
		if (weekUnlocked[curWeek])
		{
			
			if (stopspamming == false)
			{
				FlxG.sound.play(Paths.sound('confirmMenu'));

				grpWeekText.members[curWeek].startFlashing();
				grpWeekCharacters.members[1].animation.play('bfConfirm');
				stopspamming = true;
			}

			if (controls.ACCEPT)
			{
				PlayState.storyPlaylist = weekData[curWeek];
				PlayState.isStoryMode = true;
				selectedWeek = true;
	
				var diffic = "";
	
				switch (curDifficulty)
				{
						
					case 0 | 3:
						diffic = '-easy';
					case 2:
						diffic = '-hard';
				}
	
				PlayState.storyDifficulty = curDifficulty;
	
				PlayState.SONG = Song.loadFromJson(StringTools.replace(PlayState.storyPlaylist[0]," ", "-").toLowerCase() + diffic, StringTools.replace(PlayState.storyPlaylist[0]," ", "-").toLowerCase());
				PlayState.storyWeek = curWeek;
				PlayState.campaignScore = 0;
				new FlxTimer().start(1, function(tmr:FlxTimer)
				{
					LoadingState.loadAndSwitchState(new PlayState(), true);
				});
			}

	
		}
	}

	function changeDifficulty(change:Int = 0):Void
	{
		curDifficulty += change;

		if (curDifficulty < 0)
			curDifficulty = 3;
		if (curDifficulty > 3)
			curDifficulty = 0;

		sprDifficulty.offset.x = 0;

		switch (curDifficulty)
		{
			case 0:
				filters.remove(ShadersHandler.chromaticAberration);
				sprDifficulty.animation.play('easy');
				sprDifficulty.offset.x = 65;
				FlxG.camera.filtersEnabled = false;
			case 1:
				filters.remove(ShadersHandler.chromaticAberration);
				sprDifficulty.animation.play('normal');
				sprDifficulty.offset.x = 120;
				FlxG.camera.filtersEnabled = false;
			case 2:
				filters.remove(ShadersHandler.chromaticAberration);
				sprDifficulty.animation.play('hard');
				sprDifficulty.offset.x = 85;
				FlxG.camera.filtersEnabled = false;
			case 3:
				filters.remove(ShadersHandler.chromaticAberration);
				FlxG.camera.filtersEnabled = false;
				sprDifficulty.animation.play('baby');
				sprDifficulty.offset.x = 65;
		}

		//sprDifficulty.alpha = 0;

		// USING THESE WEIRD VALUES SO THAT IT DOESNT FLOAT UP
		sprDifficulty.y = leftArrow.y - 15;
		intendedScore = Highscore.getWeekScore(curWeek, curDifficulty);

		#if !switch
		intendedScore = Highscore.getWeekScore(curWeek, curDifficulty);
		#end

		FlxTween.tween(sprDifficulty, {y: leftArrow.y + 15}, 0.07);
	}

	var lerpScore:Int = 0;
	var intendedScore:Int = 0;

	function changeWeek(change:Int = 0):Void
	{

		curWeek += change;

		if (curWeek >= weekData.length)
			curWeek = 0;
		if (curWeek < 0)
			curWeek = weekData.length - 1;

		var bullShit:Int = 0;

		for (item in grpWeekText.members)
		{
			item.targetY = bullShit - curWeek;
			if (item.targetY == Std.int(0) && weekUnlocked[curWeek])
				item.alpha = 1;
			else
				item.alpha = 0.6;
			bullShit++;
		}

		FlxG.sound.play(Paths.sound('scrollMenu'));

		updateText();
	}

	function updateText()
	{
		grpWeekCharacters.members[0].setCharacter(weekCharacters[curWeek][0]);
		grpWeekCharacters.members[1].setCharacter(weekCharacters[curWeek][1]);
		grpWeekCharacters.members[2].setCharacter(weekCharacters[curWeek][2]);

		if(lime.utils.Assets.exists(Paths.image('newStory/week'+curWeek))){
			peakek.loadGraphic(Paths.image('newStory/week'+curWeek));
			peakek.visible = true;
		}else
		peakek.visible = false;

		txtTracklist.text = "Tracks\n";
		var stringThing:Array<String> = weekData[curWeek];

		var hiddenSongs:Array<String> = ['Bazinga', 'Crucify'];
		for (i in stringThing)
		{
			if(!hiddenSongs.contains(i))
				txtTracklist.text += "\n" + i;
		}

		txtTracklist.text = txtTracklist.text.toUpperCase();

		//txtTracklist.x -= FlxG.width * 0.35;
		//txtTracklist.screenCenter(X);
	//	txtTracklist.y = 560;

		txtTracklist.text += "\n";

		#if !switch
		intendedScore = Highscore.getWeekScore(curWeek, curDifficulty);
		#end
	}
}
