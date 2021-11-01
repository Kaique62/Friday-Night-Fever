package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.group.FlxGroup.FlxTypedGroup;

class GalleryState extends MusicBeatState
{
    var header:AlphabetQuick;
    var text:FlxText;
    var images:Array<GalleryImage> = [
        // first parameter is the image path, second one is the description, third one is the name
        // images must be in assets/preload/images/
        new GalleryImage('gallery/bunny', 'The bunnies in the week 4 BG being worked on.', 'Week 4 Bunnies'),
        new GalleryImage('gallery/cesarBG', 'The original background being worked on.', 'Original \nBackground'),
        new GalleryImage('gallery/DialogueConcept', 'A concept for Cesars dialogue sprites.', 'Dialogue \nConcept'),
        new GalleryImage('gallery/oldPepperEyes', 'The original Pepper eyes.', 'Peppers Eyes'),
        new GalleryImage('gallery/pepperDemon', 'First Pepper Demon concept.', 'Pepper Demon'),
        new GalleryImage('gallery/hunni', 'Hunni (Week 4) being worked on.', 'Hunni Sprites'),
        new GalleryImage('gallery/MEGAAAA', 'Mega (Week 6)s old sprites, also being worked on.', 'Megas Sprites'),
        new GalleryImage('gallery/allSprites', 'All Week 6 sprites next to each other.', 'MEGA'),
        new GalleryImage('gallery/humanMako', 'Mako (Week 3) was originally gonna be a human version.', 'Human Mako'),
        new GalleryImage('gallery/menuConcept', 'The original Custom Menu concept, made by isophoro.', 'Menu Concept'),
        new GalleryImage('gallery/oldcesar', 'The original Cesar sprites.', 'Cesar Sprites'),
        new GalleryImage('gallery/oldcesar6', 'Old Week 6 Cesar being worked on.', 'Cesar Sprites'),
        new GalleryImage('gallery/oldCHERRYSprites', 'Cherry Concept, also can be taken as being worked on.', 'Cherry Sprites'),
        new GalleryImage('gallery/oldHunni', 'Old Concept of Hunni.', 'Hunni Concept'),
        new GalleryImage('gallery/oldLogo', 'The original menu Logo.', 'Main Menu Logo'),
        new GalleryImage('gallery/peakekconcept', 'Concept for Peakek.', 'Peakek Sprites'),
        new GalleryImage('gallery/peakekconcept1', 'Another Concept for Peakek.', 'Peakek Sprites'),
        new GalleryImage('gallery/peakekshape', 'Concept for Peakeks shapeshift.', 'Peakek Sprites'),
        new GalleryImage('gallery/pepperConcept', 'A Concept for Pepper (Week 5).', 'Pepper Concept'),
        new GalleryImage('gallery/room', 'Concept for the room used in "Jukebox".', 'Jukebox Concept'),
        new GalleryImage('gallery/weebStreet', 'BG used in a cut ENA Week.', 'Cut ENA \nWeek'),
        new GalleryImage('gallery/week4Beingworkedon', 'Week 4 being worked on.', 'Week 4'),
        new GalleryImage('gallery/yukichi', 'First Concept for Yukichi.', 'Yukichi Sprites'),
        new GalleryImage('gallery/TeedyNG', 'Fanart of Pepper Demon made by @TeedyNG on twitter!', 'Fanart'),
        new GalleryImage('gallery/six_burger', 'Fanart of Taki and Cesar made by @six_burger on twitter!', 'Fanart'),
        new GalleryImage('gallery/aLazy_Artist', 'Fanart of Down-bad Peakek and Cesar made by @aLazy_Artist on twitter!', 'Fanart'),
        new GalleryImage('gallery/0M0MARI', 'Fanart of Taki made by @0M0MARI on twitter!', 'Fanart'),
        new GalleryImage('gallery/corruptcrumb', 'Fanart of Taki made by @CorruptCrumb on twitter!', 'Fanart'),
        new GalleryImage('gallery/gingamiluki', 'Fanart of Taki made by @GingaMiluki on twitter!', 'Fanart'),
        new GalleryImage('gallery/r0llindownhill', 'Fanart of Week 5 made by @R0llinDownHill on twitter!', 'Fanart'),
        new GalleryImage('gallery/basmega', 'Fanart of Mega made by @Leena73784282 on twitter!', 'Fanart'),
        new GalleryImage('gallery/bastaki', 'Fanart of Taki made by @Leena73784282 on twitter!', 'Fanart'),
        new GalleryImage('gallery/baspeakek', 'Fanart of Peakek made by @Leena73784282 on twitter!', 'Fanart'),
    ];

    var image:FlxSprite;
    var leftImage:FlxSprite;
    var rightImage:FlxSprite;
    var curSelected:Int = 0;
    var allowInputs:Bool = false;
    var topText:AlphabetQuick;
    var arrows:FlxTypedGroup<FlxSprite>;
    override function create()
    {
        super.create();
        var bg:FlxSprite =  new FlxSprite(-686,0).loadGraphic(Paths.image('stageback', 'shared'));
        bg.antialiasing = true;
        add(bg);

        leftImage = new FlxSprite(0,0).loadGraphic(Paths.image('troll'));
        leftImage.antialiasing = true;
        add(leftImage);

        var slash:FlxSprite = new FlxSprite(0,0).loadGraphic(Paths.image('gallerySlash'));
        slash.alpha = 0.65;
        slash.antialiasing = true;
        add(slash);

        topText = new AlphabetQuick(0,0, images[0].name, {bold:true,size:0.55,spacing:5});
        add(topText);

        var galleryText:AlphabetQuick = new AlphabetQuick(0,0, 'Gallery', {bold:true,size:0.75,spacing:5,screenCenterX:true});
        add(galleryText);

        text = new FlxText(10, 156, Std.int(slash.width - 85), images[0].description, 12);
        text.setFormat(Paths.font("Funkin.otf"), 36, FlxColor.WHITE, LEFT);
        add(text);

        image = new FlxSprite(0,0).loadGraphic(Paths.image('troll'));
        image.antialiasing = true;
        add(image);

        rightImage = new FlxSprite(0,0).loadGraphic(Paths.image('troll'));
        rightImage.antialiasing = true;
        rightImage.alpha = 0.5;
        add(rightImage);

        arrows = new FlxTypedGroup<FlxSprite>();
        add(arrows);
        for(i in 0...2)
        {
            var arrow:FlxSprite = new FlxSprite(0,0);
            arrow.frames = Paths.getSparrowAtlas('NOTE_assets', 'shared');
            if(i == 0)
            {
                arrow.animation.addByPrefix('idle', 'arrowLEFT');
                arrow.animation.addByPrefix('pressed', 'left press', 24, false);
                arrow.animation.addByPrefix('confirm', 'left confirm', 24, false);
            }else
            {
                arrow.animation.addByPrefix('idle', 'arrowRIGHT');
                arrow.animation.addByPrefix('pressed', 'right press', 24, false);
                arrow.animation.addByPrefix('confirm', 'right confirm', 24, false);                
            }
            arrow.animation.play('idle');
            arrow.setGraphicSize(Std.int(arrow.width * 0.7));
            arrow.updateHitbox();
            arrow.setPosition(Std.int(FlxG.width / 2) + (i == 0 ? -50 + -290 : 60 + 290), FlxG.height * 0.60);
            arrow.antialiasing = true;
            arrows.add(arrow);
            arrow.animation.finishCallback = function(t){
                if(arrow.animation.curAnim.name == 'confirm')
                {
                    arrow.animation.play('idle');
                    arrow.centerOffsets();
                }
            }
        }

        changeSelection();
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        if(controls.BACK) FlxG.switchState(new MainMenuState());

        if(allowInputs)
        {
            if(controls.RIGHT_P)
                changeSelection(1);

            if(controls.LEFT_P)
                changeSelection(-1);            
        }
    }

    function changeSelection(change:Int = 0)
    {
        curSelected += change;
        if(curSelected >= images.length)
            curSelected = 0;
        else if(curSelected < 0)
            curSelected = images.length - 1;

        if(change == 1)
        {
            arrows.members[1].animation.play('confirm');
            arrows.members[1].centerOffsets();
            arrows.members[1].offset.x -= 13;
            arrows.members[1].offset.y -= 13;
        }
        else if(change == -1)
        {
            arrows.members[0].animation.play('confirm');
            arrows.members[0].centerOffsets();
            arrows.members[0].offset.x -= 13;
            arrows.members[0].offset.y -= 13;
        }

        allowInputs = false;
        image.loadGraphic(Paths.image(images[curSelected].path));
        image.scale.x = 1;
        image.scale.y = 1;
        
        while(image.width > 485)
        {
            image.scale.x -= 0.05;
            image.scale.y -= 0.05;
            image.updateHitbox();
        }
        image.updateHitbox();
        image.screenCenter();
        image.x += 60;
        image.y -= 60;
        image.alpha = 0;
        FlxTween.tween(image, {y: image.y + 60, alpha: 1}, 0.12, {onComplete:function(twn:FlxTween){
            allowInputs = true;
        }});

        if(curSelected != images.length - 1)
        {
            rightImage.visible = true;
            rightImage.loadGraphic(Paths.image(images[curSelected + 1].path));
            rightImage.scale.x = 1;
            rightImage.scale.y = 1;
            rightImage.updateHitbox();
            while(rightImage.width > 240)
            {
                rightImage.scale.x -= 0.05;
                rightImage.scale.y -= 0.05;
                rightImage.updateHitbox();
            }
            rightImage.updateHitbox();
            rightImage.screenCenter();
            rightImage.x = image.x + image.width + 30;
        }else{
            rightImage.visible = false;
        }

        if(curSelected != 0)
        {
            leftImage.visible = true;
            leftImage.loadGraphic(Paths.image(images[curSelected - 1].path));
            leftImage.scale.x = 1;
            leftImage.scale.y = 1;
            leftImage.updateHitbox();
            while(leftImage.width > 240)
            {
                leftImage.scale.x -= 0.05;
                leftImage.scale.y -= 0.05;
                leftImage.updateHitbox();
            }
            leftImage.updateHitbox();
            leftImage.screenCenter();
            leftImage.x = image.x - leftImage.width - 30;
        }else{
            leftImage.visible = false;
        }
        text.text = images[curSelected].description;
        topText.text = images[curSelected].name;
    }
}

class GalleryImage
{
    public var path:String;
    public var description:String;
    public var name:String;

    public function new(img:String, dsc:String, ?Name:String)
    {
        path = img;
        description = dsc;
        name = Name;
    }
}