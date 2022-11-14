local HudPieces = {'healthBarBG','healthBar','scoreTxt','iconP1','iconP2','timeBar','timeBarBG','timeTxt'}
local index = 1
function onCreatePost()
	makeLuaSprite('UpperBar', 'empty', -110, -350)
	makeGraphic('UpperBar', 1500, 350, '000000')
	setObjectCamera('UpperBar', 'HUD')
	addLuaSprite('UpperBar', false)

	makeLuaSprite('LowerBar', 'empty', -110, 720)
	makeGraphic('LowerBar', 1500, 350, '000000')
	setObjectCamera('LowerBar', 'HUD')
	addLuaSprite('LowerBar', false)

	UpperBar = getProperty('UpperBar.y')
	LowerBar = getProperty('LowerBar.y')
end


function onEvent(name, value1, value2)
	if name == 'Black Bars' then
	
	Speed = tonumber(value1)
	Distance = tonumber(value2)	
	end
	if Speed and Distance > 0 then	
	doTweenY('Cinematics1', 'UpperBar', UpperBar + Distance, Speed, 'QuadOut')
	doTweenY('Cinematics2', 'LowerBar', LowerBar - Distance, Speed, 'QuadOut')
		for Alphas = 1,8 do
		doTweenAlpha('Alpha'..Alphas, HudPieces[index], 0, Speed - 0.1)
		index = index + 1				
			if index > #HudPieces then
			index = 1			
			end
		end
	end
	if downscroll and Speed and Distance > 0 then	
	doTweenY('Cinematics1', 'UpperBar', UpperBar + Distance, Speed, 'QuadOut')
	doTweenY('Cinematics2', 'LowerBar', LowerBar - Distance, Speed, 'QuadOut')
		for Alphas = 1,8 do
		doTweenAlpha('Alpha'..Alphas, HudPieces[index], 0, Speed - 0.1)
		index = index + 1 				
			if index > #HudPieces then
			index = 1				
			end
		end
	end
	if Distance <= 0 then		
	doTweenY('Cinematics1', 'UpperBar', UpperBar, Speed, 'QuadIn')
	doTweenY('Cinematics2', 'LowerBar', LowerBar, Speed, 'QuadIn')
		for Alphas = 1,8 do
		doTweenAlpha('Alpha'..Alphas, HudPieces[index], 1, Speed + 0.1)
		index = index + 1		
			if index > #HudPieces then
			index = 1				
			end
		end		
	end	
end

