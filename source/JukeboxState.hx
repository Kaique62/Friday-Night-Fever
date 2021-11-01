package;

import flixel.system.FlxSound;
import flixel.FlxSprite;
import flixel.util.FlxGradient;
import flixel.tweens.FlxTween;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxCamera;
import flixel.math.FlxMath;
#if windows
import Discord.DiscordClient;
#end

typedef JukeboxSong = {
    var display:String;
    var ?song:String;
    var cover:String;
    var bpm:Float;
    var ?special:Bool;
}

class JukeboxState extends MusicBeatState
{
    var vocals:FlxSound = new FlxSound();
    var loaded:Bool = false;

    var screenbg:FlxSprite = new FlxSprite(0,0).makeGraphic(Std.int(FlxG.width), Std.int(FlxG.height), FlxColor.BLACK);
    var overlay:FlxSprite;
    var songText:AlphabetQuick;
    var lengthText:AlphabetQuick;
    var songs:Array<JukeboxSong> = [
        {display:"Metamorphosis", cover:"week1", bpm:160},
        {display:"Void", cover:"week1", bpm:140},
        {display:"Down Bad", cover:"week1", bpm:180},
        {display:"Star Baby", cover:"week2", bpm:180},
        {display:"Last Meow", cover:"week2", bpm:195},
        {display:"Bazinga", cover:"week2taki", bpm:190},
        {display:"Crucify", cover:"week2taki", bpm:200},
        {display:'Prayer', cover:'taki', bpm:140},
        {display:'Bad Nun', cover:'taki', bpm:140},
        {display:"Mako", cover:"week3", bpm:160},
        {display:"VIM", cover:"week3", bpm:170},
        {display:"Farmed", cover:"week3", bpm:160},
        {display:"Honey", cover:"week4", bpm:130},
        {display:"Bunnii", cover:"week4", bpm:165},
        {display:"Throw It Back", cover:"week4", bpm:160},
        {display:'Mild', cover:'week5', bpm:100},
        {display:'Spice', cover:'week5', bpm:150},
        {display:'Party Crasher', cover:'week5', bpm:159},
        {display:'Ur Girl', cover:'week6', bpm:144},
        {display:'Chicken Sandwich', cover:'week6', bpm:150},
        {display:'Funkin God', cover:'flippy', bpm:190},
        {display:'Hallow', cover:'hallow', bpm:130},
        {display:'Portrait', song:'calamity', cover:'hallow', bpm:140},
        {display:'Hardships', cover:'hardships', bpm:120},
        {display:'Beta VIP', song:'VIP', cover:'extras', bpm:155, special:true}
    ];

    var curSelected:Int = 0;
    private var screen:FlxCamera;
	private var cam:FlxCamera;
    var cover:FlxSprite = new FlxSprite(0, 155);

    override function create()
    {
        super.create();

        FlxG.autoPause = false;
        #if windows
        DiscordClient.changePresence("In the Jukebox Menu, Listening to music", null);
        #end

        screen = new FlxCamera();
		cam = new FlxCamera();
		cam.bgColor.alpha = 0;
		FlxG.cameras.reset(screen);
		FlxG.cameras.add(cam);
		FlxCamera.defaultCameras = [cam];

        FlxG.sound.list.add(vocals);

        persistentUpdate = true;

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

        songText = new AlphabetQuick(0, Std.int(FlxG.height * 0.65), songs[0].display, {bold:true,size:0.6,spacing:4,screenCenterX:true});
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

        var scanlines:FlxSprite = new FlxSprite().loadGraphic(Paths.image('Scanlines'));
        scanlines.antialiasing = true;
        add(scanlines);

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
        {
            FlxG.autoPause = true;
            FlxG.switchState(new MainMenuState());
        }

        if(FlxG.sound.music != null)
        {
            Conductor.songPosition = FlxG.sound.music.time;
            if(controls.ACCEPT && loaded)
            {
                if(!FlxG.sound.music.playing)
                {
                    FlxG.sound.music.play();

                    if(!songs[curSelected].special)
                    {
                        vocals.play();
                        vocals.time = FlxG.sound.music.time;
                    }
                }
                else
                {
                    FlxG.sound.music.pause();
                    if(!songs[curSelected].special)
                        vocals.pause();
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

        if(lime.utils.Assets.exists(Paths.image('covers/${songs[curSelected].cover}', 'preload')))
        {
            cover.loadGraphic(Paths.image('covers/${songs[curSelected].cover}', 'preload'));
            cover.screenCenter(X);
        }

        songText.text = '< ${songs[curSelected].display} >';
        Conductor.changeBPM(songs[curSelected].bpm);
       
        var songName:String = songs[curSelected].special ? songs[curSelected].song : StringTools.replace(songs[curSelected].display.toLowerCase(), ' ', '-');
        trace('Loading Song: $songName');

        var isSys:Bool = false;
        #if sys
        isSys = true;
        #end

        if(loadedSongs.contains(songName) || !isSys)
        {
            loadSong(songName);
        }
        else
        {
            #if sys
            sys.thread.Thread.create(() -> {
                loadSong(songName);
            });
            #end
        }
    }

    override function beatHit()
    {
        screen.zoom += 0.015;
    }

    function loadSong(songName:String)
    {
        loaded = false;
        if(FlxG.sound.music != null)
        {
            FlxG.sound.music.stop();

            if(vocals.playing)
                vocals.stop();
        }

        lengthText.text = "Loading song...";
        FlxG.sound.music.loadEmbedded(songs[curSelected].special ? Paths.music(songName) : Paths.inst(songName));

        if(!songs[curSelected].special)
            vocals.loadEmbedded(Paths.voices(songName));

        loaded = true;

        var seconds:String = '' + Std.int(FlxG.sound.music.length / 1000) % 60;

        if(seconds.length == 1)
            seconds = '0' + seconds;

        lengthText.text = 'Length : ${Std.int(FlxG.sound.music.length / 1000 / 60)}:$seconds';
        loadedSongs.push(songName);
    }
}