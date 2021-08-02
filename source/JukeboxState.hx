package;

import flixel.FlxSprite;
import flixel.util.FlxGradient;
import flixel.tweens.FlxTween;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxCamera;
import flixel.math.FlxMath;
import Discord.DiscordClient;

class JukeboxState extends MusicBeatState
{
    var screenbg:FlxSprite = new FlxSprite(0,0).makeGraphic(Std.int(FlxG.width), Std.int(FlxG.height), FlxColor.BLACK);
    var overlay:FlxSprite;
    var songText:AlphabetQuick;
    var lengthText:AlphabetQuick;
    var songs:Array<JukeboxSong> = [
        new JukeboxSong('Metamorphosis', 'metamorphosis', 'week1', 160),
        new JukeboxSong('Void', 'void', 'week1', 140),
        new JukeboxSong('Down Bad', 'down-bad', 'week1', 180),
        new JukeboxSong('Thriller', 'thriller', 'week2', 150),
        new JukeboxSong('Legendary', 'legendary', 'week2', 160),
        new JukeboxSong('Bazinga', 'bazinga', 'week2taki', 190),
        new JukeboxSong('Makomelon', 'makomelon', 'week3', 160),
        new JukeboxSong('VIP', 'vipCurrent', 'week3', 170),
        new JukeboxSong('Farmed', 'farmed', 'week3', 160),
        new JukeboxSong('Honey', 'honey', 'week4', 130),
        new JukeboxSong('Bunnii', 'bunni', 'week4', 165),
        new JukeboxSong('Throw It Back', 'throwItback', 'week4', 160),
        new JukeboxSong('Mild', 'mild', 'week5', 100),
        new JukeboxSong('Spice', 'spice', 'week5', 150),
        new JukeboxSong('Party Crasher', 'party', 'week5', 159),
        new JukeboxSong('Ur Girl', 'girl', 'week6', 144),
        new JukeboxSong('Chicken Sandwich', 'chicken', 'week6', 150),
        new JukeboxSong('Funkin God', 'funkingod', 'flippy', 190),
        new JukeboxSong('BETA VIP', 'VIP', 'extras', 155),
    ];
    var curSelected:Int = 0;
    private var screen:FlxCamera;
	private var cam:FlxCamera;
    var cover:FlxSprite = new FlxSprite(0, 155);

    override function create()
    {

        DiscordClient.changePresence("In the Jukebox Menu, Listening to music", null);

        screen = new FlxCamera();
		cam = new FlxCamera();
		cam.bgColor.alpha = 0;
		FlxG.cameras.reset(screen);
		FlxG.cameras.add(cam);
		FlxCamera.defaultCameras = [cam];

        persistentUpdate = true;

        super.create();

        screenbg = FlxGradient.createGradientFlxSprite(Std.int(FlxG.width),  Std.int(FlxG.height), [FlxColor.fromString('#58FFC7'), FlxColor.fromString('#C2FF8C')]);
        add(screenbg);
        screenbg.cameras = [screen];

        cover.loadGraphic(Paths.image('troll'));
        cover.screenCenter(X);
        cover.antialiasing = true;
        cover.cameras = [screen];
        add(cover);

        var text:AlphabetQuick = new AlphabetQuick(0, cover.y - 55, 'Jukebox', {bold:true,size:0.6,spacing:4,screenCenterX:true});
        text.cameras = [screen];
        add(text);

        songText = new AlphabetQuick(0, Std.int(FlxG.height * 0.65), songs[0].name, {bold:true,size:0.6,spacing:4,screenCenterX:true});
        songText.cameras = [screen];
        add(songText);

        lengthText = new AlphabetQuick(0, Std.int(FlxG.height * 0.72), '',{bold:false,size:0.5,spacing:3,screenCenterX:true});
        lengthText.cameras = [screen];
        add(lengthText);

        var playText:AlphabetQuick = new AlphabetQuick(0, Std.int(FlxG.height * 0.82), 'Press SPACE to play',{bold:false,size:0.5,spacing:3,screenCenterX:true});
        playText.cameras = [screen];
        add(playText);

        var leaveText:AlphabetQuick = new AlphabetQuick(0, Std.int(FlxG.height * 0.88), 'Press ESC to leave', {bold:false,size:0.5,spacing:3,screenCenterX:true});
        leaveText.cameras = [screen];
        add(leaveText);

        songText.cameras = [screen];

        overlay = new FlxSprite(0,0).loadGraphic(Paths.image('LMAO'));
        overlay.antialiasing = true;
        add(overlay);

        changeSong();
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        screen.zoom = FlxMath.lerp(0.9, screen.zoom, 0.95);

        if(controls.LEFT_P || controls.RIGHT_P)
            changeSong(controls.LEFT_P ? -1 : 1);

        if(controls.BACK)
            FlxG.switchState(new MainMenuState());

        if(FlxG.sound.music != null)
        {
            Conductor.songPosition = FlxG.sound.music.time;
            if(controls.ACCEPT)
            {
                if(!FlxG.sound.music.playing)
                    FlxG.sound.music.play();
                else{
                    FlxG.sound.music.pause();
                    songText.changeColor(FlxColor.WHITE);
                }
            }
        }
    }

    static var loadedSongs:Array<String> = [];
    function changeSong(change:Int = 0)
    {
        if(FlxG.sound.music != null)
            FlxG.sound.music.stop();

        curSelected += change;
        if(curSelected >= songs.length)
            curSelected = 0;
        else if(curSelected < 0)
            curSelected = songs.length - 1;

        if(lime.utils.Assets.exists(Paths.image('covers/${songs[curSelected].image}', 'preload')))
        {
            cover.loadGraphic(Paths.image('covers/${songs[curSelected].image}', 'preload'));
            cover.screenCenter(X);
        }else{
            trace('cover does not exist for ${songs[curSelected].name}');
        }

        songText.text = '< ${songs[curSelected].name} >';
        Conductor.changeBPM(songs[curSelected].bpm);

        #if sys
        if(!loadedSongs.contains(songs[curSelected].name))
        {
            loadedSongs.push(songs[curSelected].name);
            sys.thread.Thread.create(() -> {
                FlxG.sound.playMusic(Paths.music(songs[curSelected].path), 0.75);
                FlxG.sound.music.pause();
                lengthText.text = 'Length : ${Std.int(FlxG.sound.music.length / 1000 / 60)}:${Std.int(FlxG.sound.music.length / 1000) % 60}';
            }); 
        }else{
            FlxG.sound.playMusic(Paths.music(songs[curSelected].path), 0.75);
            FlxG.sound.music.pause();
            lengthText.text = 'Length : ${Std.int(FlxG.sound.music.length / 1000 / 60)}:${Std.int(FlxG.sound.music.length / 1000) % 60}';
        }
        #else
        FlxG.sound.playMusic(Paths.music(songs[curSelected].path), 0.75);
        FlxG.sound.music.pause();
        lengthText.text = 'Length : ${Std.int(FlxG.sound.music.length / 1000 / 60)}:${Std.int(FlxG.sound.music.length / 1000) % 60}';
        #end
    }

    override function beatHit()
    {
        screen.zoom += 0.015;
    }
}

class JukeboxSong
{
    public var name:String;
    public var path:String;
    public var bpm:Float;
    public var image:String;
    public function new(_name:String, _path:String, _img:String, ?_bpm:Float)
    {
        name = _name;
        path = _path;
        image = _img;
        bpm = _bpm;
    }
}