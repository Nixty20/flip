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
	makeLuaSprite('sky', 'fallen-soldier/phase3/sky', -700, -160)
	setLuaSpriteScrollFactor('sky', 0.8, 0.8)
	setProperty('sky.antialiasing', true)
	addLuaSprite('sky', false)

	if not lowQuality then
		makeLuaSprite('backtrees', 'fallen-soldier/phase3/more tree', -640, -180)
		setLuaSpriteScrollFactor('backtrees', 0.8, 0.8)
		setProperty('backtrees.antialiasing', true)
		addLuaSprite('backtrees', false)

		makeLuaSprite('trees', 'fallen-soldier/phase3/treee', -620, -230)
		setLuaSpriteScrollFactor('trees', 0.8, 0.8)
		setProperty('trees.antialiasing', true)
		addLuaSprite('trees', false)

		makeAnimatedLuaSprite('burn', 'fallen-soldier/phase3/Fire', -600, -200)
		addAnimationByPrefix('burn', 'idle', 'fire', 23, true)
		addLuaSprite('burn', false)
	end

	makeLuaSprite('ground', 'fallen-soldier/phase3/ground', -695, -150)
	setProperty('ground.antialiasing', true)
	addLuaSprite('ground', false)

	if not lowQuality then
		makeAnimatedLuaSprite('fire', 'fallen-soldier/Fire', 500, 350)
		addAnimationByPrefix('fire', 'idle', 'fire idle', 24, true)
		addLuaSprite('fire', false)
	end

	makeAnimatedLuaSprite('boombox', 'fallen-soldier/Speaker', 930, 510)
	addAnimationByPrefix('boombox', 'idle', 'boombox', 24, true)
	addLuaSprite('boombox', false)

	if not lowQuality then
		makeAnimatedLuaSprite('flaky', 'fallen-soldier/Scared_Flaky', 1390, 530)
		addAnimationByPrefix('flaky', 'idle', 'Flaky Scared', 24, true)
		addLuaSprite('flaky', false)

		makeAnimatedLuaSprite('boombox2', 'fallen-soldier/Speaker2', 930, 510)
		addAnimationByPrefix('boombox2', 'idle', 'boombox', 24, true)
		addLuaSprite('boombox2', false)

		makeLuaSprite('table', 'fallen-soldier/phase3/table', -900, -330)
		scaleObject('table', 1.1, 1.1)
		setProperty('table.antialiasing', true)
		addLuaSprite('table', true)
	end

	makeLuaSprite('theblack', 'blackstuff', 0, 0);
	setObjectCamera('theblack', 'hud');
	
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