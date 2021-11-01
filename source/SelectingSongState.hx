package;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.effects.FlxFlicker;
import flixel.util.FlxTimer;
import flixel.addons.transition.FlxTransitionableState;


#if windows
import Discord.DiscordClient;
#end

using StringTools;

class SelectingSongState extends MusicBeatState
{

	var selectors:Array<String> = ['normal', 'halloween'];
	var selectorIcon:FlxTypedGroup<FlxSprite>;

	var curSelected:Int = 0;

	override function create()
	{
		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuBGBlue'));
		add(bg);

		if (!FlxG.sound.music.playing)
		{
			FlxG.sound.playMusic(Paths.music('freakyMenu'));
		}

		selectorIcon = new FlxTypedGroup<FlxSprite>();
		add(selectorIcon);

		for (i in 0...selectors.length)
		{
			var selecterIcons:FlxSprite = new FlxSprite(200 + (i * 500), -900);
			selecterIcons.frames = Paths.getSparrowAtlas('freeplayShit/selectors');
			selecterIcons.animation.addByPrefix('idle', selectors[i] + " songs", 0);
			selecterIcons.animation.addByPrefix('selected', selectors[i] + " selected", 0);
			selecterIcons.animation.play('idle');
			selecterIcons.scrollFactor.set();
			selecterIcons.updateHitbox();
			selecterIcons.ID = i;
			selectorIcon.add(selecterIcons);

			selectorIcon.forEach(function(spr:FlxSprite){
				FlxTween.tween(spr, {y: 200}, 0.8, {ease: FlxEase.smoothStepInOut});
			});
		}


		#if windows
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Deciding Song Type for Freeplay", null);
		#end


		changeItem();
	
		super.create();


	}

	function changeItem(huh:Int = 0)
	{
			curSelected += huh;

			if (curSelected >= selectorIcon.length)
				curSelected = 0;
			if (curSelected < 0)
				curSelected = selectorIcon.length - 1;

		selectorIcon.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');

			if (spr.ID == curSelected)
			{
				spr.animation.play('selected');
				//camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y);
			}

			spr.updateHitbox();
		});
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		

			if (controls.LEFT_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (controls.RIGHT_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (controls.BACK)
			{
				FlxG.switchState(new MainMenuState());
			}

			if (controls.ACCEPT)
			{
				FlxG.sound.play(Paths.sound('confirmMenu'));

				selectorIcon.forEach(function(spr:FlxSprite)
				{
					FlxTween.tween(spr, {y: 2000}, 0.8, {ease: FlxEase.smoothStepInOut});
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
				});
			}
	}

	function goToState()
	{
		var daChoice:String = selectors[curSelected];

		FlxTransitionableState.skipNextTransIn = true;
		FlxTransitionableState.skipNextTransOut = true;

		switch (daChoice)
		{
			case 'halloween':
				FlxG.switchState(new HalloweenState());
			case 'normal':
				FlxG.switchState(new FreeplayState());
		}
	}
}