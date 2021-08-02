function start (song)
setCamZoom(1.2)
setHudZoom(2)
showOnlyStrums = true
strumLine1Visible = false
strumLine2Visible = false

end

function update (elapsed)
	if curStep >= 0 and curStep < 64 then
	setCamZoom(1.2)
	setHudZoom(1)

	end

	if curStep == 64 then
	setCamZoom(1)

	end

	if curStep >= 128 and curStep < 192 then
	setCamZoom(1.1)

	end

	if curStep == 192 then
	setCamZoom(1)

	end

	if curStep >= 256 and curStep < 512 then
	strumLine1Visible = true
	strumLine2Visible = true
	showOnlyStrums = false
	local currentBeat = (songPos / 1000)*(bpm/30)
		for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] + 5 * math.sin((currentBeat + i*50) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 10 * math.cos((currentBeat + i*0.25) * math.pi), i)	
	end
	end

	if curStep >= 512 and curStep < 704 then
	local currentBeat = (songPos / 1000)*(bpm/30)
		for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] + 2 * math.sin((currentBeat + i*50) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 2 * math.cos((currentBeat + i*0.25) * math.pi), i)	
	end
	end

	if curStep >= 768 and curStep < 1024 then
	local currentBeat = (songPos / 1000)*(bpm/30)
		for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] + 5 * math.sin((currentBeat + i*50) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 10 * math.cos((currentBeat + i*0.25) * math.pi), i)	
	end
	end

	if curStep >= 1024 and curStep < 1248 then
	local currentBeat = (songPos / 1000)*(bpm/30)
		for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] + 2 * math.sin((currentBeat + i*50) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 2 * math.cos((currentBeat + i*0.25) * math.pi), i)	
	end
	end

	if curStep >= 1280 and curStep < 1792 then
	local currentBeat = (songPos / 1000)*(bpm/30)
		for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] + 5 * math.sin((currentBeat + i*50) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 10 * math.cos((currentBeat + i*0.25) * math.pi), i)	
	end
	end

	if curStep >= 1792 then
	setCamZoom(1)
	showOnlyStrums = true
	strumLine1Visible = false
	strumLine2Visible = false
	end
	end


function beatHit(beat)
if curStep >= 256 and curStep < 512 or curStep >= 768 and curStep < 1024 or curStep >= 1280 and curStep < 1792 then
setCamZoom(0.95)

end
end

function stepHit (step) -- do nothing

end