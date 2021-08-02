package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';

	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;

	public var finishThing:Void->Void;

	var portraitLeft:FlxSprite;
	var portraitRight:FlxSprite;
	var fever:FlxSprite;
	var tea:FlxSprite;
	var mako:FlxSprite;
	var nar:FlxSprite;
	var demomFever:FlxSprite;
	var NPC:FlxSprite;
	var feverS:FlxSprite;
	var peakek:FlxSprite;
	var feverspritesAGAIN:FlxSprite;
	var wolfie:FlxSprite;
	var taki:FlxSprite;

	var handSelect:FlxSprite;
	var bgFade:FlxSprite;

	var bg:FlxSprite;
	var main:FlxSprite;
	var end:FlxSprite;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'ur-girl':
				FlxG.sound.playMusic(Paths.music('Lunchbox'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'funkin-god':
				FlxG.sound.playMusic(Paths.music('LunchboxScary'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
		}

		bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), 0xFFB3DFd8);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		add(bgFade);

		bg = new FlxSprite(0,0).makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);
		bg.visible = false;
		bg.scrollFactor.set();

		new FlxTimer().start(0.83, function(tmr:FlxTimer)
		{
			bgFade.alpha += (1 / 5) * 0.7;
			if (bgFade.alpha > 0.7)
				bgFade.alpha = 0.7;
		}, 5);

			box = new FlxSprite(-20, 458);
		
		var hasDialog = false;
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'ur-girl' | 'makomelon' | 'tutorial' | 'metamorphosis' | 'void' | 'bazinga' | 'down-bad' | 'party-crasher' | 'chicken-sandwich' | 'funkin-god':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('dialogue/textbox');
				box.animation.addByPrefix('normalOpen', 'textbox idle', 24, false);
				box.animation.addByIndices('normal', 'textbox idle', [4], "", 24);

				switch(PlayState.SONG.song.toLowerCase())
				{
					case 'chicken-sandwich':
						FlxG.sound.play(Paths.sound('ANGRY_TEXT_BOX'));
					case 'funkin-god':
						var face:FlxSprite = new FlxSprite(320, 170).loadGraphic(Paths.image('weeb/spiritFaceForward'));
						face.setGraphicSize(Std.int(face.width * 6));
						add(face);
				}
		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;
		
		portraitLeft = new FlxSprite(-20, 40);
		portraitLeft.frames = Paths.getSparrowAtlas('weeb/senpaiPortrait');
		portraitLeft.animation.addByPrefix('enter', 'Senpai Portrait Enter', 24, false);
		portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.9));
		portraitLeft.updateHitbox();
		portraitLeft.scrollFactor.set();
		add(portraitLeft);
		portraitLeft.visible = false;

		portraitRight = new FlxSprite(0, 40);
		portraitRight.frames = Paths.getSparrowAtlas('weeb/bfPortrait');
		portraitRight.animation.addByPrefix('enter', 'Boyfriend portrait enter', 24, false);
		portraitRight.setGraphicSize(Std.int(portraitRight.width * PlayState.daPixelZoom * 0.9));
		portraitRight.updateHitbox();
		portraitRight.scrollFactor.set();
		add(portraitRight);
		portraitRight.visible = false;

		fever = new FlxSprite(830, -11);
		fever.frames = Paths.getSparrowAtlas('dialogue/feversprites');
		fever.animation.addByPrefix('point', 'feverpoint', 24, false);
		fever.animation.addByPrefix('silly', 'feversilly', 24, false);
		fever.animation.addByPrefix('worry', 'feverworry', 24, false);
		fever.animation.addByPrefix('flirt', 'feverflirt', 24, false);
		fever.animation.addByPrefix('scared', 'feverscared', 24, false);
		fever.animation.addByPrefix('confuse', 'feverconfuse', 24, false);
		fever.animation.addByPrefix('tired', 'fevertired', 24, false);
		fever.animation.addByPrefix('fine', 'feverfine', 24, false);
		fever.animation.addByPrefix('annoyed', 'feverannoyed', 24, false);
		fever.animation.addByPrefix('casPoint', 'casualpoint', 24, false);
		fever.animation.addByPrefix('casConfused', 'casualconfused', 24, false);
		fever.animation.addByPrefix('casScared', 'casualscared', 24, false);
		fever.animation.addByPrefix('casWorry', 'casualworry', 24, false);
		fever.animation.addByPrefix('casFlirt', 'casualflirt', 24, false);
		fever.animation.addByPrefix('casSilly', 'casualsilly', 24, false);
		fever.animation.addByPrefix('casTired', 'casualtired', 24, false);
		fever.animation.addByPrefix('casFine', 'casualfine', 24, false);
		fever.animation.addByPrefix('casAnnoyed', 'casualannoyed', 24, false);
		fever.scrollFactor.set();
		add(fever);
		fever.visible = false;

		feverS = new FlxSprite(830, -11);
		feverS.frames = Paths.getSparrowAtlas('dialogue/feversmile');
		feverS.animation.addByPrefix('smile', 'feversmile idle', 24, false);
		feverS.scrollFactor.set();
		add(feverS);
		feverS.visible = false;

		feverspritesAGAIN = new FlxSprite(800, -11);
		feverspritesAGAIN.frames = Paths.getSparrowAtlas('dialogue/FeverPoint2');
		feverspritesAGAIN.animation.addByPrefix('point2', 'FeverPoint2', 24, false);
		feverspritesAGAIN.scrollFactor.set();
		add(feverspritesAGAIN);
		feverspritesAGAIN.visible = false;

		peakek = new FlxSprite(0, -21);
		peakek.frames = Paths.getSparrowAtlas('dialogue/peakek sprites');
		peakek.animation.addByPrefix('kekHappy', 'kekHappy', 24, false);
		peakek.animation.addByPrefix('peaClown', 'peaClown', 24, false);
		peakek.animation.addByPrefix('peaCorrupt', 'peaCorrupt', 24, false);
		peakek.animation.addByPrefix('peaFever', 'peaFever', 24, false);
		peakek.animation.addByPrefix('peaHappy', 'peaHappy', 0, false);
		peakek.updateHitbox();
		peakek.scrollFactor.set();
		add(peakek);
		peakek.visible = false;

		tea = new FlxSprite(0, -21);
		tea.frames = Paths.getSparrowAtlas('dialogue/teaSprites');
		tea.animation.addByPrefix('smile', 'teaSmile', 24, false);
		tea.animation.addByPrefix('neutral', 'teaNeutral', 24, false);
		tea.animation.addByPrefix('worry', 'teaWorry', 24, false);
		tea.animation.addByPrefix('blush', 'teaBlush', 24, false);
		tea.animation.addByPrefix('annoy', 'teaAnnoy', 0, false);
		tea.animation.addByPrefix('annoytwo', 'teaAnnoy2', 24, false);
		tea.animation.addByPrefix('think', 'teaThink', 24, false);
		tea.animation.addByPrefix('angry', 'teaAngry', 24, false);
		tea.scrollFactor.set();
		add(tea);
		tea.visible = false;

		mako = new FlxSprite(767, 66);
		mako.frames = Paths.getSparrowAtlas('dialogue/makoSprites');
		mako.animation.addByPrefix('angry', 'makoAngry', 24, false);
		mako.animation.addByPrefix('ew', 'makoEw', 24, false);
		mako.animation.addByPrefix('blush', 'makoBlush', 24, false);
		mako.animation.addByPrefix('happy', 'makoHappy', 24, false);
		mako.scrollFactor.set();
		add(mako);
		mako.visible = false;

		demomFever = new FlxSprite(830, -11);
		demomFever.frames = Paths.getSparrowAtlas('dialogue/demon fever');
		demomFever.animation.addByPrefix('prisoner', 'prisonerfever', 24, false);
		demomFever.scrollFactor.set();
		add(demomFever);
		demomFever.visible = false;

		nar = new FlxSprite(3000, 3000);
		nar.frames = Paths.getSparrowAtlas('dialogue/makoSprites');
		nar.animation.addByPrefix('seeme', 'makoAngry', 24, false);
		nar.scrollFactor.set();
		add(nar);
		nar.visible = false;
		
		NPC = new FlxSprite(0, -21);
		NPC.frames = Paths.getSparrowAtlas('dialogue/heCamefromtheShadowRealm');
		NPC.animation.addByPrefix('boo', 'heCamefromtheShadowRealm idle', 24, false);
		NPC.scrollFactor.set();
		add(NPC);
		NPC.visible = false;

		taki = new FlxSprite(0, -21);
		taki.frames = Paths.getSparrowAtlas('dialogue/TakiSprites');
		taki.animation.addByPrefix('takismile', 'TakiSmile', 24, false);
		taki.animation.addByPrefix('takieyesopen', 'TakiEyesOpen', 24, false);
		taki.animation.addByPrefix('takibouttakillu', 'TakiBouttaKillu', 24, false);
		taki.scrollFactor.set();
		add(taki);
		taki.visible = false;

		wolfie = new FlxSprite(0, -21);
		wolfie.frames = Paths.getSparrowAtlas('dialogue/TakiSprites');
		wolfie.animation.addByPrefix('takismile', 'TakiSmile', 24, false);
		wolfie.animation.addByPrefix('takieyesopen', 'TakiEyesOpen', 24, false);
		wolfie.animation.addByPrefix('takibouttakillu', 'TakiBouttaKillu', 24, false);
		wolfie.scrollFactor.set();
		add(wolfie);
		wolfie.visible = false;
		
		box.animation.play('normalOpen');
		add(box);

		FlxG.mouse.visible = true;


		box.screenCenter(X);
		portraitLeft.screenCenter(X);

		handSelect = new FlxSprite(FlxG.width * 0.9, FlxG.height * 0.9).loadGraphic(Paths.image('weeb/pixelUI/hand_textbox'));
		add(handSelect);

		if (!talkingRight)
		{
			// box.flipX = true;
		}

		dropText = new FlxText(50, 500, Std.int(FlxG.width * 0.9), "", 46);
		dropText.font = 'Plunge';
		dropText.color = 0xffffff;
		add(dropText);

		swagDialogue = new FlxTypeText(50, 500, Std.int(FlxG.width * 0.9), "", 46);
		swagDialogue.font = 'Plunge';
		swagDialogue.color = 0xffffff;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
		swagDialogue.delay = 0.04;
		add(swagDialogue);

		main = new FlxSprite(419, 656);
		main.frames = Paths.getSparrowAtlas('dialogue/DiaButtons');
		main.animation.addByPrefix('idle', 'mainMenu', 24, false);
		main.animation.addByPrefix('over', 'MainGlow', 24, false);
		main.animation.play('idle');
		main.updateHitbox();
		main.active = true;
		add(main);

		end = new FlxSprite(679, 660);
		end.frames = Paths.getSparrowAtlas('dialogue/DiaButtons');
		end.animation.addByPrefix('normal', 'Skip', 0, false);
		end.animation.addByPrefix('glow', 'SkipGlow', 0, false);
		end.animation.play('normal');
		end.updateHitbox();
		end.active = true;
		add(end);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
			//was stupid and put it above -iso
			if(FlxG.mouse.overlaps(main))
			{
				main.animation.play('over');
				if(FlxG.mouse.justPressed)
				{
					FlxG.switchState(new MainMenuState());
					FlxG.sound.music.stop();
				}
			}
			else
			{
				main.animation.play('idle');
			}


			//ends the dialogue lol
			if(FlxG.mouse.overlaps(end))
			{
				end.animation.play('glow');
				if(FlxG.mouse.justPressed)
				{
					FlxG.sound.music.stop();
					finishThing();
					kill();
				}
			}
			else
			{
				end.animation.play('normal');
			}
		// HARD CODING CUZ IM STUPDI
		if (PlayState.SONG.song.toLowerCase() == 'chicken-sandwich')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'funkin-god')
		{
			portraitLeft.color = FlxColor.BLACK;
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
		}

		dropText.text = swagDialogue.text;

		if (box.animation.curAnim != null)
		{
			if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
			{
				box.animation.play('normal');
				dialogueOpened = true;
			}
		}

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}

		if (FlxG.keys.justPressed.ANY  && dialogueStarted == true)
		{
				
			FlxG.sound.play(Paths.sound('clickText'), 0.8);

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;

					if (PlayState.SONG.song.toLowerCase() == 'ur-girl' || PlayState.SONG.song.toLowerCase() == 'funkin-god')
						FlxG.sound.music.fadeOut(2.2, 0);

					new FlxTimer().start(0.2, function(tmr:FlxTimer)
					{
						box.alpha -= 1 / 5;
						tea.alpha -= 1 / 5;
						fever.alpha -= 1 / 5;
						mako.alpha -= 1 / 5;
						bgFade.alpha -= 1 / 5 * 0.7;
						portraitLeft.visible = false;
						portraitRight.visible = false;
						swagDialogue.alpha -= 1 / 5;
						dropText.alpha = swagDialogue.alpha;
					}, 5);

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;

	function startDialogue():Void
	{
		cleanDialog();
		
		var blockedCharacters:Array<String> = ['bg', 'hidebg', 'song', 'fuckoff', 'sfx', 'stfusfx', 'slow', 'normal'];
		if(!blockedCharacters.contains(curCharacter))
		{
			swagDialogue.resetText(dialogueList[0]);
			swagDialogue.start(swagDialogue.delay, true);

			switch (curCharacter)
			{
				// ISO WHYYY
				case 'dad':
					portraitRight.visible = false;
					if (!portraitLeft.visible)
					{
						portraitLeft.visible = true;
						portraitLeft.animation.play('enter');
					}
				case 'bf':
					portraitLeft.visible = false;
					if (!portraitRight.visible)
					{
						portraitRight.visible = true;
						portraitRight.animation.play('enter');
					}
				case 'feversmile':
					tea.visible = false;
					mako.visible = false;
					peakek.visible = false;
					NPC.visible = false;
					demomFever.visible = false;
					fever.visible = false;
					feverspritesAGAIN.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					feverS.animation.play('smile');
					if (!feverS.visible)
					{
						feverS.visible = true;
						feverS.animation.play('smile');
					}
				case 'feverpoint':
					tea.visible = false;
					mako.visible = false;
					NPC.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					peakek.visible = false;
					demomFever.visible = false;
					feverS.visible = false;
					feverspritesAGAIN.visible = false;
					fever.animation.play('point');
					if (!fever.visible)
					{
						fever.visible = true;
						fever.animation.play('point');
					}
				case 'feversilly':
					tea.visible = false;
					mako.visible = false;
					NPC.visible = false;
					peakek.visible = false;
					feverS.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					demomFever.visible = false;
					feverspritesAGAIN.visible = false;
					fever.animation.play('silly');
					if (!fever.visible)
					{
						fever.visible = true;
						fever.animation.play('silly');
					}
				case 'feverworry':
					tea.visible = false;
					mako.visible = false;
					demomFever.visible = false;
					feverS.visible = false;
					peakek.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					NPC.visible = false;
					feverspritesAGAIN.visible = false;
					fever.animation.play('worry');
					if (!fever.visible)
					{
						fever.visible = true;
						fever.animation.play('worry');
					}
				case 'feverflirt':
					tea.visible = false;
					peakek.visible = false;
					mako.visible = false;
					NPC.visible = false;
					feverS.visible = false;
					demomFever.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					feverspritesAGAIN.visible = false;
					fever.animation.play('flirt');
					if (!fever.visible)
					{
						fever.visible = true;
						fever.animation.play('flirt');
					}
				case 'feverscared':
					tea.visible = false;
					mako.visible = false;
					NPC.visible = false;
					peakek.visible = false;
					feverspritesAGAIN.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					feverS.visible = false;
					demomFever.visible = false;
					fever.animation.play('scared');
					if (!fever.visible)
					{
						fever.visible = true;
						fever.animation.play('scared');
					}
				case 'feverscaredjump':
					feverspritesAGAIN.visible = false;
					tea.visible = false;
					peakek.visible = false;
					NPC.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					feverS.visible = false;
					mako.visible = false;
					demomFever.visible = false;
					fever.animation.play('scared');
					if (!fever.visible)
					{
						FlxTween.tween(fever, {"scale.y": 1.05, y: fever.y - 18}, 0.05, { onComplete: function(twn:FlxTween){
							FlxTween.tween(fever, {"scale.y": 1, y: fever.y + 18}, 0.04, { ease: FlxEase.elasticInOut });
						}});
						fever.visible = true;
						fever.animation.play('scared');
					}
				case 'feverconfuse':
					tea.visible = false;
					mako.visible = false;
					peakek.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					demomFever.visible = false;
					NPC.visible = false;
					feverspritesAGAIN.visible = false;
					feverS.visible = false;
					fever.animation.play('confuse');
					if (!fever.visible)
					{
						fever.visible = true;
						fever.animation.play('confuse');
					}
				case 'fevertired':
					taki.visible = false;
					wolfie.visible = false;
					tea.visible = false;
					mako.visible = false;
					feverspritesAGAIN.visible = false;
					demomFever.visible = false;
					peakek.visible = false;
					NPC.visible = false;
					feverS.visible = false;
					fever.animation.play('tired');
					if (!fever.visible)
					{
						fever.visible = true;
						fever.animation.play('tired');
					}
				case 'feverfine':
					tea.visible = false;
					peakek.visible = false;
					mako.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					feverspritesAGAIN.visible = false;
					NPC.visible = false;
					demomFever.visible = false;
					feverS.visible = false;
					fever.animation.play('fine');
					if (!fever.visible)
					{
						fever.visible = true;
						fever.animation.play('fine');
					}
				case 'feverannoyed':
					tea.visible = false;
					mako.visible = false;
					feverspritesAGAIN.visible = false;
					feverS.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					demomFever.visible = false;
					peakek.visible = false;
					NPC.visible = false;
					fever.animation.play('annoyed');
					if (!fever.visible)
					{
						fever.visible = true;
						fever.animation.play('annoyed');
					}
				case 'casualpoint':
					tea.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					feverspritesAGAIN.visible = false;
					mako.visible = false;
					peakek.visible = false;
					NPC.visible = false;
					demomFever.visible = false;
					feverS.visible = false;
					fever.animation.play('casPoint');
					if (!fever.visible)
					{
						fever.visible = true;
						fever.animation.play('casPoint');
					}
				case 'casualconfuse':
					tea.visible = false;
					mako.visible = false;
					peakek.visible = false;
					feverspritesAGAIN.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					demomFever.visible = false;
					feverS.visible = false;
					NPC.visible = false;
					fever.animation.play('casConfused');
					if (!fever.visible)
					{
						fever.visible = true;
						fever.animation.play('casConfused');
					}
				case 'casualscared':
					tea.visible = false;
					mako.visible = false;
					feverspritesAGAIN.visible = false;
					NPC.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					feverS.visible = false;
					peakek.visible = false;
					demomFever.visible = false;
					fever.animation.play('casScared');
					if (!fever.visible)
					{
						fever.visible = true;
						fever.animation.play('casScared');
					}
				case 'casualworry':
					tea.visible = false;
					mako.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					feverspritesAGAIN.visible = false;
					peakek.visible = false;
					feverS.visible = false;
					demomFever.visible = false;
					NPC.visible = false;
					fever.animation.play('casWorry');
					if (!fever.visible)
					{
						fever.visible = true;
						fever.animation.play('casWorry');
					}
				case 'casualflirt':
					tea.visible = false;
					mako.visible = false;
					NPC.visible = false;
					feverspritesAGAIN.visible = false;
					peakek.visible = false;
					demomFever.visible = false;
					feverS.visible = false;
					fever.animation.play('casFlirt');
					if (!fever.visible)
					{
						fever.visible = true;
						fever.animation.play('casFlirt');
					}
				case 'casualsilly':
					tea.visible = false;
					mako.visible = false;
					NPC.visible = false;
					feverS.visible = false;
					peakek.visible = false;
					demomFever.visible = false;
					feverspritesAGAIN.visible = false;
					fever.animation.play('casSilly');
					if (!fever.visible)
					{
						fever.visible = true;
						fever.animation.play('casSilly');
					}
				case 'casualtired':
					tea.visible = false;
					NPC.visible = false;
					feverspritesAGAIN.visible = false;
					mako.visible = false;
					feverS.visible = false;
					peakek.visible = false;
					demomFever.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					fever.animation.play('casTired');
					if (!fever.visible)
					{
						fever.visible = true;
						fever.animation.play('casTired');
					}
				case 'casualfine':
					tea.visible = false;
					peakek.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					mako.visible = false;
					demomFever.visible = false;
					feverspritesAGAIN.visible = false;
					NPC.visible = false;
					feverS.visible = false;
					fever.animation.play('casFine');
					if (!fever.visible)
					{
						fever.visible = true;
						fever.animation.play('casFine');
					}
				case 'casualannoyed':
					tea.visible = false;
					mako.visible = false;
					NPC.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					feverspritesAGAIN.visible = false;
					peakek.visible = false;
					feverS.visible = false;
					demomFever.visible = false;
					fever.animation.play('casAnnoyed');
					if (!fever.visible)
					{
						fever.visible = true;
						fever.animation.play('casAnnoyed');
					}
				case 'teasmile':
					fever.visible = false;
					feverspritesAGAIN.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					mako.visible = false;
					peakek.visible = false;
					feverS.visible = false;
					demomFever.visible = false;
					NPC.visible = false;
					tea.animation.play('smile');
					if (!tea.visible)
					{
						tea.visible = true;
						tea.animation.play('smile');
					}
				case 'teaneutral':
					fever.visible = false;
					mako.visible = false;
					peakek.visible = false;
					NPC.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					feverS.visible = false;
					feverspritesAGAIN.visible = false;
					demomFever.visible = false;
					tea.animation.play('neutral');
					if (!tea.visible)
					{
						tea.visible = true;
						tea.animation.play('neutral');
					}
				case 'teaworry':
					fever.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					mako.visible = false;
					peakek.visible = false;
					NPC.visible = false;
					feverspritesAGAIN.visible = false;
					feverS.visible = false;
					demomFever.visible = false;
					tea.animation.play('worry');
					if (!tea.visible)
					{
						tea.visible = true;
						tea.animation.play('worry');
					}
				case 'teaworryjump':
					fever.visible = false;
					mako.visible = false;
					feverspritesAGAIN.visible = false;
					peakek.visible = false;
					NPC.visible = false;
					feverS.visible = false;
					demomFever.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					tea.animation.play('worry');
					if (!tea.visible)
					{
						FlxTween.tween(tea, {"scale.y": 1.05, y: tea.y - 18}, 0.05, { onComplete: function(twn:FlxTween){
							FlxTween.tween(tea, {"scale.y": 1, y: tea.y + 18}, 0.04, { ease: FlxEase.elasticInOut });
						}});
						tea.visible = true;
						tea.animation.play('worry');
					}
				case 'teablush':
					fever.visible = false;
					mako.visible = false;
					feverS.visible = false;
					demomFever.visible = false;
					peakek.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					NPC.visible = false;
					feverspritesAGAIN.visible = false;
					tea.animation.play('blush');
					if (!tea.visible)
					{
						tea.visible = true;
						tea.animation.play('blush');
					}
				case 'teaannoy':
					fever.visible = false;
					mako.visible = false;
					feverspritesAGAIN.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					demomFever.visible = false;
					NPC.visible = false;
					feverspritesAGAIN.visible = false;
					peakek.visible = false;
					feverS.visible = false;
					tea.animation.play('annoy');
					if (!tea.visible)
					{
						tea.visible = true;
						tea.animation.play('annoy');
					}
				case 'teatwo':
					fever.visible = false;
					mako.visible = false;
					demomFever.visible = false;
					feverspritesAGAIN.visible = false;
					feverS.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					peakek.visible = false;
					NPC.visible = false;
					tea.animation.play('annoytwo');
					if (!tea.visible)
					{
						tea.visible = true;
						tea.animation.play('annoytwo');
						trace('bruhthisshitworking');
					}
				case 'teathink':
					fever.visible = false;
					mako.visible = false;
					feverspritesAGAIN.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					peakek.visible = false;
					feverS.visible = false;
					demomFever.visible = false;
					NPC.visible = false;
					tea.animation.play('think');
					if (!tea.visible)
					{
						tea.visible = true;
						tea.animation.play('think');
					}
				case 'teaangry':
					fever.visible = false;
					mako.visible = false;
					demomFever.visible = false;
					feverspritesAGAIN.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					feverS.visible = false;
					peakek.visible = false;
					NPC.visible = false;
					tea.animation.play('angry');
					if (!tea.visible)
					{
						tea.visible = true;
						tea.animation.play('angry');
					}
				case 'makoangry':
					fever.visible = false;
					tea.visible = false;
					feverspritesAGAIN.visible = false;
					demomFever.visible = false;
					feverS.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					peakek.visible = false;
					NPC.visible = false;
					mako.animation.play('angry');
					if (!mako.visible)
					{
						mako.visible = true;
						mako.animation.play('angry');
					}
				case 'makoew':
					fever.visible = false;
					tea.visible = false;
					feverS.visible = false;
					peakek.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					feverspritesAGAIN.visible = false;
					demomFever.visible = false;
					NPC.visible = false;
					mako.animation.play('ew');
					if (!mako.visible)
					{
						mako.visible = true;
						mako.animation.play('ew');
					}
				case 'makoblush':
					taki.visible = false;
					wolfie.visible = false;
					fever.visible = false;
					feverS.visible = false;
					tea.visible = false;
					demomFever.visible = false;
					feverspritesAGAIN.visible = false;
					peakek.visible = false;
					NPC.visible = false;
					mako.animation.play('blush');
					if (!mako.visible)
					{
						mako.visible = true;
						mako.animation.play('blush');
					}
				case 'makohappy':
					fever.visible = false;
					tea.visible = false;
					demomFever.visible = false;
					feverS.visible = false;
					peakek.visible = false;
					NPC.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					feverspritesAGAIN.visible = false;
					mako.animation.play('happy');
					if (!mako.visible)
					{
						mako.visible = true;
						mako.animation.play('happy');
					}
				case 'narrator':
					fever.visible = false;
					tea.visible = false;
					mako.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					demomFever.visible = false;
					feverspritesAGAIN.visible = false;
					feverS.visible = false;
					peakek.visible = false;
					NPC.visible = false;
					nar.animation.play('seeme');
					if (!nar.visible)
					{
						nar.visible = false;
						nar.animation.play('seeme');
					}
				case 'prisoner':
					fever.visible = false;
					tea.visible = false;
					feverS.visible = false;
					mako.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					feverspritesAGAIN.visible = false;
					peakek.visible = false;
					NPC.visible = false;
					demomFever.animation.play('prisoner');
					if (!demomFever.visible)
					{
						demomFever.visible = true;
						demomFever.animation.play('prisoner');
					}
				case 'NPC':
					fever.visible = false;
					tea.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					mako.visible = false;
					peakek.visible = false;
					feverspritesAGAIN.visible = false;
					demomFever.visible = false;
					feverS.visible = false;
					if (!NPC.visible)
					{
						NPC.visible = true;
						NPC.animation.play('boo');
					}
				case 'kekhappy':
					fever.visible = false;
					tea.visible = false;
					mako.visible = false; 
					feverspritesAGAIN.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					feverS.visible = false;
					demomFever.visible = false;
					NPC.visible = false;
					peakek.animation.play('kekHappy');
					if (!peakek.visible)
					{
						peakek.flipX = true;
						peakek.visible = true;
						peakek.animation.play('kekHappy');
					}
				case 'peafever':
					feverspritesAGAIN.visible = false;
					fever.visible = false;
					tea.visible = false;
					mako.visible = false; 
					feverS.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					demomFever.visible = false;
					NPC.visible = false;
					peakek.animation.play('peaFever');
					if (!peakek.visible)
					{
						peakek.flipX = true;
						peakek.visible = true;
						peakek.animation.play('peaFever');
					}
				case 'peaclown':
					feverspritesAGAIN.visible = false;
					fever.visible = false;
					tea.visible = false;
					mako.visible = false; 
					feverS.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					demomFever.visible = false;
					NPC.visible = false;
					peakek.animation.play('peaClown');
					if (!peakek.visible)
					{
						peakek.flipX = true;
						peakek.visible = true;
						peakek.animation.play('peaClown');
					}
				case 'peacorrupt':
					fever.visible = false;
					tea.visible = false;
					mako.visible = false; 
					taki.visible = false;
					wolfie.visible = false;
					feverS.visible = false;
					feverspritesAGAIN.visible = false;
					demomFever.visible = false;
					NPC.visible = false;
					peakek.animation.play('peaCorrupt');
					if (!peakek.visible)
					{
						peakek.flipX = true;
						peakek.visible = true;
						peakek.animation.play('peaCorrupt');
					}
				case 'peahappy':
					feverspritesAGAIN.visible = false;
					fever.visible = false;
					tea.visible = false;
					mako.visible = false; 
					taki.visible = false;
					wolfie.visible = false;
					demomFever.visible = false;
					feverS.visible = false;
					NPC.visible = false;
					peakek.animation.play('peaHappy');
					if (!peakek.visible)
					{
						peakek.flipX = true;
						peakek.visible = true;
						peakek.animation.play('peaHappy');
					}
				case 'feverpointtwo':
					fever.visible = false;
					taki.visible = false;
					wolfie.visible = false;
					tea.visible = false;
					mako.visible = false; 
					demomFever.visible = false;
					feverS.visible = false;
					NPC.visible = false;
					peakek.visible = false;
					feverspritesAGAIN.animation.play('point2');
					if (!feverspritesAGAIN.visible)
					{
						feverspritesAGAIN.visible = true;
						feverspritesAGAIN.animation.play('point2');
					}
				case 'takiSmile':
					fever.visible = false;
					wolfie.visible = false;
					tea.visible = false;
					feverspritesAGAIN.visible = false;
					mako.visible = false; 
					demomFever.visible = false;
					feverS.visible = false;
					NPC.visible = false;
					peakek.visible = false;
					taki.animation.play('takismile');
					if (!taki.visible)
					{
						taki.flipX = true;
						taki.visible = true;
						taki.animation.play('takismile');
					}
				case 'takieyesopen':
					fever.visible = false;
					wolfie.visible = false;
					tea.visible = false;
					feverspritesAGAIN.visible = false;
					mako.visible = false; 
					demomFever.visible = false;
					feverS.visible = false;
					NPC.visible = false;
					peakek.visible = false;
					taki.animation.play('takieyesopen');
					if (!taki.visible)
					{
						taki.flipX = true;
						taki.visible = true;
						taki.animation.play('takieyesopen');
					}
				case 'takibouttakillu':
					fever.visible = false;
					wolfie.visible = false;
					tea.visible = false;
					feverspritesAGAIN.visible = false;
					mako.visible = false; 
					demomFever.visible = false;
					feverS.visible = false;
					NPC.visible = false;
					peakek.visible = false;
					taki.animation.play('takibouttakillu');
					if (!taki.visible)
					{
						taki.flipX = true;
						taki.visible = true;
						taki.animation.play('takibouttakillu');
					}
			}	
		}
		else
		{
			switch(curCharacter.toLowerCase())
			{
				case 'bg':
					bg.visible = true;
					bg.loadGraphic(Paths.image(dialogueList[0]));
					bg.antialiasing = true;
					bg.updateHitbox();
				case 'hidebg':
					bg.visible = false;
				case 'song':
					FlxG.sound.playMusic(Paths.music(dialogueList[0]));
				case 'fuckoff':
					FlxG.sound.music.stop();
				case 'sfx': 
					FlxG.sound.play(Paths.music(dialogueList[0]));
				case 'stfusfx':
					trace('mf are you STUPID HOLY SHIT THIS WOULD NEVER WORK');
				case 'slow':
					swagDialogue.delay = 0.066;
				case 'normal': 
					swagDialogue.delay = 0.04;
			}
			dialogueList.remove(dialogueList[0]);
			startDialogue();				
		}
	}
	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
	}
}
