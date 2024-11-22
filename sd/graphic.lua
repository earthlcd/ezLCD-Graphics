----------------------------------------------------------------------
-- ezLCD Graphics Test
--
-- Created  06/26/2023  -  Jacob Christ
----------------------------------------------------------------------



-- Wait 10 seconds for USB to enumerate
-- ez.Wait_ms(10000)

-- Main

ez.BoxFill(0, 0, 319 , 479, ez.RGB(0, 0, 0)) -- X1, Y1, X2, Y2, Color
ez.Wait_ms(1000)
ez.BoxFill(0, 0, 319 , 479, ez.RGB(255, 0, 0)) -- X1, Y1, X2, Y2, Color
ez.Wait_ms(1000)
ez.BoxFill(50, 50, 270 , 429, ez.RGB(0, 255, 0)) -- X1, Y1, X2, Y2, Color
ez.Wait_ms(1000)
ez.BoxFill(100, 100, 219 , 379, ez.RGB(0, 0, 255)) -- X1, Y1, X2, Y2, Color
ez.Wait_ms(1000)

ez.BoxFill(0, 0, 319 , 479, ez.RGB(0, 0, 0)) -- X1, Y1, X2, Y2, Color
ez.Wait_ms(1000)
ez.BoxFill(0, 0, 319 , 479, ez.RGB(255, 0, 0)) -- X1, Y1, X2, Y2, Color
ez.Wait_ms(1000)
ez.BoxFill(50, 50, 270 , 429, ez.RGB(0, 255, 0)) -- X1, Y1, X2, Y2, Color
ez.Wait_ms(1000)
ez.BoxFill(100, 100, 219 , 379, ez.RGB(0, 0, 255)) -- X1, Y1, X2, Y2, Color
ez.Wait_ms(1000)

local w = 50 --math.random(10,50)
local h = w
local times = 200
while times > 0 do
	local x = math.random(0,319 - w)
	local y = math.random(0,479 - w)

	ez.BoxFill(x, y, x+w , y+h, ez.RGB(math.random(0,255), math.random(0,255), math.random(0,255))) -- X1, Y1, X2, Y2, Color
	--ez.Wait_ms(50)
	w = w + 1 --math.random(50,250)
	h = h + 2 --math.random(50,250)
	if w > 319 then
		w = 50
	end
	if h > 479 then
		h = 50
	end
	times = times -1
end
ez.PutPictFile(0,0, "Images/bwimage320.bmp")
ez.PutPictFile(0,240, "Images/EarthLCD_320x240_Splash.bmp")
ez.Wait_ms(5000)

