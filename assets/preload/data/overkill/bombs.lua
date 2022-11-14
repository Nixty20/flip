function onCreate()
Dodged = false;
    canDodge = false;
    
makeAnimatedLuaSprite('s', 'space', 0, 588);
        addAnimationByPrefix('s', 's', 's', 24, false);
	addAnimationByPrefix('s', 'sPress', 'sPressed', 24, false);
	addLuaSprite('s', true);
	setObjectCamera('s', 'other')
	
	makeLuaSprite('warning','warning',0,500)
	addLuaSprite('warning',true)
	scaleObject('warning',0.6665,0.6665)
	setScrollFactor('warning',0,0)
	setObjectCamera('warning','hud')
	
	doTweenY('showup','warning', 150, 5, 'cubeOut')
	
	function onTweenCompleted(name)
		if name == 'showup' then
			doTweenAlpha('bye','warning',0,2,'cubeOut')
		elseif name == 'bye' then
			removeLuaSprite('warning',true)
		end
	end
end

function onEvent(name)
	if name == "Bomb" then
		--setting
		removeLuaSprite('bomb',true);
		cancelTimer('bomb');
		playSound('beep',1,'beep');
		makeAnimatedLuaSprite('bomb','bomb',getRandomInt(50,1000),getRandomInt(50,300));
		scaleObject('bomb',4.0,4.0);
		addLuaSprite('bomb',true);
		setObjectCamera('bomb','hud');
		addAnimationByPrefix('bomb','appear','bomb anim',24,false);
		objectPlayAnimation('bomb','bomb',false);
		setObjectOrder('bomb',2);

		--actually use the bomb
		runTimer('bomb',2);
			function onTimerCompleted(name)
				if name == 'bomb' then
					setProperty('health', getProperty('health') - 0.8);
					canDodge = true;
					removeLuaSprite('bomb',true);
					cameraFlash('hud','FF6600',1,true);
					playSound('boom',1,'boom');
				end
			end
	elseif name == "Burn" then
		makeAnimatedLuaSprite('bomburn','burn',getRandomInt(50,1000),-415);
		setObjectCamera('bomburn','hud');
		addAnimationByPrefix('bomburn','fall','burnfall',24,false);
		setObjectOrder('bomburn',3);
		addLuaSprite('bomburn',true);
		objectPlayAnimation('bomburn','fall',false);
		scaleObject('bomburn',3.5,3.5);
		playSound('fall',1,'fall');
		
		runTimer('fall',1);
			function onTimerCompleted(name)
				if name == 'fall' then
					playSound('boom',1,'boom');
					cameraFlash('hud','FF0000',2,true);
					removeLuaSprite('bomburn',true);
					setProperty('health', getProperty('health') - 0.4);
			end
		end
	end
end

function onUpdate()
	if (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 132) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left'))  then
      objectPlayAnimation('s','sPress',false);
      Dodged = true
      canDodge = false
		removeLuaSprite('bomb',true);
		cancelTimer('bomb');
		stopSound('beep');
		playSound('disarmed',1,'disarmed');
		cameraFlash('hud','FFFFFF',0.2,true);
	end
end