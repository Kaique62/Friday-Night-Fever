function start (song)

end

function update (elapsed)
	if curStep >= 0 then
		local currentBeat = (songPos / 1000)*(bpm/60)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 12.5 * math.sin((currentBeat + i*50) * math.pi), i)
		end
		end
		end