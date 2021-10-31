function start (song)
resizeWindow(getScreenWidth(), getScreenHeight())
setWindowPos(0, 0)
setHudZoom(2)
showOnlyStrums = true
strumLine1Visible = false
strumLine2Visible = false

end

function update (elapsed)
if curStep == 0 then
setHudZoom(1)

end

if curStep >= 1536 and curStep < 1792 then
local currentBeat = (songPos / 1000)*(bpm/60)
for i=0,7 do
	setActorX(_G['defaultStrum'..i..'X'] + 10 * math.sin((currentBeat + i*50) * math.pi), i)
	setActorY(_G['defaultStrum'..i..'Y'] + 10 * math.cos((currentBeat + i*0.25) * math.pi), i)
end
end

if curStep == 128 then
showOnlyStrums = false
strumLine1Visible = true
strumLine2Visible = true
end

if curStep >= 1216 and curStep < 1280 then
local currentBeat = (songPos / 1000)*(bpm/120)
setWindowPos(128 * math.sin(currentBeat * math.pi) + 0, 5 * math.sin(currentBeat * 5) + 0)
for i=0,7 do
	setActorX(_G['defaultStrum'..i..'X'] + 25 * math.sin((currentBeat + i*50) * math.pi), i)
	setActorY(_G['defaultStrum'..i..'Y'] + 2 * math.cos((currentBeat + i*0.25) * math.pi), i)
end
end

if curStep == 1280 then
resizeWindow(getScreenWidth(), getScreenHeight())
setWindowPos(0, 0)

end

if curStep == 1792 then
resizeWindow(getScreenWidth(), getScreenHeight())
setWindowPos(0, 0)

end

if curStep == 2237 then
resizeWindow(getScreenWidth() - 300, getScreenHeight() - 170)
setWindowPos(150, 90)

end


if curStep >= 1536 and curStep < 1560 then
local currentBeat = (songPos / 1000)*(bpm/60)
setWindowPos(64 * math.sin(currentBeat * math.pi) + 0, 5 * math.sin(currentBeat * 5) + 0)
end

if curStep >= 1568 and curStep < 1600 then
local currentBeat = (songPos / 1000)*(bpm/60)
setWindowPos(64 * math.sin(currentBeat * math.pi) + 0, 5 * math.sin(currentBeat * 5) + 0)
end

if curStep >= 1600 and curStep < 1628 then
local currentBeat = (songPos / 1000)*(bpm/120)
setWindowPos(128 * math.sin(currentBeat * math.pi) + 0, 5 * math.sin(currentBeat * 5) + 0)
end

if curStep >= 1632 and curStep < 1664 then
local currentBeat = (songPos / 1000)*(bpm/120)
setWindowPos(128 * math.sin(currentBeat * math.pi) + 0, 5 * math.sin(currentBeat * 5) + 0)
end

if curStep >= 1664 and curStep < 1692 then
local currentBeat = (songPos / 1000)*(bpm/60)
setWindowPos(64 * math.sin(currentBeat * math.pi) + 0, 5 * math.sin(currentBeat * 5) + 0)
end

if curStep >= 1696 and curStep < 1756 then
local currentBeat = (songPos / 1000)*(bpm/60)
setWindowPos(64 * math.sin(currentBeat * math.pi) + 0, 5 * math.sin(currentBeat * 5) + 0)
end

if curStep >= 1760 and curStep < 1792 then
local currentBeat = (songPos / 1000)*(bpm/60)
setWindowPos(64 * math.sin(currentBeat * math.pi) + 0, 5 * math.sin(currentBeat * 5) + 0)
end

if curStep == 64 then
setCamZoom(1.1)
camFollow.y = boyfriend.getMidpoint().y - 0;
camFollow.x = boyfriend.getMidpoint().x - 0;

end

if curStep == 84 then
setCamZoom(1.2)
camFollow.y = boyfriend.getMidpoint().y - 0;
camFollow.x = boyfriend.getMidpoint().x - 0;

end

if curStep == 1792 then
local currentBeat = (songPos / 1000)*(bpm/120)
	for i=0, 7 do
	tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.6, 'setDefault')
	tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.6, 'setDefault')
end
end

if curStep == 96 then
setCamZoom(1.3)
camFollow.y = boyfriend.getMidpoint().y - 0;
camFollow.x = boyfriend.getMidpoint().x - 0;

end

if curStep == 116 then
setCamZoom(1.4)
camFollow.y = boyfriend.getMidpoint().y - 0;
camFollow.x = boyfriend.getMidpoint().x - 0;

end
camFollow.y = boyfriend.getMidpoint().y - 400;
camFollow.x = boyfriend.getMidpoint().x - 600;
end


function beatHit(beat) -- do nothing

end

function stepHit (step) -- do nothing

end