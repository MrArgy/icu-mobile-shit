active = false
function onEvent(n,v1,v2)
    if n == "Darkness" then
        if not active then
            makeLuaSprite('darkness', '', 0, 0)
            makeGraphic('darkness', 3000, 1000, 'FFFFFF')
            setObjectCamera('darkness', 'other')
            screenCenter('darkness')
            setBlendMode('darkness', 'subtract')
            setProperty('darkness.alpha', 0)
            addLuaSprite('darkness')
            doTweenAlpha('darkness1', 'darkness', 0.08, 1, 'sineInOut')
        else
            cancelTween('darkness1')
            cancelTween('darkness2')
            doTweenAlpha('darknessBye', 'darkness', 0, 1, 'sineInOut')
        end
        active = not active
    end
end

function onTweenCompleted(tag)
    if tag == 'darkness1' then
        doTweenAlpha('darkness2', 'darkness', 0.1, 1, 'sineInOut')
    elseif tag == 'darkness2' then
        doTweenAlpha('darkness1', 'darkness', 0.05, 1, 'sineInOut')
    elseif tag == 'darknessBye' then
        removeLuaSprite('darkness')
    end
end