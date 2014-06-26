function trigger = SendTrigger(taskParam, taskData, Subject, condition, vola, trial, Tevent)
% This function sends the EEG triggers.
%
%   1. condition (1: practice, 2: main, 3: control)
%   2. vola (1: low, 2: high)
%   3. cp (0: no CP, 1: CP)
%   4. which boat is rewarded? (1: gold, 2: silver)
%   5. boat on trial N-1 (1: gold, 2: silver)
%   6. event: (1: prediction, 2: outcome, 3: boat)
%
% Example: 210211 - main, low vola, no CP, silver rewarded,
% in last trial gold boat was shown, event: prediction.

if taskParam.gParam.sendTrigger == true
    
    %condition
    if isequal(condition, 'practice')
        Tcond = 1;
    elseif isequal(condition, 'main')
        Tcond = 2;
    elseif isequal(condition, 'control')
        Tcond = 3;
    end
    
    
    %vola
    if vola == .2 % abstrahieren
        Tvola = 1;
    elseif vola == .7
        Tvola = 2;
    end
    
    %cp: dieser trial
    if taskData.cp(trial)== 1
        Tcp = 1;
    elseif taskData.cp(trial)== 0
        Tcp = 0;
    end
    
    
    % reward.
    if isequal(Subject.rew, '1')
        Trew = 1;
    elseif isequal(Subject.rew, '2')
        Trew = 2;
    end
    
    %boat: wichtig welche ladung letztes boot hatte!
    if trial > 1
        
        if taskData.boatType(trial -1) == 1
            Tboat = 1;
        elseif taskData.boatType(trial -1) == 2
            Tboat = 2;
        end
    elseif trial == 1
        Tboat = 9;
    end
    
    
    trigger = strcat(num2str(Tcond),num2str(Tvola),num2str(Tcp), num2str(Trew), num2str(Tboat), num2str(Tevent));
    trigger = str2double(trigger);
    
    
    
else
    trigger = 0000;
end

if taskParam.gParam.sendTrigger == true
    outp(taskParam.triggers.port, trigger);
    WaitSecs(1/taskParam.triggers.sampleRate);
    outp(taskParam.triggers.port,0) % Set port to 0.
end
end
