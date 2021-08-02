package;

import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import io.newgrounds.NG;
import lime.app.Application;

#if windows
import Discord.DiscordClient;
#end

using StringTools;

class MainMenuState extends MusicBeatState
{
	var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;

	#if !switch
	var optionShit:Array<String> = ['story mode', 'freeplay', 'options', 'jukebox', 'gallery'];
	#else
	var optionShit:Array<String> = ['story mode', 'freeplay'];
	#end

	public static var firstStart:Bool = true;

	public static var nightly:String = "";

	public static var kadeEngineVer:String = "1.5.1" + nightly;
	public static var gameVer:String = "0.2.7.1";

	var magenta:FlxSprite;
	var camFollow:FlxObject;
	public static var finishedFunnyMove:Bool = false;
	var menuImage:FlxSprite;
	var menuMap:Map<String, Array<Dynamic>> = [
	'story mode' => ['fever', -50, -40, true],
	'freeplay' => ['teaa', -20, -226, true],
	'jukebox' => ['jukebox', 40, 62, false],
	'gallery' => ['monaLisaCesar', 82, 16, false],
	'options' => ['cogwheel', 58, 126, false]
];

	override function create()
	{
		#if windows
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		if (!FlxG.sound.music.playing)
		{
			FlxG.sound.playMusic(Paths.music('freakyMenu'));
		}

		persistentUpdate = persistentDraw = true;

		var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.image('menuBG'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.10;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		add(bg);

		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);

		magenta = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		magenta.scrollFactor.x = 0;
		magenta.scrollFactor.y = 0.10;
		magenta.setGraphicSize(Std.int(magenta.width * 1.1));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;
		magenta.antialiasing = true;
		magenta.color = 0xFFfd719b;
		add(magenta);

		menuImage = new FlxSprite(0, 0).loadGraphic(Paths.image(menuMap.get('story mode')[0]));
		menuImage.antialiasing = true;
		add(menuImage);

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		for (i in 0...optionShit.length)
		{
			var menuItem:FlxSprite = new FlxSprite(0, 145 + (i * 115));
			menuItem.frames = Paths.getSparrowAtlas('menu shit');
			menuItem.animation.addByPrefix('idle', optionShit[i], 0);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " select", 0);
			menuItem.animation.play('idle');
			menuItem.updateHitbox();
			menuItem.x = FlxG.width - menuItem.width + 5;
			menuItem.ID = i;
			menuItems.add(menuItem);
			
			selectedSomethin = true;
			menuItem.x += 550;
			FlxTween.tween(menuItem, {x: FlxG.width - menuItem.width + 5}, 0.65 + (0.12 * i), {ease:FlxEase.smoothStepInOut, onComplete:function(twn:FlxTween){
				if(menuItem.ID == optionShit.length - 1)
					selectedSomethin = false;
			}});
		}

		firstStart = false;

		var versionShit:FlxText = new FlxText(5, FlxG.height - 18, 0, 'Using Kade Engine $kadeEngineVer', 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		if(FlxG.save.data.visitedCredits)
        {
            versionShit.text += '\nPress C to visit the credits menu';
            versionShit.y -= 18;
        }

		if (FlxG.save.data.dfjk)
			controls.setKeyboardScheme(KeyboardScheme.Solo, true);
		else
			controls.setKeyboardScheme(KeyboardScheme.Duo(true), true);

		changeItem();

		super.create();
	}

	var selectedSomethin:Bool = false;
	var elapsedTimer:Float = 0;

	override function update(elapsed:Float)
	{
		elapsedTimer += elapsed;
		if(elapsedTimer > 1.4)
		{
			elapsedTimer = 0;
			if(optionShit[curSelected] == 'gallery')
			{
				var randomX:Float = FlxG.random.float(menuImage.x, menuImage.x + menuImage.width);
				var randomY:Float = FlxG.random.float(menuImage.y, menuImage.y + menuImage.height);
				var sparkle:NoteSplash = new NoteSplash(randomX, randomY, 2);
				add(sparkle);
			}
		}

		if (FlxG.keys.justPressed.C && FlxG.save.data.visitedCredits)
		{
			FlxG.switchState(new CreditsState());
		}

		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if (!selectedSomethin)
		{
			if (controls.UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (controls.DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (controls.BACK)
			{
				FlxG.switchState(new TitleState());
			}

			if (controls.ACCEPT)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('confirmMenu'));
				
				if (FlxG.save.data.flashing)
					FlxFlicker.flicker(magenta, 1.1, 0.15, false);

				menuItems.forEach(function(spr:FlxSprite)
				{
					if (curSelected != spr.ID)
					{
						FlxTween.tween(spr, {x:FlxG.width + spr.width}, 0.44, {ease:FlxEase.smoothStepInOut, onComplete:function(twn:FlxTween){
							spr.kill();
						}});
					}
					else
					{
						if (FlxG.save.data.flashing)
						{
							FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
							{
								goToState();
							});
						}
						else
						{
							new FlxTimer().start(1, function(tmr:FlxTimer)
							{
								goToState();
							});
						}
					}
				});
			}
		}

		super.update(elapsed);

	}
	
	function goToState()
	{
		var daChoice:String = optionShit[curSelected];

		switch (daChoice)
		{
			case 'story mode':
				FlxG.switchState(new StoryMenuState());
				trace("Story Menu Selected");
			case 'freeplay':
				FlxG.switchState(new FreeplayState());

				trace("Freeplay Menu Selected");
			case 'jukebox':
				FlxG.switchState(new JukeboxState());
			case 'gallery':
				FlxG.switchState(new GalleryState());
			case 'options':
				FlxG.switchState(new OptionsMenu());
		}
	}

	function changeItem(huh:Int = 0)
	{
			curSelected += huh;

			if (curSelected >= menuItems.length)
				curSelected = 0;
			if (curSelected < 0)
				curSelected = menuItems.length - 1;

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');

			if (spr.ID == curSelected)
			{
				spr.animation.play('selected');
				//camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y);
			}

			spr.updateHitbox();
			if(!selectedSomethin)
				spr.x = FlxG.width - spr.width + 5;
		});
		
		FlxTween.cancelTweensOf(menuImage);
		if(menuMap.get(optionShit[curSelected])[3])
		{
			menuImage.y = FlxG.height;
			FlxTween.tween(menuImage, {y:menuMap.get(optionShit[curSelected])[2]}, 0.36, {ease:FlxEase.smoothStepInOut});
		}
		else
		{
			menuImage.y = menuMap.get(optionShit[curSelected])[2];
		}
		
		menuImage.loadGraphic(Paths.image(menuMap.get(optionShit[curSelected])[0]));
		menuImage.updateHitbox();
		menuImage.x = menuMap.get(optionShit[curSelected])[1];
	}
}
