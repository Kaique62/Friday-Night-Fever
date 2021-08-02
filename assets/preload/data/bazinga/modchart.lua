function start (song)
setCamZoom(1)
setHudZoom(2)
showOnlyStrums = true
strumLine1Visible = false
strumLine2Visible = false

end

function update (elapsed)
	if curStep == 0 then
	setHudZoom(1)

	end

	if curStep >= 129 and curStep < 375 then
	strumLine1Visible = true
	strumLine2Visible = true
	showOnlyStrums = false
		local currentBeat = (songPos / 1000)*(bpm/120)
		for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] + 25 * math.sin((currentBeat + i*50) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 5 * math.cos((currentBeat + i*0.25) * math.pi), i)
		end
		end
		
	if curStep >= 384 and curStep < 448 then
		strumLine2Visible = false
	local currentBeat = (songPos / 1000)*(bpm/120)
		for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] + 5 * math.sin((currentBeat + i*50) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 25 * math.cos((currentBeat + i*0.25) * math.pi), i)
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.6, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.6, 'setDefault')
		end
		end

	if curStep >= 448 and curStep < 456 then
		strumLine1Visible = true
		strumLine2Visible = true
	end

	if curStep >= 456 and curStep < 504 then
		strumLine1Visible = false
	local currentBeat = (songPos / 1000)*(bpm/120)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 5 * math.sin((currentBeat + i*50) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 25 * math.cos((currentBeat + i*0.25) * math.pi), i)
		end
		end

	if curStep >= 504 and curStep < 512 then
		setCamZoom(1)
	local currentBeat = (songPos / 1000)*(bpm/120)
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.6, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.6, 'setDefault')
		end
		end

	if curStep >= 512 and curStep < 768 then
			strumLine1Visible = true
			showOnlyStrums = true
	local currentBeat = (songPos / 1000)*(bpm/240)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 25 * math.sin((currentBeat + i*50) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 2 * math.cos((currentBeat + i*0.25) * math.pi), i)
		end
		end

	if curStep >= 768 and curStep < 1024 then
			showOnlyStrums = false
	local currentBeat = (songPos / 1000)*(bpm/120)
		for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] + 25 * math.sin((currentBeat + i*50) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 5 * math.cos((currentBeat + i*0.25) * math.pi), i)
		end
		end

	if curStep >= 1024 and curStep < 1088 then
			strumLine1Visible = true
	local currentBeat = (songPos / 1000)*(bpm/120)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 25 * math.sin((currentBeat + i*50) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 2 * math.cos((currentBeat + i*0.25) * math.pi), i)
		end
		end

	if curStep >= 1088 and curStep < 1120 then
			strumLine1Visible = true
	local currentBeat = (songPos / 1000)*(bpm/60)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 25 * math.sin((currentBeat + i*50) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 2 * math.cos((currentBeat + i*0.25) * math.pi), i)
		end
		end

	if curStep >= 1088 and curStep < 1120 then
	local currentBeat = (songPos / 1000)*(bpm/60)
		for i=0,7 do
		tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.6, 'setDefault')
		tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.6, 'setDefault')

		end
		end

	if curStep >= 1152 and curStep < 1408 then
			showOnlyStrums = true
		local currentBeat = (songPos / 1000)*(bpm/240)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 25 * math.sin((currentBeat + i*50) * math.pi), i)
		end
		end

	if curStep == 1408 then
		showOnlyStrums = false
		setCamZoom(0.65)
		
		end

	if curStep == 1472 then
		strumLine1Visible = false
		showOnlyStrums = true
		setCamZoom(0.65)

		end

	if curStep >= 1536 and curStep < 1598 then
			showOnlyStrums = false
			strumLine1Visible = true	
	local currentBeat = (songPos / 1000)*(bpm/120)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 25 * math.sin((currentBeat + i*50) * math.pi), i)
		end
		end

	if curStep >= 1598 and curStep < 1632 then
	local currentBeat = (songPos / 1000)*(bpm/60)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 25 * math.sin((currentBeat + i*50) * math.pi), i)
		end
		end

	if curStep >= 1664 and curStep < 1920 then
			showOnlyStrums = true
	local currentBeat = (songPos / 1000)*(bpm/240)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 25 * math.sin((currentBeat + i*50) * math.pi), i)
		end
		end

	if curStep == 1921 then
	setCamZoom(0.65)

		end

	if curStep >= 2014 and curStep < 2044 then
	setCamZoom(1)

		end

	if curStep >= 1920 then
		strumLine1Visible = false
		strumLine2Visible = false
		showOnlyStrums = false

		end

	if curStep >= 1984 then
		showOnlyStrums = true

		end
		end

function beatHit(beat)
if curStep >= 512 and curStep < 756 or curStep >= 1152 and curStep < 1408 or curStep >= 1664 and curStep < 1920 then
setCamZoom(0.62)

end
end

function stepHit (step) -- do nothing

end