package;

import lime.utils.Assets;
import StringBuf;

using StringTools;

class CoolUtil
{
	public static var difficultyArray:Array<String> = ['EASY', "NORMAL", "HARD", "BABY"];


	public static function difficultyString():String
	{
		return difficultyArray[PlayState.storyDifficulty];
	}

	public static function coolTextFile(path:String):Array<String>
	{
		var daList:Array<String> = Assets.getText(path).trim().split('\n');

		for (i in 0...daList.length)
		{
			daList[i] = daList[i].trim();
		}

		return daList;
	}

	public static function reverseString(string:String):String
	{
		var newString:StringBuf = new StringBuf();
		for (i in -string.length+1...1) 
			newString.addChar(string.fastCodeAt(-i));
		return string = newString.toString();
	}
	
	public static function coolStringFile(path:String):Array<String>
		{
			var daList:Array<String> = path.trim().split('\n');
	
			for (i in 0...daList.length)
			{
				daList[i] = daList[i].trim();
			}
	
			return daList;
		}

	public static function numberArray(max:Int, ?min = 0):Array<Int>
	{
		var dumbArray:Array<Int> = [];
		for (i in min...max)
		{
			dumbArray.push(i);
		}
		return dumbArray;
	}
}
