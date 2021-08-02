package;

import flixel.FlxSprite;
import flixel.FlxG;

class JumpscareState extends MusicBeatState
{
    override function create()
    {
        // just stealing this from the block of code u sent me
        var jumpscare:FlxSprite = new FlxSprite(0, 0);
		jumpscare.frames = Paths.getSparrowAtlas('dialogue/jumpscare');
		jumpscare.animation.addByPrefix('idle', 'jumpscare', 24, false);
		jumpscare.updateHitbox();
		add(jumpscare);

        jumpscare.animation.play('idle');

        jumpscare.animation.finishCallback = function(t){
			FlxG.switchState(new PlayState());
		}
    }
}