function start (song)
setHudZoom(2)
showOnlyStrums = true
strumLine1Visible = false
strumLine2Visible = false

end

function update (elapsed)
	if curStep == 0 then
	setHudZoom(1)
end

	if curStep >= 128 and curStep < 130 then
	strumLine2Visible = true
	setCamZoom(0.65)
end
	

	if curStep >= 128 and curStep < 152 then
	local currentBeat = (songPos / 1000)*(bpm/60)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 12 * math.cos((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 12 * math.cos((currentBeat + i*0.25) * math.pi), i)
end
end

	if curStep >= 152 and curStep < 160 then
	local currentBeat = (songPos / 1000)*(bpm/60)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 50 * math.cos((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 50 * math.cos((currentBeat + i*0.25) * math.pi), i)
end
end

	if curStep >= 160 and curStep < 184 then
	local currentBeat = (songPos / 1000)*(bpm/60)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 12 * math.cos((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 12 * math.cos((currentBeat + i*0.25) * math.pi), i)
end
end

	if curStep >= 184 and curStep < 192 then
	local currentBeat = (songPos / 1000)*(bpm/60)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + -50 * math.cos((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + -50 * math.cos((currentBeat + i*0.25) * math.pi), i)
end
end

	if curStep == 192 then
	strumLine1Visible = true
end


	if curStep >= 192 and curStep < 216 then
	local currentBeat = (songPos / 1000)*(bpm/60)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 12 * math.cos((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 12 * math.cos((currentBeat + i*0.25) * math.pi), i)
end
end

	if curStep >= 216 and curStep < 224 then
	local currentBeat = (songPos / 1000)*(bpm/60)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 50 * math.cos((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 50 * math.cos((currentBeat + i*0.25) * math.pi), i)
end
end

	if curStep >= 224 and curStep < 248 then
	local currentBeat = (songPos / 1000)*(bpm/60)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 12 * math.cos((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 12 * math.cos((currentBeat + i*0.25) * math.pi), i)
end
end

	if curStep >= 248 and curStep < 256 then
	local currentBeat = (songPos / 1000)*(bpm/60)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 50 * math.cos((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 5 * math.cos((currentBeat + i*0.25) * math.pi), i)
end
end


	if curStep == 256 or curStep == 624 or curStep == 888 or curStep == 1776 or curStep == 2048 then
	local currentBeat = (songPos / 1000)*(bpm/120)
		for i=0, 7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.6, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.6, 'setDefault')
end
end


if curStep == 256 then
showOnlyStrums = false
end


if curStep == 322 or curStep == 1346 or curStep == 1858 then
	setCamZoom(0.51)
	setHudZoom(1.01)
	end

if curStep == 326 or curStep == 1350 or curStep == 1862 then
	setCamZoom(0.51)
	setHudZoom(1.01)
	end

if curStep == 330 or curStep == 1354 or curStep == 1866 then
	setCamZoom(0.51)
	setHudZoom(1.01)
	end

if curStep == 334 or curStep == 1358 or curStep == 1870 then
	setCamZoom(0.51)
	setHudZoom(1.01)
	end

if curStep == 338 or curStep == 1362 or curStep == 1874 then
	setCamZoom(0.51)
	setHudZoom(1.01)
	end

if curStep == 342 or curStep == 1366 or curStep == 1878 then
	setCamZoom(0.51)
	setHudZoom(1.01)
	end

if curStep == 346 or curStep == 1370 or curStep == 1882 then
	setCamZoom(0.51)
	setHudZoom(1.01)
	end

if curStep == 350 or curStep == 1374 or curStep == 1886 then
	setCamZoom(0.51)
	setHudZoom(1.01)
	end


if curStep >= 384 and curStep < 512 or curStep >= 640 and curStep < 768 or curStep >= 1408 and curStep < 1536 then
	local currentBeat = (songPos / 1000)*(bpm/60)
		for i=0,7 do
			setActorY(_G['defaultStrum'..i..'Y'] + 10 * math.cos((currentBeat + i*0.25) * math.pi), i)
end
end

if curStep >= 512 and curStep < 624 or curStep >= 768 and curStep < 888 or curStep >= 1536 and curStep < 1664 then
	local currentBeat = (songPos / 1000)*(bpm/60)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 10 * math.cos((currentBeat + i*0.25) * math.pi), i)
end
end

if curStep >= 1664 and curStep < 1728 then
	local currentBeat = (songPos / 1000)*(bpm/60)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 20 * math.cos((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 20 * math.cos((currentBeat + i*0.25) * math.pi), i)
end
end

if curStep >= 1728 and curStep < 1776 then
	local currentBeat = (songPos / 1000)*(bpm/60)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 10 * math.cos((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 10 * math.cos((currentBeat + i*0.25) * math.pi), i)
end
end



if curStep >= 896 and curStep < 1152 or curStep >= 1920 and curStep < 2048 then
	local currentBeat = (songPos / 1000)*(bpm/240)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 25 * math.cos((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 10 * math.cos((currentBeat + i*0.25) * math.pi), i)
end
end


if curStep == 1152 then
	showOnlyStrums = true
	strumLine1Visible = false
	strumLine2Visible = false
end

if curStep == 1920 then
	showOnlyStrums = true
	strumLine2Visible = false
end

if curStep == 2048 then
	strumLine1Visible = false
	showOnlyStrums = false
end

if curStep == 2072 then
	showOnlyStrums = true
end


if curStep == 1280 then
	showOnlyStrums = false
	strumLine1Visible = true
	strumLine2Visible = true
local currentBeat = (songPos / 1000)*(bpm/120)
	for i=0, 7 do
		tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.6, 'setDefault')
		tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.6, 'setDefault')
end
end

if curStep >= 1392 and curStep < 1404 then
	setCamZoom(0.7)
	showOnlyStrums = true
	strumLine1Visible = false
	strumLine2Visible = false
end

if curStep == 1404 then
	showOnlyStrums = false
	strumLine1Visible = true
	strumLine2Visible = true
end
end


function beatHit(beat)
	if curStep >= 256 and curStep < 350 or curStep >= 640 and curStep < 886 or curStep >= 1280 and curStep < 1374 or curStep >= 1792 and curStep < 1886 or curStep >= 1408 and curStep < 1772 then
	setCamZoom(0.51)
	setHudZoom(1.01)
		end

	if curStep >= 384 and curStep < 622 or curStep >= 1024 and curStep < 1150 then
	setCamZoom(0.525)
	setHudZoom(1.025)
		end
		end

function stepHit (step)
	if curStep >= 352 and curStep < 367 or curStep >= 1376 and curStep < 1391 or curStep >= 1888 and curStep < 1903 then
	setCamZoom(0.51)
	setHudZoom(1.01)
		end
		end