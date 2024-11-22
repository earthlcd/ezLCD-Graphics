----------------------------------------------------------------------
-- ezLCD Frame Management Test
--
-- Created  11/20/2024  -  Peter Fitzpatrick
-- Updated  11/20/2024  -  Jacob Christ
----------------------------------------------------------------------

-- This program designed to demonstarte how to draw in a frame buffer that
-- is not displayed then swap out the frame buffers so that sreen drawing
-- is not visable to the user of the device.
--
-- I think I found a subtle bug in the firmware that may need to be addressed.  
-- When drawing in the background buffer of frame 1 the top line of the display
-- is actually rendered.  If there is not a lot of change from screen to screen
-- the observer probably will not notice this.  However, this color gradient 
-- test makes is pretty obvious (especially since I added artificial delays to 
-- exaggerate the screen drawing time).
--
-- This example switches back and forth between double buffered draws and direct
-- draws to emphasize the double buffer feature.
--
-- ez.SetDrawFrame(frameNo), sets the display buffer to draw to (0 or 1) 
-- If the draw fram is different than the display frame then drawing
-- is not visable to the user.

-- ez.SetDispFrame(FrameNo, LayerNo), Sets the frame to be displayed as the 
-- specified layer (background or foreground) on the screen
--
-- ez.SetLayerVisibility(layerNo, visible), not used

frameNo = 1
running = true
testNo = 0
DoubleBuffer = true

ez.Cls(ez.RGB(255,255,255))

function RedGradient()
  ez.Cls(ez.RGB(0,0,0))
  x = 0
	for clr = 0,255,1 do	 -- increment color intensity
    ez.SetColor(ez.RGB(clr,0,0))
    ez.SetXY(x,0) 	-- increment (y)screen line position 
    ez.VLine(ez.Height)	-- draw line height of screen
    x = x + 1
    ez.SetXY(x,0) 	-- increment (y)screen line position 
    ez.VLine(ez.Height)	-- draw line height of screen
	x = x + 1
  ez.Wait_ms(1) -- simulate a slow scree redraw
end
  ez.SetXY(0,0) 	-- increment (y)screen line position 
  print("Red Gradient")
end

function GreenGradient()
  ez.Cls(ez.RGB(0,0,0))
  x = 0
	for clr = 0,255,1 do	 -- increment color intensity
    ez.SetColor(ez.RGB(0,clr,0))
    ez.SetXY(x,0) 	-- increment (y)screen line position 
    ez.VLine(ez.Height)	-- draw line height of screen
    x = x + 1
    ez.SetXY(x,0) 	-- increment (y)screen line position 
    ez.VLine(ez.Height)	-- draw line height of screen
    x = x + 1
    ez.Wait_ms(1) -- simulate a slow scree redraw
	end
  ez.SetXY(0,0) 	-- increment (y)screen line position 
  print("Green Gradient")
end

function BlueGradient()
  ez.Cls(ez.RGB(0,0,0))
  x = 0
	for clr = 0,255,1 do	 -- increment color intensity
    ez.SetColor(ez.RGB(0,0,clr))
    ez.SetXY(x,0) 	-- increment (y)screen line position 
    ez.VLine(ez.Height)	-- draw line height of screen
    x = x + 1
    ez.SetXY(x,0) 	-- increment (y)screen line position 
    ez.VLine(ez.Height)	-- draw line height of screen
    x = x + 1
    ez.Wait_ms(1) -- simulate a slow scree redraw
	end
  ez.SetXY(0,0) 	-- increment (y)screen line position 
  print("Blue Gradient")
end

while (running) do

  -- Set the draw frame
  if DoubleBuffer then ez.SetDrawFrame(frameNo) end

  -- Draw something in the background
  if testNo == 0 then
		ez.Cls(ez.RGB(255,0,255))
    print("Purple Screen")
	elseif testNo == 1 then
		RedGradient()
	elseif testNo == 2 then
		GreenGradient()
	elseif testNo == 3 then
		BlueGradient()
	end

  -- Set the display frame to the the frame we just drew on
  if DoubleBuffer then  
    print("Double Buffering On")
    ez.SetDispFrame(frameNo, 1)
  else
    print("Double Buffering Off")
  end

  -- Switch frameNo to something diffrent than is currently being displayed
  if frameNo == 1 then
		frameNo = 0
  else
    frameNo = 1
  end

  -- If we have just displayed the last screen reset our testNo to zero.
  if testNo >= 3 then
    testNo = 0
    DoubleBuffer = not DoubleBuffer
  else
    testNo = testNo + 1
  end

  -- Pause for one second (1000 milliseconds)
  ez.Wait_ms(1000)
end