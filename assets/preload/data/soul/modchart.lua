function start (song)

end

function update (elapsed)
	if curStep >= 0 then
		local currentBeat = (songPos / 1000)*(bpm/65)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 12.5 * math.sin((currentBeat + i*50) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 8 * math.cos((currentBeat + i*0.25) * math.pi), i)
		end
		end
		end