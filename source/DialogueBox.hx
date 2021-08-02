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
	var demonFever:FlxSprite;
	var pepperdemon:FlxSprite;
	var yukichi:FlxSprite;
	var mega:FlxSprite;
	var makocorrupt:FlxSprite;
	var hunni:FlxSprite;
	var flippy:FlxSprite;
	var whyFEVER:FlxSprite;
	var impy:FlxSprite;

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
			case 'ur-girl' | 'makomelon' | 'tutorial' | 'metamorphosis' | 'void' | 'bazinga' | 'down-bad' | 'party-crasher' | 'chicken-sandwich' | 'funkin-god' | 'crucify' | 'thriller' | 'legendary' | 'farmed' | 'vip' | 'honey' | 'bunnii' | 'throw-it-back' | 'spice' | 'mild':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('dialogue/textbox');
				box.animation.addByPrefix('normalOpen', 'textbox idle', 24, false);
				box.animation.addByIndices('normal', 'textbox idle', [4], "", 24);

				switch(PlayState.SONG.song.toLowerCase())
				{
					case 'chicken-sandwich':
						FlxG.sound.play(Paths.sound('ANGRY_TEXT_BOX'));
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

		feverspritesAGAIN = new FlxSprite(600, -11);
		feverspritesAGAIN.frames = Paths.getSparrowAtlas('dialogue/FeverPoint2');
		feverspritesAGAIN.animation.addByPrefix('point2', 'FeverPoint2', 24, false);
		feverspritesAGAIN.scrollFactor.set();
		add(feverspritesAGAIN);
		feverspritesAGAIN.visible = false;

		whyFEVER = new FlxSprite(830, -11);
		whyFEVER.frames = Paths.getSparrowAtlas('dialogue/MOREGODDAMNFEVERSPRITES');
		whyFEVER.animation.addByPrefix('defrown', 'demonFrown', 24, false);
		whyFEVER.animation.addByPrefix('deprisoner', 'demonPrisoner', 24, false);
		whyFEVER.animation.addByPrefix('desmile', 'demonSmile', 24, false);
		whyFEVER.scrollFactor.set();
		add(whyFEVER);
		whyFEVER.visible = false;

		peakek = new FlxSprite(0, -21);
		peakek.frames = Paths.getSparrowAtlas('dialogue/peakek sprites');
		peakek.animation.addByPrefix('kekHappy', 'kekHappy', 24, false);
		peakek.animation.addByPrefix('peaClown', 'peaClown', 24, false);
		peakek.animation.addByPrefix('peaCorrupt', 'peaCorrupt', 24, false);
		peakek.animation.addByPrefix('peaFever', 'peaFever', 24, false);
		peakek.animation.addByPrefix('peaHappy', 'peaHappy', 0, false);
		peakek.animation.addByPrefix('keksmile', 'kekOtherSmile', 0, false);
		peakek.animation.addByPrefix('suskek', 'kekSUS', 0, false);
		peakek.animation.addByPrefix('peaew', 'peaEW', 0, false);
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

		impy = new FlxSprite(830, -11);
		impy.frames = Paths.getSparrowAtlas('dialogue/impy');
		impy.animation.addByPrefix('impy', 'impy idle', 24, false);
		impy.scrollFactor.set();
		add(impy);
		impy.visible = false;

		demomFever = new FlxSprite(830, -11);
		demomFever.frames = Paths.getSparrowAtlas('dialogue/demon fever');
		demomFever.animation.addByPrefix('prisoner', 'prisonerfever', 24, false);
		demomFever.scrollFactor.set();
		add(demomFever);
		demomFever.visible = false;

		hunni = new FlxSprite(0, -21);
		hunni.frames = Paths.getSparrowAtlas('dialogue/HunniSprites');
		hunni.animation.addByPrefix('hunnimad', 'HunniMad', 24, false);
		hunni.animation.addByPrefix('hunnismile', 'HunniSmile', 24, false);
		hunni.scrollFactor.set();
		add(hunni);
		hunni.visible = false;
		

		pepperdemon = new FlxSprite(0, -21);
		pepperdemon.frames = Paths.getSparrowAtlas('dialogue/YukichiAndPepperDemonSprites');
		pepperdemon.animation.addByPrefix('pepperdemonsmile', 'PepperDemonSmile', 24, false);
		pepperdemon.animation.addByPrefix('pepperdemonsad', 'PepperDemonSad', 24, false);
		pepperdemon.scrollFactor.set();
		add(pepperdemon);
		pepperdemon.visible = false;

		yukichi = new FlxSprite(0, -21);
		yukichi.frames = Paths.getSparrowAtlas('dialogue/YukichiAndPepperDemonSprites');
		yukichi.animation.addByPrefix('yukichismile', 'yukichiSmile', 24, false);
		yukichi.animation.addByPrefix('yukichinormal', 'yukichiNormal', 24, false);
		yukichi.scrollFactor.set();
		add(yukichi);
		yukichi.visible = false;

		flippy = new FlxSprite(0, -21);
		flippy.frames = Paths.getSparrowAtlas('dialogue/FlippySprites');
		flippy.animation.addByPrefix('flippysmile', 'FlippySmile', 24, false);
		flippy.animation.addByPrefix('flippywhy', 'FlippyWHY', 24, false);
		flippy.scrollFactor.set();
		add(flippy);
		flippy.visible = false;

		makocorrupt = new FlxSprite(767, 66);
		makocorrupt.frames = Paths.getSparrowAtlas('dialogue/MakoCorrupt');
		makocorrupt.animation.addByPrefix('makocorrupt', 'MakoCorrupt', 24, false);
		makocorrupt.scrollFactor.set();
		add(makocorrupt);
		makocorrupt.visible = false;

		mega = new FlxSprite(0, -21);
		mega.frames = Paths.getSparrowAtlas('dialogue/MegaSprites');
		mega.animation.addByPrefix('megasmile', 'megaSmile', 24, false);
		mega.animation.addByPrefix('megaflex', 'megaFlex', 24, false);
		mega.animation.addByPrefix('megamissed', 'megaMISSED', 24, false);
		mega.animation.addByPrefix('megabug', 'megaBug', 24, false);
		mega.animation.addByPrefix('megasurprised', 'megaSurprised', 24, false);
		mega.animation.addByPrefix('megaconfused', 'megaConfused', 24, false);
		mega.animation.addByPrefix('megaballistic', 'megaGoingBALLISTIC', 24, false);
		mega.animation.addByPrefix('megahug', 'megaHug', 24, false);
		mega.animation.addByPrefix('megablushcrazy', 'megaBlushCrazy', 24, false);
		mega.animation.addByPrefix('megainsane', 'megaINSANEEEE', 24, false);
		mega.scrollFactor.set();
		mega.scale.set(1.2, 1.2);
		mega.updateHitbox();
		add(mega);
		mega.visible = false;

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

		demonFever = new FlxSprite(830, -11);
		demonFever.frames = Paths.getSparrowAtlas('dialogue/MOREDemonSprites');
		demonFever.animation.addByPrefix('demonsmile', 'demonSmile', 24, false);
		demonFever.animation.addByPrefix('demonwtf', 'demonWTF', 24, false);
		demonFever.animation.addByPrefix('demonwtftwo', 'demonotherWTF', 24, false);
		demonFever.animation.addByPrefix('demonpoint', 'demonPoint', 24, false);
		demonFever.scrollFactor.set();
		add(demonFever);
		demonFever.visible = false;


		taki = new FlxSprite(0, -21);
		taki.frames = Paths.getSparrowAtlas('dialogue/TakiSprites');
		taki.animation.addByPrefix('takismile', 'TakiSmile', 24, false);
		taki.animation.addByPrefix('takieyesopen', 'TakiEyesOpen', 24, false);
		taki.animation.addByPrefix('takibouttakillu', 'TakiBouttaKillu', 24, false);
		taki.scrollFactor.set();
		add(taki);
		taki.visible = false;

		wolfie = new FlxSprite(0, -21);
		wolfie.frames = Paths.getSparrowAtlas('dialogue/WolfieWeeSprites');
		wolfie.animation.addByPrefix('weenormal', 'weeNormal', 24, false);
		wolfie.animation.addByPrefix('weesmug', 'weeSmug', 24, false);
		wolfie.animation.addByPrefix('weewhat', 'weeWhat', 24, false);
		wolfie.animation.addByPrefix('wolfiehuh', 'WolfieHuh', 24, false);
		wolfie.animation.addByPrefix('wolfiesmile', 'WolfieSmile', 24, false);
		wolfie.animation.addByPrefix('wolfiewee', 'WolfieandWee', 24, false);
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
		main.animation.addByPrefix('idle', 'mainMenu', 0, false);
		main.animation.addByPrefix('over', 'MainGlow', 0, false);
		main.animation.play('idle');
		main.antialiasing = true;
		add(main);

		end = new FlxSprite(679, 660);
		end.frames = Paths.getSparrowAtlas('dialogue/DiaButtons');
		end.animation.addByPrefix('normal', 'Skip', 0, false);
		end.animation.addByPrefix('glow', 'SkipGlow', 0, false);
		end.animation.play('normal');
		end.antialiasing = true;
		add(end);

		portraitMap = [
			'portraitLeft' => portraitLeft,
			'portraitRight' => portraitRight,
			'fever' => fever,
			'feverS' => feverS,
			'feverspritesAGAIN' => feverspritesAGAIN,
			'peakek' => peakek,
			'tea' => tea,
			'mako' => mako,
			'wolfie' => wolfie,
			'taki' => taki,
			'nar' => nar, // might be useless
			'NPC' => NPC,
			'demomFever' => demomFever,
			'demonFever' => demonFever,
			'yukichi' => yukichi,
			'pepperdemon' => pepperdemon,
			'mega' => mega,
			'makocorrupt' => makocorrupt,
			'hunni' => hunni,
			'flippy' => flippy,
			'whyFEVER' => whyFEVER,
			'impy' => impy
		];
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;
	var shake:Bool = false;
	
	var portraitMap:Map<String, FlxSprite> = [];

	override function update(elapsed:Float)
	{
		if (shake)
		{
			FlxG.camera.shake(0.09);
			PlayState.instance.camHUD.shake();(0.09);
		}

		main.animation.play(FlxG.mouse.overlaps(main) ? 'over' : 'idle');
		end.animation.play(FlxG.mouse.overlaps(end) ? 'glow' : 'normal');

		if(FlxG.mouse.justPressed)
		{
			if(FlxG.mouse.overlaps(main))
			{
				FlxG.sound.music.stop();
				FlxG.switchState(new MainMenuState());
			}
			else if(FlxG.mouse.overlaps(end))
			{
				FlxG.sound.music.stop();
				finishThing();
				kill();
			}
		}

		// HARD CODING CUZ IM STUPDI
		if (PlayState.SONG.song.toLowerCase() == 'chicken-sandwich')
			portraitLeft.visible = false;

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
		
		var blockedCharacters:Array<String> = ['bg', 'hidebg', 'song', 'fuckoff', 'sfx', 'stfusfx', 'slow', 'normal', 'shake', 'stopitbro'];
		if(!blockedCharacters.contains(curCharacter))
		{
			swagDialogue.resetText(dialogueList[0]);
			swagDialogue.start(swagDialogue.delay, true);

			switch (curCharacter)
			{
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
				default:
					if(curCharacter.startsWith('fever') || curCharacter.startsWith('cas'))
					{
						swagDialogue.sounds = [FlxG.sound.load(Paths.sound('Fever-Beep'), 0.6)];
						hidePortraits('fever'); // hide every portrait except for fever
						if(!curCharacter.startsWith('cas'))
						{
							var fixAnim:String = StringTools.replace(curCharacter, 'fever', '');
							fixAnim = StringTools.replace(fixAnim, 'jump', '');
							// makes an animation name from splitting something like 'feversmile' into 'smile'

							switch(curCharacter)
							{
								// for the special two sprites
								case 'feversmile':
									hidePortraits('feverS');
									feverS.animation.play(fixAnim);
								case 'feverpointtwo':
									hidePortraits('feverspritesAGAIN');
									feverspritesAGAIN.animation.play('point2');
								default:
									fever.animation.play(fixAnim);

									if(curCharacter.endsWith('jump'))
									{
										FlxTween.tween(fever, {"scale.y": 1.05, y: fever.y - 18}, 0.05, { onComplete: function(twn:FlxTween){
											FlxTween.tween(fever, {"scale.y": 1, y: fever.y + 18}, 0.04, { ease: FlxEase.elasticInOut });
										}});
									}
							}
						}
						else // if its a casual expression
						{
							var char_to_AnimName:Map<String, String> = [
								'casualPoint' => 'casPoint',
								'casualconfuse' => 'casConfused',
								'casualscared' => 'casScared',
								'casualworry' => 'casWorry',
								'casualflirt' => 'casFlirt',
								'casualsilly' => 'casSilly',
								'casualtired' => 'casTired',
								'casualfine' => 'casFine',
								'casualannoyed' => 'casAnnoyed'
							]; // character name -> animation name
							fever.animation.play(char_to_AnimName.get(curCharacter));
						}
					}
					else if(curCharacter.startsWith('tea'))
					{
						swagDialogue.sounds = [FlxG.sound.load(Paths.sound('Tea-Beep'), 0.6)];
						var fixAnim:String = StringTools.replace(curCharacter, 'tea', '');
						fixAnim = StringTools.replace(fixAnim, 'jump', '');
						// gets rid of tea's name so its just the ending animation name
						hidePortraits('tea');

						var char_to_AnimName:Map<String, String> = [
							'teatwo' => 'annoytwo'
						];

						if(char_to_AnimName.exists(curCharacter))
							fixAnim = char_to_AnimName.get(curCharacter);

						tea.animation.play(fixAnim);

						if(curCharacter.endsWith('jump'))
						{
							FlxTween.tween(tea, {"scale.y": 1.05, y: tea.y - 18}, 0.05, { onComplete: function(twn:FlxTween){
								FlxTween.tween(tea, {"scale.y": 1, y: tea.y + 18}, 0.04, { ease: FlxEase.elasticInOut });
							}});
						}
					}
					else if(curCharacter.startsWith('mako') && !curCharacter.endsWith('corrupt'))
					{
						swagDialogue.sounds = [FlxG.sound.load(Paths.sound('Mako-Beep'), 0.6)];
						hidePortraits('mako');
						var fixAnim:String = StringTools.replace(curCharacter, 'mako', '');
						mako.animation.play(fixAnim);
					}
					else if(curCharacter.startsWith('nar'))
					{
						swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
						hidePortraits('nar');
						nar.animation.play('seeme');
					}
					else if(curCharacter == 'prisoner')
					{
						swagDialogue.sounds = [FlxG.sound.load(Paths.sound('Fever-Beep'), 0.6)];
						hidePortraits('demomFever');
						demomFever.animation.play('prisoner');
					}
					else if(curCharacter == 'NPC')
					{
						swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
						hidePortraits('NPC');
						NPC.animation.play('boo');
					}
					else if(curCharacter.startsWith('pea') || StringTools.replace(curCharacter, 'kek', '') != curCharacter)
					{
						swagDialogue.sounds = [FlxG.sound.load(Paths.sound('Peakek-Beep'), 0.6)];
						hidePortraits('peakek');
						peakek.flipX = true;
						if(curCharacter == 'kekhappy')
							peakek.animation.play('kekHappy');
						else
						{
							var char_to_AnimName:Map<String, String> = [
								'keksmile' => 'keksmile',
								'suskek' => 'suskek',
								'peaew' => 'peaew',
								'peafever' => 'peaFever',
								'peaclown' => 'peaClown',
								'peacorrupt' => 'peaCorrupt',
								'peahappy' => 'peaHappy'
			  				];
							peakek.animation.play(char_to_AnimName.get(curCharacter));
						}
					}
					else if(curCharacter.startsWith('taki'))
					{
						swagDialogue.sounds = [FlxG.sound.load(Paths.sound('Taki-Beep'), 0.6)];
						hidePortraits('taki');
						taki.flipX = true;
						taki.animation.play(curCharacter);
					}
					else if(curCharacter.startsWith('wolfie') || curCharacter.startsWith('wee'))
					{
						swagDialogue.sounds = [FlxG.sound.load(Paths.sound('WeenWolfie-Beep'), 0.6)];
							hidePortraits('wolfie');
							wolfie.flipX = true;
							wolfie.animation.play(curCharacter);
					}
					else if(curCharacter.startsWith('yukichi'))
					{
						swagDialogue.sounds = [FlxG.sound.load(Paths.sound('Yukichi-Beep'), 0.6)];
						hidePortraits('yukichi');
						yukichi.flipX = true;
						yukichi.animation.play(curCharacter);
					}
					else if(curCharacter.startsWith('pepperdemon'))
					{
						swagDialogue.sounds = [FlxG.sound.load(Paths.sound('Pepper-Beep'), 0.6)];
						hidePortraits('pepperdemon');
						pepperdemon.flipX = true;
						pepperdemon.animation.play(curCharacter);
					}
					else if(curCharacter.startsWith('demon'))
					{
						swagDialogue.sounds = [FlxG.sound.load(Paths.sound('Fever-Beep'), 0.6)];
						hidePortraits('demonFever');
						demonFever.animation.play(curCharacter);
					}
					else if(curCharacter.startsWith('de'))
					{
						swagDialogue.sounds = [FlxG.sound.load(Paths.sound('Fever-Beep'), 0.6)];
						hidePortraits('whyFEVER');
						whyFEVER.animation.play(curCharacter);
					}
					else if(curCharacter.startsWith('mega'))
					{
						swagDialogue.sounds = [FlxG.sound.load(Paths.sound('Mega-Beep'), 0.6)];
						hidePortraits('mega');
						mega.flipX = true;
						mega.animation.play(curCharacter);
					}
					else if(curCharacter == 'makocorrupt')
					{
						swagDialogue.sounds = [FlxG.sound.load(Paths.sound('Mako-Beep'), 0.6)];
						hidePortraits('makocorrupt');
						makocorrupt.animation.play('makocorrupt');
					}
					else if(curCharacter.startsWith('hunni'))
					{
						swagDialogue.sounds = [FlxG.sound.load(Paths.sound('Hunni-Beep'), 0.6)];
						hidePortraits('hunni');
						hunni.flipX = true;
						hunni.animation.play(curCharacter);
					}
					else if(curCharacter.startsWith('flippy'))
					{
						swagDialogue.sounds = [FlxG.sound.load(Paths.sound('Flippy-Beep'), 0.6)];
						hidePortraits('flippy');
						flippy.flipX = true;
						flippy.animation.play(curCharacter);
					}
					else if(curCharacter.startsWith('impy'))
					{
						swagDialogue.sounds = [FlxG.sound.load(Paths.sound('Impy-Beep'), 0.6)];
						hidePortraits('impy');
						impy.animation.play(curCharacter);
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
					swagDialogue.delay = 0.25;
				case 'normal': 
					swagDialogue.delay = 0.04;
				case 'shake':
					shake = true;
				case 'stopitbro':
					shake = false;
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

	function hidePortraits(curPortrait:String)
	{
		for(key in portraitMap.keys())
			if(key != curPortrait)
				portraitMap[key].visible = false;

		if(portraitMap[curPortrait].visible == false)
			portraitMap[curPortrait].visible = true;
	}
}
