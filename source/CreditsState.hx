package;

import flixel.FlxObject;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxMath;
import flixel.tweens.FlxTween;
import openfl.Lib;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.system.FlxSound;

typedef CreditCard = {
    var image:String;
    var ?link:String;
    var ?desc:String;
}

class CreditsState extends MusicBeatState
{
    var camFollow:FlxObject;
    var curSelected:Int = 0;
    var cards:Array<FlxSprite> = [];
    var credits:Array<CreditCard> = [
        //{image:"",link:""} blank
        // higher up people ig
        {image:"mako",link:"https://twitter.com/helloitsmako", desc:"The Leader of the Mod."},
        {image:"cesar",link:"https://twitter.com/CesarFever_", desc:"Co-Directed the mod with helloitsmako."},
        {image:"tea",link:"https://twitter.com/teabunnies02", desc:"CesarFever's Real Girlfriend."},
        // music
        {image:"biddle3",link:"https://twitter.com/TheBiddleMoment", desc:"Was Making Pepper Demon Songs."},
        {image:"birdbonanza",link:"https://twitter.com/BlockBonanza", desc:"Made Party Crasher."},
        {image:"foodieti",link:"https://www.youtube.com/channel/UCkwsJtj4tivX2Dhadglvl5A", desc:"Made MOST Of the Songs."},
        // programming
        {image:"isophoro",link:"https://twitter.com/isophoro", desc:"Carried the Mod :smug:"},
        {image:"rifxii",link:"https://twitter.com/_rifxii", desc:"Also Carried the Mod :smug:"}, // what tf is this asshole doing here???
        {image:"kade",link:"https://twitter.com/kadedeveloper", desc:"made da engine"},
        //artists
        {image:"bastard",link:"https://www.youtube.com/channel/UCtdUKnJQ70psMKmo7E3G0Dg", desc:"First two Week 5 Crowds, Week 4 Bunnies."},
        {image:"kip",link:"https://twitter.com/heartlxcket", desc:"Made some Main Sprites."},
        {image:"winkel",link:"https://www.youtube.com/channel/UCuJYDah7ofPMG2hYVcxZQuA", desc:"Did most of the Pixel Art."},
        {image:"della",link:"https://twitter.com/DellaM4in", desc:"Did Week 6 BG and Casual Cesar."},
        {image:"mega",link:"https://www.youtube.com/channel/UCwNrGRcqwn3NDOm9JJ00h1g", desc:"Made All Dialogue Sprites, and some other things."},
        {image:"pierogii",link:"https://twitter.com/pieroshiki", desc:"Made Yukichi Assets."},
        {image:"puma",link:"https://twitter.com/PumaThe7th", desc:"Did their Week 6 Cameo."},
        {image:"peakek",link:"https://twitter.com/PeakekArts", desc:"Made their own Assets."},
        {image:"hunni",link:"https://twitter.com/HuniBunnii", desc:"Made their own Assets."},
        {image:"fluff",link:"https://twitter.com/FluffedCakes", desc:"Remade their assets 7 times/Original Coder."},
        {image:"circl",link:"https://twitter.com/JustACircleMan", desc:"Made Week 3 BG And Jukebox Covers."},
        {image:"wolfiewee",link:"https://twitter.com/wolfiedust1", desc:"Made their own Assets."},
        //charters
        {image:"fortnite",link:"https://twitter.com/vortmite1", desc:"vortmite charted all these songs"},
        //getrickrolled
        {image:"rickroll",link:"https://www.youtube.com/watch?v=dQw4w9WgXcQ", desc:"???"}
    ];
    var description:FlxText;

    override function create()
    {
        super.create();

        FlxG.save.data.visitedCredits = true;
        FlxG.save.flush();

        var bg:FlxSprite = new FlxSprite(0,0).loadGraphic(Paths.image('credits/bg'));
        bg.scrollFactor.set();
        bg.antialiasing = true;
        add(bg);

        camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);

        FlxG.camera.follow(camFollow, null, 0.065 * (60 / (cast(Lib.current.getChildAt(0), Main)).getFPSCap() ));

        for(i in 0...credits.length)
        {
            var card:FlxSprite = new FlxSprite(0, 60 + (205 * i)).loadGraphic(Paths.image('credits/${credits[i].image.toLowerCase()}', 'preload'));
            card.scale.set(0.8, 0.8);
            card.antialiasing = true;
            card.angle = 8;
            card.alpha = 0.6;
            card.screenCenter(X);
            add(card);
            card.ID = i;
            cards.push(card);
        }

        var logo:FlxSprite = new FlxSprite(0,-60).loadGraphic(Paths.image('credits/e'));
        add(logo);
        logo.scrollFactor.set();
        logo.antialiasing = true;
        logo.screenCenter(X);
        logo.scale.set(0.85, 0.85);

        description = new FlxText(0, FlxG.height * 0.95, 0, "Placeholder", 24);
        description.alpha = 0.87;
        description.setFormat(Paths.font("vcr.ttf"), 24, FlxColor.GRAY, CENTER, OUTLINE, FlxColor.BLACK);
        description.scrollFactor.set();
        add(description);

        changeSelection();
    }

    override function update(elapsed:Float)
    {
        if (FlxG.keys.justPressed.ESCAPE)
        {
            FlxG.switchState(new MainMenuState());
        }
        super.update(elapsed);

        if(controls.UP_P)
            changeSelection(-1);

        if(controls.DOWN_P)
            changeSelection(1);

        if(controls.ACCEPT)
        {
            if(credits[curSelected].link != '' && credits[curSelected].link != null)
            {
                #if linux
                Sys.command('/usr/bin/xdg-open', [credits[curSelected].link, "&"]);
                #else
                FlxG.openURL(credits[curSelected].link);
                #end    
            }
        }
    }

    function changeSelection(change:Int = 0)
    {
        FlxTween.tween(cards[curSelected], {"scale.x": 0.8, "scale.y": 0.8, alpha:0.6, angle:8}, 0.14);
        curSelected += change;
        FlxG.sound.play(Paths.sound('scrollMenu'));
        if(curSelected >= credits.length)
            curSelected = 0;
        else if(curSelected < 0)
            curSelected = credits.length - 1;

        camFollow.setPosition(cards[curSelected].getGraphicMidpoint().x, cards[curSelected].getGraphicMidpoint().y);
        FlxTween.tween(cards[curSelected], {"scale.x": 0.86, "scale.y": 0.86, alpha:1, angle:5}, 0.14);
    
        description.text = credits[curSelected].desc;
        description.screenCenter(X);

        if(FlxG.sound.music != null)
        {
            if(curSelected == credits.length - 1)
                FlxG.sound.music.fadeOut(4.2, 0.013);
            else
                FlxG.sound.music.fadeOut(2.2, 0.7);
        }
    }
}