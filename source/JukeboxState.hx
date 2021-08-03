package;

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
    var name:String;
    var ?song:String;
    var cover:String;
    var bpm:Float;
}

class JukeboxState extends MusicBeatState
{
    var screenbg:FlxSprite = new FlxSprite(0,0).makeGraphic(Std.int(FlxG.width), Std.int(FlxG.height), FlxColor.BLACK);
    var overlay:FlxSprite;
    var songText:AlphabetQuick;
    var lengthText:AlphabetQuick;
    var songs:Array<JukeboxSong> = [
        {name:"Metamorphosis", cover:"week1", bpm:160},
        {name:"Void", cover:"week1", bpm:140},
        {name:"Down Bad", song:"down-bad", cover:"week1", bpm:180},
        {name:"Thriller", cover:"week2", bpm:150},
        {name:"Legendary", cover:"week2", bpm:160},
        {name:"Bazinga", cover:"week2taki", bpm:190},
        {name:"Makomelon", cover:"week3", bpm:160},
        {name:"VIP", song:"vipCurrent", cover:"week3", bpm:170},
        {name:"Farmed", cover:"week3", bpm:160},
        {name:"Honey", cover:"week4", bpm:130},
        {name:"Bunnii", song:'bunni', cover:"week4", bpm:165},
        {name:"Throw It Back", song:"throwItback", cover:"week4", bpm:160},
        {name:'Mild', cover:'week5', bpm:100},
        {name:'Spice', cover:'week5', bpm:150},
        {name:'Party Crasher', song:'party', cover:'week5', bpm:159},
        {name:'Ur Girl', song:'girl', cover:'week6', bpm:144},
        {name:'Chicken Sandwich', song:'chicken', cover:'week6', bpm:150},
        {name:'Funkin God', song:'funkingod', cover:'flippy', bpm:190},
        {name:'Beta VIP', song:'VIP', cover:'extras', bpm:155}
    ];
    var curSelected:Int = 0;
    private var screen:FlxCamera;
	private var cam:FlxCamera;
    var cover:FlxSprite = new FlxSprite(0, 155);

    override function create()
    {
        #if windows
        DiscordClient.changePresence("In the Jukebox Menu, Listening to music", null);
        #end

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
                {
                    FlxG.sound.music.play();
                }
                else
                {
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

        if(lime.utils.Assets.exists(Paths.image('covers/${songs[curSelected].cover}', 'preload')))
        {
            cover.loadGraphic(Paths.image('covers/${songs[curSelected].cover}', 'preload'));
            cover.screenCenter(X);
        }
        else
        {
            trace('cover does not exist for ${songs[curSelected].name}');
        }

        songText.text = '< ${songs[curSelected].name} >';
        Conductor.changeBPM(songs[curSelected].bpm);
       
        var songName:String = songs[curSelected].song == null ? songs[curSelected].name.toLowerCase() : songs[curSelected].song;
        trace('NEXT SONG: $songName');

        if(!loadedSongs.contains(songName))
        {
            loadedSongs.push(songName);
            #if sys
            sys.thread.Thread.create(() -> {
                FlxG.sound.playMusic(Paths.music(songName), 0.75);
                FlxG.sound.music.pause();
                lengthText.text = 'Length : ${Std.int(FlxG.sound.music.length / 1000 / 60)}:${Std.int(FlxG.sound.music.length / 1000) % 60}';
            });
            #else
            FlxG.sound.playMusic(Paths.music(songName), 0.75);
            FlxG.sound.music.pause();
            lengthText.text = 'Length : ${Std.int(FlxG.sound.music.length / 1000 / 60)}:${Std.int(FlxG.sound.music.length / 1000) % 60}';
            #end
        }
        else
        {
            FlxG.sound.playMusic(Paths.music(songName), 0.75);
            FlxG.sound.music.pause();
            lengthText.text = 'Length : ${Std.int(FlxG.sound.music.length / 1000 / 60)}:${Std.int(FlxG.sound.music.length / 1000) % 60}';
        }
    }

    override function beatHit()
    {
        screen.zoom += 0.015;
    }
}