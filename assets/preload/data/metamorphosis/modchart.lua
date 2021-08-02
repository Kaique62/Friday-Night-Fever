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
	
	if curStep >= 124 and curStep < 128 then
	setCamZoom(2)

	end

	if curStep == 128 then
	showOnlyStrums = false
	strumLine1Visible = true
	strumLine2Visible = true

	end

	if curStep >= 1020 then
	setCamZoom(2)

	end
	end

function beatHit(beat) -- do nothing

end

function stepHit (step) -- do nothing

end