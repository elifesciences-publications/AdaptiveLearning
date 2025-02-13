function screenIndex = introduceCannon(screenIndex, taskParam, distMean, cannon)
%INTRODUCECANNON   This function introduces the cannon to participant
%
%   Input
%       screenIndex: indicates current sceen of instruction phase
%       taskParam: structure containing task parameters
%       cannon: logical that indicates if cannon should be shown during instruction
%
%   Output
%       screenIndex: updated screenIndex 


    WaitSecs(0.1);
    if isequal(taskParam.gParam.taskType, 'dresden')
        if isequal(whichPractice, 'mainPractice') || isequal(whichPractice, 'followCannonPractice')
            if isequal(subject.group, '1')
                txt = ['Eine Kanone zielt auf eine Stelle des Kreises. Deine Aufgabe ist es, die Kanonenkugel mit einem Schild abzuwehren. Mit dem orangenen Punkt kannst du angeben, '...
                    'wo du dein Schild platzieren m�chtest, um die Kanonenkugel abzuwehren.\nDu kannst den Punkt mit den gr�nen und blauen Tasten steuern. Gr�n kannst du f�r schnelle '...
                    'Bewegungen und blau f�r langsame Bewegungen benutzen.'];
            else
                txt = ['Eine Kanone zielt auf eine Stelle des Kreises. Ihre Aufgabe ist es, die Kanonenkugel mit einem Schild abzuwehren. Mit dem orangenen '...
                    'Punkt k�nnen Sie angeben, wo Sie Ihr Schild platzieren m�chten, um die Kanonenkugel abzuwehren.\nSie k�nnen den Punkt mit den '...
                    'gr�nen und blauen Tasten steuern. Gr�n k�nnen Sie f�r schnelle Bewegungen und blau f�r langsame Bewegungen benutzen.'];
            end
        else
            if isequal(subject.group, '1')
                txt = ['Eine Kanone zielt auf eine Stelle des Kreises. Deine Aufgabe ist es, Kanonenkugeln mit einem Korb aufzusammeln. Mit dem orangenen '...
                    'Punkt kannst du angeben, wo du deinen Korb platzieren m�chtest, um die Kanonenkugel aufzusammeln.\nDu kannst den '...
                    'Punkt mit den gr�nen und blauen Tasten steuern. Gr�n kannst du f�r schnelle Bewegungen und blau f�r langsame Bewegungen benutzen.'];
            else
                txt = ['Eine Kanone zielt auf eine Stelle des Kreises. Ihre Aufgabe ist es, Kanonenkugeln mit einem Korb aufzusammeln. Mit dem orangenen Punkt k�nnen Sie angeben, '...
                    'wo Sie Ihren Korb platzieren m�chten, um die Kanonenkugeln aufzusammeln.\nSie k�nnen den Punkt mit den gr�nen und blauen Tasten steuern. Gr�n k�nnen Sie f�r schnelle '...
                    'Bewegungen und blau f�r langsame Bewegungen benutzen.'];
            end
        end
    elseif isequal(taskParam.gParam.taskType, 'oddball')
        txt = ['A cannon is aimed at the circle. Indicate where you would like to place your shield to catch cannonballs with the orange spot. '...
            'You can move the orange spot with the green and yellow buttons. Green is for fast movements and yellow is for slow movements.'];
    elseif isequal(taskParam.gParam.taskType, 'reversal') || isequal(taskParam.gParam.taskType, 'ARC')
        txt = 'A cannon is aimed at the circle. Indicate where you would like to place your shield to catch cannonballs with the orange spot. You can move the orange spot using the mouse.';
    elseif isequal(taskParam.gParam.taskType, 'chinese')
        if taskParam.gParam.language == 1
            txt = ['Du bist die Weltraumpolizei und besch�tzt deinen Planeten.\nEin fremdes Raumschiff zielt mit seiner Kanone auf eine Stelle deines Planeten und feuert '...
                'Kanonenkugeln. Deine Aufgabe ist es, die Kanonenkugel mit einem Schild abzuwehren. Mit dem orangenen Punkt kannst du angeben, wo du dein Schild platzieren m�chtest, '...
                'um die Kanonenkugel abzuwehren. Du kannst den Punkt mit der Maus bewegen. Das kannst du jetzt ausprobieren.'];
        elseif taskParam.gParam.language == 2
            txt = ['You are the space police and you must protect your planet.\n\nA foreign spaceship aims its cannon at a spot on your planet and fires '...
                'cannonballs. \nYour task is to fend off the cannonball with a shield. The orange dot lets you specify a point where you want to place your shield, '...
                'to ward off the cannonballs. \n\nYou can move the point with your mouse. Try it now.'];
        end
    end

    if isequal(taskParam.gParam.computer, 'Dresden')
        Screen('TextSize', taskParam.gParam.window.onScreen, 19);
    else
        Screen('TextSize', taskParam.gParam.window.onScreen, 30);
    end
    
    taskParam.symbol = false;
    tickInstruction.savedTickmark = nan;
    tickInstruction.previousOutcome = nan;
    DrawFormattedText(taskParam.gParam.window.onScreen, taskParam.strings.txtPressEnter,'center', taskParam.gParam.screensize(4)*0.9);
    
    [~, fw, ~, ~] = al_instrLoopTxt(taskParam, txt, cannon, 'arrow', distMean, tickInstruction);
    if fw == 1
        screenIndex = screenIndex + 1;
    elseif bw == 1
        screenIndex = screenIndex - 1;
    end
    WaitSecs(0.1);
end