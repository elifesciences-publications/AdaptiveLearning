function al_indicateCondition(taskParam, subject, whichPractice)
%AL_INDICATECONDITION   This function prints the task version at the beginning of the task
%
%   Input
%       taskParam: structure containing task parameters
%       subject: structure containing subject-specific information
%       whichPractice: indicates which practice condition will be run
%
%   Output
%       ~


Screen('TextFont', taskParam.gParam.window.onScreen, 'Arial');
Screen('TextSize', taskParam.gParam.window.onScreen, 30);

if isequal(taskParam.gParam.taskType, 'dresden')
    
    if (isequal(whichPractice, 'mainPractice') && subject.cBal == 1) || (isequal(whichPractice, 'mainPractice') && subject.cBal == 2) || (isequal(whichPractice, 'followOutcomePractice')...
            && subject.cBal == 3) || (isequal(whichPractice, 'followOutcomePractice') && subject.cBal == 5) || (isequal(whichPractice, 'followCannonPractice') && subject.cBal == 4)...
            || (isequal(whichPractice, 'followCannonPractice') && subject.cBal == 6)
        
        txt = 'Herzlich Willkommen\n\nErste Aufgabe...';
        
    elseif (isequal(whichPractice, 'mainPractice') && subject.cBal == 3)|| (isequal(whichPractice, 'mainPractice') && subject.cBal == 4) || (isequal(whichPractice, 'followOutcomePractice')...
            && subject.cBal == 1) || (isequal(whichPractice, 'followOutcomePractice') && subject.cBal == 6) || (isequal(whichPractice, 'followCannonPractice')...
            && subject.cBal == 2 || (isequal(whichPractice, 'followCannonPractice') && subject.cBal == 5))
        
        txt = 'Zweite Aufgabe...';
        
    elseif (isequal(whichPractice, 'mainPractice') && subject.cBal == 5) || (isequal(whichPractice, 'mainPractice') && subject.cBal == 6)...
            || (isequal(whichPractice, 'followOutcomePractice') && subject.cBal == 2) || (isequal(whichPractice, 'followOutcomePractice') && subject.cBal == 4) || (isequal(whichPractice, 'followCannonPractice')...
            && subject.cBal == 1) || (isequal(whichPractice, 'followCannonPractice') && subject.cBal == 3)
        
        txt = 'Dritte Aufgabe...';
    end
else
    if isequal(whichPractice, 'oddballPractice')
        txt = 'Oddball Task';
    elseif isequal(whichPractice, 'mainPractice')
        txt = 'Change Point Task';
    elseif isequal(whichPractice, 'reversal')
        txt = 'Reversal Task';
    elseif isequal(whichPractice, 'chinese')
        if taskParam.gParam.language == 1
            txt = 'Besch�tze Deine Planeten';
        elseif taskParam.gParam.language == 2
            txt = 'Protect your planets!';
        end
    end
end

while 1
    % We used to have a spaceship picture but it takes forever to
    % load it. Therefore currently commented out
    %if ~isequal(whichPractice, 'chinese')
    Screen('FillRect', taskParam.gParam.window.onScreen, []);
    DrawFormattedText(taskParam.gParam.window.onScreen, txt,...
        'center', 100, [0 0 0]);
    Screen('DrawingFinished', taskParam.gParam.window.onScreen);
    t = GetSecs;
    Screen('Flip', taskParam.gParam.window.onScreen, t + 0.1);
    %[~, ~, keyCode] = KbCheck;
    %else
    %YourTaskScreen(taskParam, txt,...
    %   taskParam.textures.spacebattleTxt, screenIndex);
    % end
    [~, ~, keyCode] = KbCheck;
    
    if find(keyCode) == taskParam.keys.enter
        break
    end
end

WaitSecs(0.1);
end