function al_lineAndBack(taskParam)
%AL_LINEANDBACK   This function draws background for intructions in the cannon task
%
%   Input
%       taskParam: structure containing task parameters
%
%   Output
%       ~


if ~isequal(taskParam.gParam.taskType, 'chinese')
    Screen('FillRect', taskParam.gParam.window.onScreen, [66 66 66]);
    Screen('DrawLine', taskParam.gParam.window.onScreen, [0 0 0], 0, taskParam.gParam.screensize(4)*1/4, taskParam.gParam.screensize(3), taskParam.gParam.screensize(4)*1/4, 5);
    Screen('DrawLine', taskParam.gParam.window.onScreen, [0 0 0], 0, taskParam.gParam.screensize(4)*3/4, taskParam.gParam.screensize(3), taskParam.gParam.screensize(4)*3/4, 5);
    Screen('FillRect', taskParam.gParam.window.onScreen, [0 25 51], [0, 0, taskParam.gParam.screensize(3), (taskParam.gParam.screensize(4)*1/4)-3]);
    Screen('FillRect', taskParam.gParam.window.onScreen, [0 25 51], [0, taskParam.gParam.screensize(4)*3/4, taskParam.gParam.screensize(3), taskParam.gParam.screensize(4)]);
else
    Screen('FillRect', taskParam.gParam.window.onScreen, [66 66 66]);
    Screen('DrawLine', taskParam.gParam.window.onScreen, [0 0 0], 0, taskParam.gParam.screensize(4)*1/4, taskParam.gParam.screensize(3), taskParam.gParam.screensize(4)*1/4, 5);
    Screen('DrawLine', taskParam.gParam.window.onScreen, [0 0 0], 0, taskParam.gParam.screensize(4)*6/7, taskParam.gParam.screensize(3), taskParam.gParam.screensize(4)*6/7, 5);
    Screen('FillRect', taskParam.gParam.window.onScreen, [0 25 51], [0, 0, taskParam.gParam.screensize(3), (taskParam.gParam.screensize(4)*1/4)-3]);
    Screen('FillRect', taskParam.gParam.window.onScreen, [0 25 51], [0, taskParam.gParam.screensize(4)*6/7, taskParam.gParam.screensize(3), taskParam.gParam.screensize(4)]);
end


