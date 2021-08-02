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

		antialiasing = true;
		animation.add('bf', [0, 1], 0, false, isPlayer);
		animation.add('bf-casual', [0, 1], 0, false, isPlayer);
		animation.add('bf-casualdemon', [0, 1], 0, false, isPlayer);
		animation.add('bf-8bit', [0, 1], 0, false, isPlayer);
		animation.add('bfdemoncesar', [2, 3], 0, false, isPlayer);
		animation.add('bf-car', [0, 1], 0, false, isPlayer);
		animation.add('bf-carnight', [0, 1], 0, false, isPlayer);
		animation.add('bf-christmas', [0, 1], 0, false, isPlayer);
		animation.add('bf-pixel', [17, 18], 0, false, isPlayer);
		animation.add('bf-pixeldemon', [17, 18], 0, false, isPlayer);
		animation.add('spooky', [6, 7], 0, false, isPlayer);
		animation.add('pico', [8, 9], 0, false, isPlayer);
		animation.add('makocorrupt', [8, 9], 0, false, isPlayer);
		animation.add('mom', [10, 11], 0, false, isPlayer);
		animation.add('mom-car', [10, 11], 0, false, isPlayer);
		animation.add('mom-carnight', [10, 11], 0, false, isPlayer);
		animation.add('tankman', [8, 9], 0, false, isPlayer);
		animation.add('face', [10, 11], 0, false, isPlayer);
		animation.add('yukichi', [20, 21], 0, false, isPlayer);
		animation.add('yukichi-8bit', [20, 21], 0, false, isPlayer);
		animation.add('dad', [4, 5], 0, false, isPlayer);
		animation.add('peasus', [25, 26], 0, false, isPlayer);
		animation.add('senpai', [16, 16], 0, false, isPlayer);
		animation.add('senpai-angry', [16, 16], 0, false, isPlayer);
		animation.add('spirit', [19, 19], 0, false, isPlayer);
		animation.add('bf-old', [12, 13], 0, false, isPlayer);
		animation.add('gf', [24], 0, false, isPlayer);
		animation.add('gf-christmas', [16], 0, false, isPlayer);
		animation.add('gf-pixel', [16], 0, false, isPlayer);
		animation.add('parents-christmas', [17, 18], 0, false, isPlayer);
		animation.add('monster', [27, 28], 0, false, isPlayer);
		animation.add('monster-christmas', [14, 15], 0, false, isPlayer);
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
