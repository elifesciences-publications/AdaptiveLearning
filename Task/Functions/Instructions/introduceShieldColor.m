function [screenIndex, Data] = introduceShieldColor(taskParam, subject, screenIndex, Data)
%INTRODUCESHIELDCOLOR   This function introduce the color of the shield to participants
%
%   Input
%       taskParam: structure containing task parameters
%       subject: structure containing subject-specific information
%       screenIndex: indicates current sceen of instruction phase
%       Data: data from the previous trials
%
%   Output
%       screenIndex: updated screenIndex
%       Data: data from the previous trials


if isequal(taskParam.gParam.taskType, 'dresden')
    if isequal(whichPractice, 'followOutcomePractice')
        header = 'Der Korb';
    else
        header = 'Das Schild';
    end
elseif isequal(taskParam.gParam.taskType, 'oddball') || isequal(taskParam.gParam.taskType, 'reversal')
    header = 'Your Shield';
    if subject.rew == 1
        colRew = 'blue';
        colNoRew = 'green';
    elseif subject.rew == 2
        colRew = 'green';
        colNoRew = 'blue';
    end
    txt = sprintf(['You can earn money by catching '...
        'cannonballs in your shield. If the shield '...
        'is %s you will earn %s CENTS for catching '...
        'the ball. If the shield is %s you will not '...
        'earn anything. On some trials the shield '...
        'will be large and on some trials it will '...
        'be small. You cannot know the SIZE or '...
        'COLOR of the shield until the cannon '...
        'is fired so it is best to try to catch '...
        'the ball on every trial.\n\n'...
        'You will now have some practice to get a '...
        'sense of how the color and size of '...
        'the shield vary.\n\nThe location of the '...
        'ball fired on the previous trial will be '...
        'marked with a black line.\n\nMoreover, '...
        'the location of the orange spot from the '...
        'previous trial will be marked with an '...
        'orange line.'],...
        colRew, num2str(100*taskParam.gParam.rewMag), colNoRew);
elseif isequal(taskParam.gParam.taskType, 'chinese')
    if taskParam.gParam.language == 1
        header = 'Dein Schild';
        if subject.rew == 1
            colRew = 'schwarz';
            colNoRew = 'green';
        elseif subject.rew == 2
            colRew = 'green';
            colNoRew = 'blue';
        end
        txt = sprintf(['Wenn du die Kanonenkugeln abwehrst, verdienst du '...
            'Geld. Du verdienst %s Cent f�r jede abgewehrte Kanonenkugel. '...
            'Dieses Geld wird dir am Ende '...
            'des Experiments ausgezahlt.\n\nDie Gr��e deines Schildes '...
            'kann sich in jedem Durchgang ver�ndern. Die Gr��e '...
            'des Schildes siehst du jedoch erst, nachdem die '...
            'Kanone geschossen hat. Daher solltest du versuchen, '...
            'dein Schild so genau wie m�glich zu positionieren, '...
            'um so viele Kanonenkugeln wie m�glich abzuwehren.\n\nUm einen '...
            'Eindruck von der wechselnden Gr��e des Schildes zu '...
            'bekommen, folgt jetzt eine kurze �bung.'],...
            num2str(100*taskParam.gParam.rewMag));
    elseif taskParam.gParam.language == 2
        header = 'Your Shield';
        if subject.rew == 1
            colRew = 'blue';
            colNoRew = 'green';
        elseif subject.rew == 2
            colRew = 'green';
            colNoRew = 'blue';
        end
        %     txt = sprintf(['You can collect points by catching '...
        %             'cannonballs in your shield. On some trials '...
        %             'the shield will be large and on some trials it will '...
        %             'be small. You cannot know the size of the shield '...
        %             'until the cannon is fired so it is best to '...
        %             'try to catch the ball on every trial.\n\n'...
        %             'You will now have some practice to get a '...
        %             'sense of how the size of the shield varies.'],...
        %             'schwarz', num2str(100*taskParam.gParam.rewMag), 'schwarz');
        txt = sprintf(['You can collect points by catching '...
            'cannonballs in your shield. \n\nOn some trials '...
            'the shield will be large and on some trials it will '...
            'be small.\n\nYou cannot know the size of the shield '...
            'until the cannon is fired, so it is best to '...
            'try to catch the ball on every trial.\n\n'...
            'You will now have some practice to get a '...
            'sense of how the size of the shield varies.'],...
            'schwarz', num2str(100*taskParam.gParam.rewMag), 'schwarz');
    end
elseif isequal(taskParam.gParam.taskType, 'ARC')
    header = 'Your Shield';
    if taskParam.gParam.showTickmark
        txt = sprintf(['You can collect points by catching '...
            'cannonballs in your shield. On some trials '...
            'the shield will be large and on some trials it will '...
            'be small. You cannot know the size of the shield '...
            'until the cannon is fired so it is best to '...
            'try to catch the ball on every trial.\n\n'...
            'You will now have some practice to get a '...
            'sense of how the size of the shield varies.'...
            '\n\nThe location of the ball fired on the '...
            'previous trial will be marked with a black '...
            'line.\n\nMoreover, the location of the orange '...
            'spot from the previous trial will be marked with an '...
            'orange line.'],...
            'schwarz', num2str(100*taskParam.gParam.rewMag), 'schwarz');
    elseif ~taskParam.gParam.showTickmark
        txt = sprintf(['You can collect points by catching '...
            'cannonballs in your shield. On some trials '...
            'the shield will be large and on some trials it will '...
            'be small. You cannot know the size of the shield '...
            'until the cannon is fired so it is best to '...
            'try to catch the ball on every trial.\n\n'...
            'You will now have some practice to get a '...
            'sense of how the size of the shield varies.'],...
            'schwarz', num2str(100*taskParam.gParam.rewMag), 'schwarz');
    end
end

feedback = false;
fw = al_bigScreen(taskParam, taskParam.strings.txtPressEnter, header, txt, feedback);
if fw == 1
    screenIndex = screenIndex + 1;
elseif bw == 1
    screenIndex = screenIndex - 7;
end
WaitSecs(0.1);
end