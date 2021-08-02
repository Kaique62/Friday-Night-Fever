function start (song)
setCamZoom(0.8)
setHudZoom(2)
showOnlyStrums = true
strumLine1Visible = false
strumLine2Visible = false

end

function update (elapsed)
	if curStep >= 0 and curStep < 128 then
	setCamZoom(0.8)
	setHudZoom(1)

	end

	if curStep == 124 then
	strumLine1Visible = true
	
	end

	if curStep == 128 then
	strumLine1Visible = true
	strumLine2Visible = true
	showOnlyStrums = false

	end


	if curStep >= 418 and curStep < 420 then
	setCamZoom(0.8)
	end

	if curStep == 420 then
	setCamZoom(0.9)
	end

	if curStep >= 426 and curStep < 428 then
	setCamZoom(0.8)
	end

	if curStep == 428 then
	setCamZoom(0.9)
	end


	if curStep >= 498 and curStep < 500 then
	setCamZoom(0.8)
	end

	if curStep == 500 then
	setCamZoom(0.9)
	end

	if curStep >= 506 and curStep < 508 then
	setCamZoom(0.8)
	end

	if curStep == 508 then
	setCamZoom(0.9)
	end

	if curStep == 682 then
	setCamZoom(0.9)
	end


	if curStep >= 700 and curStep < 701 then
	setCamZoom(0.8)
	end

	if curStep >= 701 and curStep < 702 then
	setCamZoom(0.9)
	end
	
	if curStep >= 702 and curStep < 703 then
	setCamZoom(1)
	end

	if curStep == 703 then
	setCamZoom(1.1)
	end


	if curStep >= 868 and curStep < 870 then
	setCamZoom(0.8)
	end

	if curStep == 870 then
	setCamZoom(0.9)
	end

	if curStep >= 876 and curStep < 878 then
	setCamZoom(0.8)
	end

	if curStep == 878 then
	setCamZoom(0.9)
	end

	if curStep >= 884 and curStep < 886 then
	setCamZoom(0.8)
	end

	if curStep == 886 then
	setCamZoom(0.9)
	end


	if curStep >= 912 and curStep < 928 then
	setCamZoom(0.7)
	end

	if curStep >= 928 and curStep < 944 then
	setCamZoom(0.75)
	end

	if curStep >= 944 and curStep < 960 then
	setCamZoom(0.8)
	end

	if curStep >= 960 and curStep < 976 then
	setCamZoom(0.85)
	end

	if curStep >= 976 and curStep < 992 then
	setCamZoom(0.9)
	end

	if curStep >= 992 and curStep < 1008 then
	setCamZoom(0.95)
	end

	if curStep >= 1008 and curStep < 1020 then
	setCamZoom(1)
	end



	if curStep >= 1040 and curStep < 1056 then
	setCamZoom(0.7)
	end

	if curStep >= 1056 and curStep < 1072 then
	setCamZoom(0.75)
	end

	if curStep >= 1072 and curStep < 1088 then
	setCamZoom(0.8)
	end

	if curStep >= 1088 and curStep < 1104 then
	setCamZoom(0.85)
	end

	if curStep >= 1104 and curStep < 1120 then
	setCamZoom(0.9)
	end

	if curStep >= 1120 and curStep < 1136 then
	setCamZoom(0.95)
	end

	if curStep >= 1136 and curStep < 1148 then
	setCamZoom(1)
	end
	end


function beatHit(beat) -- do nothing

end

function stepHit (step) -- do nothing

end