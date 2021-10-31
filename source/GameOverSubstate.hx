package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSubState;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flash.system.System;
import flixel.util.FlxTimer;

class GameOverSubstate extends MusicBeatSubstate
{
	var bf:Boyfriend;
	var camFollow:FlxObject;

	var stageSuffix:String = "";

	public function new(x:Float, y:Float)
	{
		var daStage = PlayState.curStage;
		var daBf:String = '';
		switch (PlayState.SONG.player1)
		{
			case 'bf-pixel' | 'bf-pixeldemon':
				stageSuffix = '-pixel';
				daBf = 'bf-pixel-dead';
			case 'bfdemoncesar':
				if(PlayState.SONG.song.toLowerCase() == 'hallow' ||PlayState.SONG.song.toLowerCase() == 'portrait' ||PlayState.SONG.song.toLowerCase() == 'soul'){
					daBf = 'bf-hallow-dead';
				}
				else
				{
					daBf = 'bf';		
				}
			default:
				daBf = 'bf';
		}

		super();

		Conductor.songPosition = 0;

		bf = new Boyfriend(x, y, daBf);
		add(bf);

		camFollow = new FlxObject(bf.getGraphicMidpoint().x, bf.getGraphicMidpoint().y, 1, 1);
		add(camFollow);

		FlxG.sound.play(Paths.sound('fnf_loss_sfx' + stageSuffix));
		Conductor.changeBPM(100);

		// FlxG.camera.followLerp = 1;
		// FlxG.camera.focusOn(FlxPoint.get(FlxG.width / 2, FlxG.height / 2));
		FlxG.camera.scroll.set();
		FlxG.camera.target = null;

		bf.playAnim('firstDeath');
	}

	override function update(elapsed:Float)
	{
		if(PlayState.SONG.song.toLowerCase() == 'run'){
			System.exit(0);
		}

		PlayState.font = false;
		
		super.update(elapsed);

		if (controls.ACCEPT)
		{
			endBullshit();
		}

		if (controls.BACK)
		{
			FlxG.sound.music.stop();

			if (PlayState.isStoryMode)
				FlxG.switchState(new StoryMenuState());
			else
				FlxG.switchState(new FreeplayState());

			if (PlayState.isHalloweenFreeplay)
				FlxG.switchState(new HalloweenState());
			else 
				FlxG.switchState(new FreeplayState());
			PlayState.loadRep = false;
		}

		if (bf.animation.curAnim.name == 'firstDeath' && bf.animation.curAnim.curFrame == 12)
		{
			FlxG.camera.follow(camFollow, LOCKON, 0.01);
		}

		if (bf.animation.curAnim.name == 'firstDeath' && bf.animation.curAnim.finished)
		{
			
			if(PlayState.SONG.song.toLowerCase() == 'hallow' ||PlayState.SONG.song.toLowerCase() == 'portrait' ||PlayState.SONG.song.toLowerCase() == 'soul'){
				FlxG.sound.playMusic(Paths.music('gameOverHallow'));
			}
			else
			{
				FlxG.sound.playMusic(Paths.music('gameOver' + stageSuffix));
			}
		
		}

		if (FlxG.sound.music.playing)
		{
			Conductor.songPosition = FlxG.sound.music.time;
		}
	}

	override function beatHit()
	{
		super.beatHit();

		FlxG.log.add('beat');
	}

	var isEnding:Bool = false;

	function endBullshit():Void
	{
		if (!isEnding)
		{
			isEnding = true;
			bf.playAnim('deathConfirm', true);
			FlxG.sound.music.stop();
		
			if(PlayState.SONG.song.toLowerCase() == 'hallow' ||PlayState.SONG.song.toLowerCase() == 'portrait' ||PlayState.SONG.song.toLowerCase() == 'soul'){
				FlxG.sound.play(Paths.music('gameOver-EndHallow'));
			}
			else{
				FlxG.sound.play(Paths.music('gameOverEnd'));
			}
			new FlxTimer().start(0.7, function(tmr:FlxTimer)
			{
				FlxG.camera.fade(FlxColor.BLACK, 2, false, function()
				{
					LoadingState.loadAndSwitchState(new PlayState());
				});
			});
		}
	}
}
