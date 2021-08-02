function start (song)
setCamZoom(1)

end

function update (elapsed)
	if curStep >= 128 and curStep < 256 then
	local currentBeat = (songPos / 1000)*(bpm/30)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 5 * math.sin((currentBeat + i*50) * math.pi), i)
		end
		end

	if curStep >= 640 and curStep < 768 then
	local currentBeat = (songPos / 1000)*(bpm/30)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 5 * math.sin((currentBeat + i*50) * math.pi), i)
		end
		end


	if curStep == 384 then
	setCamZoom(1.1)
setHudZoom(1.1)
		end

	if curStep == 396 then
	setCamZoom(1.1)
setHudZoom(1.1)
		end

	if curStep == 416 then
	setCamZoom(1.1)
setHudZoom(1.1)
		end

	if curStep == 428 then
	setCamZoom(1.1)
setHudZoom(1.1)
		end

	
	if curStep == 448 then
	setCamZoom(1.1)
setHudZoom(1.1)
		end

	if curStep == 460 then
	setCamZoom(1.1)
setHudZoom(1.1)
		end

	if curStep == 480 then
	setCamZoom(1.1)
setHudZoom(1.1)
		end

	if curStep == 492 then
	setCamZoom(1.1)
setHudZoom(1.1)
		end


	if curStep == 896 then
	setCamZoom(1.1)
setHudZoom(1.1)
		end

	if curStep == 908 then
	setCamZoom(1.1)
setHudZoom(1.1)
		end

	if curStep == 928 then
	setCamZoom(1.1)
setHudZoom(1.1)
		end

	if curStep == 940 then
	setCamZoom(1.1)
setHudZoom(1.1)
		end


	if curStep == 960 then
	setCamZoom(1.1)
setHudZoom(1.1)
		end

	if curStep == 972 then
	setCamZoom(1.1)
setHudZoom(1.1)
		end

	if curStep == 992 then
	setCamZoom(1.1)
setHudZoom(1.1)
		end

	if curStep == 1004 then
	setCamZoom(1.1)
setHudZoom(1.1)
		end

	
	if curStep == 1408 then
	setCamZoom(1.1)
setHudZoom(1.1)
		end

	if curStep == 1420 then
	setCamZoom(1.1)
setHudZoom(1.1)
		end

	if curStep == 1440 then
	setCamZoom(1.1)
setHudZoom(1.1)
		end

	if curStep == 1452 then
	setCamZoom(1.1)
setHudZoom(1.1)
		end


	if curStep == 1472 then
	setCamZoom(1.1)
setHudZoom(1.1) 
		end

	if curStep == 1484 then
	setCamZoom(1.1)
setHudZoom(1.1)
		end

	if curStep == 1504 then
	setCamZoom(1.1)
setHudZoom(1.1)
		end

	if curStep == 1516 then
	setCamZoom(1.1)
setHudZoom(1.1)
		end
		end


function beatHit(beat) -- do nothing

end

function stepHit (step) -- do nothing

end