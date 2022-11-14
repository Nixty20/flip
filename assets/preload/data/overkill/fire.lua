-- Hud Stuff Gone
function onCreatePost()
	setProperty('scoreTxt.visible', false)
	setProperty("timeTxt.visible", false)
	setProperty("timeBarBG.visible", false)
	setProperty("timeBar.visible", false)
	setProperty("updateTime", false)
	setProperty("healthBar.visible", false)
	setProperty('healthBarBG.visible', false);
	setProperty('iconP1.visible', false);
	setProperty('iconP2.visible', false);
end

function onCreate()
	precacheImage('bomb')
	precacheImage('burn')

	makeLuaSprite('theblack', 'blackstuff', 0, 0);
	setObjectCamera('theblack', 'hud');
	
	scaleObject('theblack', 2.0, 2.0);
	
	addLuaSprite('theblack', true);
	
	setProperty('theblack.alpha', 0);
	setObjectOrder('theblack',1);
end 

function onEvent(name)
	if name == 'Black Stuff' then
		setProperty('theblack.alpha', 80);
		cameraFlash('hud','000000',1,true);
		setProperty("defaultCamZoom",1)
	elseif name == 'Remove Black' then
		setProperty('theblack.alpha', 0);
		cameraFlash('hud','000000',1,true);
		setProperty("defaultCamZoom",0.6)
	end
end