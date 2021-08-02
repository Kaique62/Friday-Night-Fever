function start (song)
showOnlyStrums = true
setHudZoom(2)

end

function update (elapsed)
if curStep >= 0 and curStep < 1 then
setHudZoom(1)

end

if curStep >= 0 and curStep < 15 then
local currentBeat = (songPos / 1000)*(bpm/60)
	for i=0, 7 do
	setActorX(_G['defaultStrum'..i..'X'] + 35 * math.sin((currentBeat + i*0.25) * math.pi), i)
	setActorY(defaultStrum0Y + 25 * math.cos((currentBeat + i*25) * math.pi), i)
end
end

if curStep >= 15 and curStep < 19 then
local currentBeat = (songPos / 1000)*(bpm/30)
	for i=0, 7 do
	setActorX(_G['defaultStrum'..i..'X'] + 50 * math.sin((currentBeat + i*0.25) * math.pi), i)
end
end

if curStep >= 19 and curStep < 32 then
local currentBeat = (songPos / 1000)*(bpm/120)
	for i=0, 7 do
	setActorY(defaultStrum0Y + 50 * math.cos((currentBeat + i*25) * math.pi), i)
end
end

if curStep >= 32 and curStep < 45 then
local currentBeat = (songPos / 1000)*(bpm/60)
	for i=0, 7 do
	setActorX(_G['defaultStrum'..i..'X'] + 35 * math.sin((currentBeat + i*0.25) * math.pi), i)
	setActorY(defaultStrum0Y + 25 * math.cos((currentBeat + i*25) * math.pi), i)
end
end

if curStep >= 45 and curStep < 50 then
local currentBeat = (songPos / 1000)*(bpm/30)
	for i=0, 7 do
	setActorX(_G['defaultStrum'..i..'X'] + 50 * math.sin((currentBeat + i*0.25) * math.pi), i)
end
end

if curStep >= 50 and curStep < 55 then
local currentBeat = (songPos / 1000)*(bpm/60)
	for i=0, 7 do
	setActorY(defaultStrum0Y + 50 * math.cos((currentBeat + i*25) * math.pi), i)
end
end

if curStep >= 55 and curStep < 58 then
local currentBeat = (songPos / 1000)*(bpm/30)
	for i=0, 7 do
	setActorX(_G['defaultStrum'..i..'X'] + 50 * math.sin((currentBeat + i*0.25) * math.pi), i)
end
end

if curStep >= 58 and curStep < 62 then
local currentBeat = (songPos / 1000)*(bpm/60)
	for i=0, 7 do
	setActorY(defaultStrum0Y + 50 * math.cos((currentBeat + i*25) * math.pi), i)
	tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.6, 'setDefault')
	tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.6, 'setDefault')
end
end



if curStep >= 62 and curStep < 80 then
local currentBeat = (songPos / 1000)*(bpm/60)
	for i=0, 7 do
	setActorX(_G['defaultStrum'..i..'X'] + 35 * math.sin((currentBeat + i*0.25) * math.pi), i)
	setActorY(defaultStrum0Y + 25 * math.cos((currentBeat + i*25) * math.pi), i)
end
end

if curStep >= 80 and curStep < 85 then
local currentBeat = (songPos / 1000)*(bpm/30)
	for i=0, 7 do
	setActorX(_G['defaultStrum'..i..'X'] + 50 * math.sin((currentBeat + i*0.25) * math.pi), i)
end
end

if curStep >= 85 and curStep < 95 then
local currentBeat = (songPos / 1000)*(bpm/120)
	for i=0, 7 do
	setActorY(defaultStrum0Y + 50 * math.cos((currentBeat + i*25) * math.pi), i)
	tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.6, 'setDefault')
	tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.6, 'setDefault')
end
end

if curStep >= 95 and curStep < 110 then
local currentBeat = (songPos / 1000)*(bpm/60)
	for i=0, 7 do
	setActorX(_G['defaultStrum'..i..'X'] + 35 * math.sin((currentBeat + i*0.25) * math.pi), i)
	setActorY(defaultStrum0Y + 25 * math.cos((currentBeat + i*25) * math.pi), i)
end
end

if curStep >= 110 and curStep < 115 then
local currentBeat = (songPos / 1000)*(bpm/30)
	for i=0, 7 do
	setActorX(_G['defaultStrum'..i..'X'] + 50 * math.sin((currentBeat + i*0.25) * math.pi), i)
end
end

if curStep >= 115 and curStep < 118 then
local currentBeat = (songPos / 1000)*(bpm/60)
	for i=0, 7 do
	setActorY(defaultStrum0Y + 50 * math.cos((currentBeat + i*25) * math.pi), i)
end
end

if curStep >= 118 and curStep < 122 then
local currentBeat = (songPos / 1000)*(bpm/30)
	for i=0, 7 do
	setActorX(_G['defaultStrum'..i..'X'] + 50 * math.sin((currentBeat + i*0.25) * math.pi), i)
	tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.6, 'setDefault')
	tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.6, 'setDefault')
end
end

if curStep >= 122 and curStep < 126 then
local currentBeat = (songPos / 1000)*(bpm/60)
	for i=0, 7 do
	setActorY(defaultStrum0Y + 50 * math.cos((currentBeat + i*25) * math.pi), i)
end
end

if curStep >= 126 and curStep < 127 then
showOnlyStrums = false

end
end



function beatHit(beat) -- do nothing

end

function stepHit (step) -- do nothing
   
end
