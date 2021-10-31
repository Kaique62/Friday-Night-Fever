package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		
		loadGraphic(Paths.image('iconGrid'), true, 150, 150);

		switch(char)
		{
			case 'bfiso-pixel' | 'bfiso':
				loadGraphic(Paths.image('isoiconslmao'), true, 150, 150);

			case 'feverbob':
				loadGraphic(Paths.image('feverRunICON'), true, 150, 150);
			case 'spooky':
				loadGraphic(Paths.image('weeIcons'), true, 150, 150);
			case 'feralspooky':
				loadGraphic(Paths.image('weeFeralIcons'), true, 150, 150);
			case 'bdbfever':
				loadGraphic(Paths.image('bdbFeverIcons'), true, 150, 150);
		}
			

		antialiasing = true;
		animation.add('bf', [0, 1, 2], 0, false, isPlayer);
		animation.add('bdbfever', [0, 1, 2], 0, false, isPlayer);
		animation.add('bfiso', [0, 2, 1], 0, false, isPlayer);
		animation.add('bfiso-pixel', [0, 2, 1], 0, false, isPlayer);
		animation.add('bf-casual', [0, 1, 2], 0, false, isPlayer);
		animation.add('bf-casualdemon', [3, 4, 5], 0, false, isPlayer);
		animation.add('bfdemoncesar', [3, 4, 5], 0, false, isPlayer);
		animation.add('hallow', [56, 57, 58], 0, false, isPlayer);
		animation.add('bf-car', [0, 1, 2], 0, false, isPlayer);
		animation.add('feverbob', [0, 0, 0], 0, false, isPlayer);
		animation.add('bf-carnight', [3, 4, 5], 0, false, isPlayer);
		animation.add('bf-christmas', [6, 7, 8], 0, false, isPlayer);
		animation.add('bf-pixel', [39, 40, 41], 0, false, isPlayer);
		animation.add('bf-pixeldemon', [42, 43, 44], 0, false, isPlayer);
		animation.add('spooky', [0, 1, 2], 0, false, isPlayer);
		animation.add('feralspooky', [0, 1, 2], 0, false, isPlayer);
		animation.add('pico', [24, 25, 26], 0, false, isPlayer);
		animation.add('robo-cesar', [54, 55, 54], 0, false, isPlayer);
		animation.add('makocorrupt', [27, 28, 29], 0, false, isPlayer);
		animation.add('mom', [30, 31, 32], 0, false, isPlayer);
		animation.add('mom-car', [30, 31, 32], 0, false, isPlayer);
		animation.add('mom-carnight', [30, 31, 32], 0, false, isPlayer);
		animation.add('yukichi', [36, 37, 38], 0, false, isPlayer);
		animation.add('dad', [14, 13, 15], 0, false, isPlayer);
		animation.add('peasus', [17, 16, 18], 0, false, isPlayer);
		animation.add('peacensored', [17, 16, 18], 0, false, isPlayer);
		animation.add('senpai', [45, 46, 47], 0, false, isPlayer);
		animation.add('senpai-angry', [48, 49, 50], 0, false, isPlayer);
		animation.add('spirit', [51, 52, 53], 0, false, isPlayer);
		animation.add('bf-old', [6, 7, 8], 0, false, isPlayer);
		animation.add('gf', [9, 10, 11], 0, false, isPlayer);
		animation.add('gfpainting', [9, 10, 11], 0, false, isPlayer);
		animation.add('tea-bat', [9, 10, 11], 0, false, isPlayer);
		animation.add('gf-christmas', [9, 10, 11], 0, false, isPlayer);
		animation.add('gf-pixel', [9, 10, 11], 0, false, isPlayer);
		animation.add('monster', [21, 22, 23], 0, false, isPlayer);
		animation.add('taki', [21, 22, 23], 0, false, isPlayer);
		animation.add('monster-christmas', [33, 34, 35], 0, false, isPlayer);
		animation.play(char);

		switch(char)
		{
			case 'bf-pixel' | 'senpai' | 'senpai-angry' | 'spirit' | 'gf-pixel':
				antialiasing = false;
		}

		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
