function reversalPractice
%REVERSALPRACTICE   This function manages the practice session of the
%reversal condition
%
%   Input
%       ~
%
%   Output
%       ~


screenIndex = 1;

while 1
    
    switch(screenIndex)
        
        case 1
            
            header = 'First Practice';
            txt = ['You will now need to catch '...
                'cannonballs shot from the cannon. '...
                'The cannon will usually remain aimed '...
                'at the same location. However, '...
                'occasionally the cannon will be '...
                'reaimed to a different '...'
                'part of the circle.\n\nIf the cannon '...
                'reaims its position, it will go back '...
                'to its previous aim. To earn most '...
                'money you should center your shield '...
                'on the location at which the cannon '...
                'is aimed.'];
            
            feedback = false;
            fw = al_bigScreen(taskParam, ...
                taskParam.strings.txtPressEnter, header,...
                txt, feedback);
            if fw == 1
                screenIndex = screenIndex + 1; % 1
            end
            WaitSecs(0.1);
            
        case 2
            
            condition = 'reversalPractice';
            LoadData = 'reversalVisibleNoNoise';
            
            %                     [taskParam, practData] = practLoop(taskParam,...
            %                         subject, taskParam.gParam.haz(1),...
            %                         taskParam.gParam.concentration(3), cannon,...
            %                         condition, LoadData);
            % added this (02.01.17) to get rid of practLoop
            [taskParam, practData] =  al_mainLoop(taskParam, taskParam.gParam.haz(1), taskParam.gParam.concentration(3), condition, subject);
            
            [txt, header] = al_feedback(practData, taskParam, subject, condition);
            feedback = true;
            fw = al_bigScreen(taskParam, taskParam.strings.txtPressEnter, header, txt, feedback);
            sumCannonDev = sum(abs(practData.cannonDev) >= 10);
            if fw == 1
                
                screenIndex = screenIndex + 1;
                
            end
            WaitSecs(0.1);
            
        case 3
            if sumCannonDev >= 4
                
                header = 'Try it again!';
                txt = ['In that block your shield was not '...
                    'always placed where the cannon was '...
                    'aiming. Remember: Placing your shield '...
                    'where the cannon is aimed will be the '...
                    'best way to catch cannonballs. Now try again.'];
                feedback = false;
                fw = al_bigScreen(taskParam, taskParam.strings.txtPressEnter, header, txt, feedback);
                if fw == 1
                    screenIndex = screenIndex - 1;
                elseif bw == 1
                    screenIndex = screenIndex - 2;
                end
            else
                
                header = 'Second Practice';
                txt = ['In this block you will encounter a '...
                    'cannon that is not perfectly accurate. '...
                    'On some trials it might shoot a bit '...
                    'above where it is aimed and on other '...
                    'trials a bit below. Your best strategy '...
                    'is still to place the shield in the '...
                    'location where the cannon is aimed. If '...
                    'the cannon reaims its position, it will '...
                    'still go back to its previous aim.'];
                
                feedback = false;
                fw = al_bigScreen(taskParam, taskParam.strings.txtPressEnter, header, txt, feedback);
                if fw == 1
                    screenIndex = screenIndex + 1;
                elseif bw == 1
                    screenIndex = screenIndex - 2;
                end
                
            end
            WaitSecs(0.1);
            
        case 4
            
            condition = 'reversalPracticeNoise';
            LoadData = 'reversalVisibleNoise';
            
            %                     [taskParam, practData] = practLoop(taskParam,...
            %                         subject, taskParam.gParam.haz(1),...
            %                         taskParam.gParam.concentration(1), cannon,...
            %                         condition, LoadData);
            % added this (02.01.17) to get rid of practLoop
            [taskParam, practData] =  al_mainLoop(taskParam, taskParam.gParam.haz(1), taskParam.gParam.concentration(3), condition, subject);
            
            [txt, header] = al_feedback(practData, taskParam, subject, condition);
            feedback = true;
            fw = al_bigScreen(taskParam, taskParam.strings.txtPressEnter, header, txt,feedback);
            sumCannonDev = sum(abs(practData.cannonDev) >= 10);
            if fw == 1
                
                screenIndex = screenIndex + 1;
                
            end
            WaitSecs(0.1);
            
        case 5
            if sumCannonDev >= 4
                
                header = 'Try it again!';
                txt = ['In that block your shield was not '...
                    'always placed where the cannon was '...
                    'aiming. Remember: Placing your shield '...
                    'where the cannon is aimed will be the '...
                    'best way to catch cannonballs. Now try again.' ];
                
                feedback = false;
                fw = al_bigScreen(taskParam, taskParam.strings.txtPressEnter, header,txt, feedback);
                if fw == 1
                    screenIndex = screenIndex - 1;
                elseif bw == 1
                    screenIndex = screenIndex - 2;
                end
            else
                
                header = 'Third Practice';
                
                txt = ['In the next block everything will be '...
                    'exactly the same except that you will no '...
                    'longer see the cannon. The cannon is '...
                    'still aiming and shooting exactly as '...
                    'before. You will be paid for catching '...
                    'balls exactly as before. But now you must '...
                    'place your shield at the position where '...
                    'you think the cannon is aimed.\n\nSince '...
                    'you will still see each ball shot from '...
                    'the cannon, you will be able to use the '...
                    'locations of past shots to inform your '...
                    'decision.\n\nTo help you remember the '...
                    'previous aim of the cannon you can place '...
                    'a tickmark at the position where you '...
                    'think the cannon aimed previously.'...
                    '\n\nPress Enter to see an example of this.'];
                
                feedback = false;
                fw = al_bigScreen(taskParam, taskParam.strings.txtPressEnter, header,txt, feedback);
                if fw == 1
                    screenIndex = screenIndex + 1;
                elseif bw == 1
                    screenIndex = screenIndex - 2;
                end
                
            end
            WaitSecs(0.1);
            
        case 6
            
            txt=['To place your tickmark, move the orange spot '...
                'to the part of the circle, where the cannon '...
                'is aiming and hit the right mouse button. '...
                'Take your time to try out how to set the '...
                'tickmark a couple of times. Then indicate '...
                'where you would like to place your shield to '...
                'catch the next cannonball.'];
            
            distMean = 290;
            outcome = 178;
            tickInstruction.savedTickmark = nan;
            tickInstruction.previousOutcome = nan;
            tickInstruction.previousPrediction = nan;
            cannon = true;
            [taskParam, fw, Data, savedTickmark] = al_instrLoopTxt(taskParam, txt, cannon, 'space', distMean, tickInstruction);
            al_lineAndBack(taskParam)
            al_drawCircle(taskParam);
            al_drawCross(taskParam);
            al_predictionSpot(taskParam);
            al_drawOutcome(taskParam, outcome);
            
            if abs(Data.tickCannonDev) > 3 || isnan(Data.tickCannonDev)
                
                header = 'Try it again!';
                
                if ~isnan(Data.tickCannonDev)
                    txt = ['In this case your tickmark was too '...
                        'far away from the cannon aim. '...
                        'Remember: Placing your '...
                        'tickmark where the cannon is aimed '...
                        'will be the best way to catch cannonballs. '...
                        'Now try again. '];
                elseif isnan(Data.tickCannonDev)
                    txt = ['In this case you did not save your '...
                        'tickmark. Remember: Placing your '...
                        'tickmark where the cannon is aimed '...
                        'will be the best way to catch cannonballs. '...
                        'Now try again.'];
                end
                
                feedback = false;
                fw = al_bigScreen(taskParam, taskParam.strings.txtPressEnter, header,txt, feedback);
                
            else
                
                Screen('DrawingFinished', taskParam.gParam.window.onScreen);
                t = GetSecs;
                Screen('Flip', taskParam.gParam.window.onScreen, t + 0.1);
                % Show baseline 1.
                al_drawCross(taskParam);
                al_lineAndBack(taskParam)
                al_drawCross(taskParam)
                al_drawCircle(taskParam)
                Screen('DrawingFinished', taskParam.gParam.window.onScreen, 1);
                Screen('Flip', taskParam.gParam.window.onScreen, t + 0.6, 1);
                
                % Show baseline 1.
                al_drawCross(taskParam);
                al_lineAndBack(taskParam)
                al_drawCross(taskParam)
                al_drawCircle(taskParam)
                if subject.rew == 1
                    al_shield(taskParam, 20, Data.pred, 1)
                elseif subject.rew == 2
                    al_shield(taskParam, 20, Data.pred, 0)
                end
                
                al_drawOutcome(taskParam, outcome)
                
                Screen('DrawingFinished', taskParam.gParam.window.onScreen, 1);
                Screen('Flip', taskParam.gParam.window.onScreen, t + 1.6, 1);
                
                % Show baseline 1.
                al_drawCross(taskParam);
                al_lineAndBack(taskParam)
                al_drawCross(taskParam)
                al_drawCircle(taskParam)
                Screen('DrawingFinished', taskParam.gParam.window.onScreen, 1);
                Screen('Flip', taskParam.gParam.window.onScreen, t + 2.1, 1);
                WaitSecs(1);
                
                while 1
                    txt=['In this case the cannon reaimed its '...
                        'postion. Your saved tickmark helps '...
                        'you to remember the previous aim of '...
                        'the cannon. When the cannon reaims '...
                        'again you should use your saved '...
                        'tickmark to quickly adapt your '...
                        'prediction. \nIn the next few trials '...
                        'you will not see the cannon anymore '...
                        'but you should still try to catch as '...
                        'many cannonballs as possible.'];
                    al_lineAndBack(taskParam)
                    al_drawCross(taskParam)
                    al_drawCircle(taskParam)
                    al_predictionSpot(taskParam);
                    TickMark(taskParam, savedTickmark, 'saved');
                    al_drawOutcome(taskParam, outcome)
                    DrawFormattedText(taskParam.gParam.window.onScreen,txt, taskParam.gParam.screensize(3)*0.1,...
                        taskParam.gParam.screensize(4)*0.05, [255 255 255], sentenceLength);
                    DrawFormattedText(taskParam.gParam.window.onScreen, taskParam.strings.txtPressEnter, 'center', taskParam.gParam.screensize(4)*0.9, [255 255 255]);
                    Screen('DrawingFinished', taskParam.gParam.window.onScreen, 1);
                    Screen('Flip', taskParam.gParam.window.onScreen, t + 1.6);
                    [ keyIsDown, ~, keyCode ] = KbCheck;
                    if keyIsDown
                        if keyCode(taskParam.keys.enter)
                            screenIndex = screenIndex + 1;
                            break
                        elseif keyCode(taskParam.keys.delete)
                            screenIndex = screenIndex - 3;
                            break
                        end
                    end
                end
                
                condition = 'reversalPracticeNoiseInv';
                LoadData = 'None';
                cannon = 'true';
                reversalPackage = struct('savedTickmark', savedTickmark, 'pred', Data.pred, 'outcome', outcome);
                %                         [taskParam, practData, leaveLoop] = practLoop(taskParam,...
                %                             subject, taskParam.gParam.haz(3),...
                %                             taskParam.gParam.concentration(1),...
                %                             cannon, condition, LoadData, reversalPackage);
                % added this (02.01.17) to get rid of practLoop
                [taskParam, practData] =  al_mainLoop(taskParam, taskParam.gParam.haz(1), taskParam.gParam.concentration(3), condition, subject);
                
                if leaveLoop
                    
                    header = 'Try it one more time!';
                    txt = ['In this case you updated your tickmark '...
                        'although the cannon did not change its aim. '...
                        'In the next round try to hold off for '...
                        'the tickmark while the cannon does not change.'];
                    
                    feedback = false;
                    fw = al_bigScreen(taskParam, taskParam.strings.txtPressEnter, header, txt, feedback);
                    screenIndex = 5;
                    if fw == 1
                        screenIndex = screenIndex + 1;
                    elseif bw == 1
                        screenIndex = screenIndex - 2;
                    end
                    
                else
                    
                    txt=['In this case the cannon reaimed to its '...
                        'previous position. You can use your saved '...
                        'tickmark to inform your prediction and to '...
                        'avoid recalibrating your shield again.\n'...
                        'Before you indicate your prediction you '...
                        'should update your tickmark. Move the '...
                        'mouse to your last prediction (orange '...
                        'tickmark) and hit the right mouse button. '...
                        'Then indicate your prediction.'];
                    
                    distMean = practData.distMean(end);
                    outcome = practData.outcome(end);
                    tickInstructions.savedTickmark = practData.savedTickmark(end);
                    tickInstructions.previousOutcome = outcome;
                    tickInstructions.previousPrediction = practData.pred(end);
                    [taskParam, fw, Data, savedTickmark] = al_instrLoopTxt(taskParam, txt, cannon, 'space', distMean, tickInstructions);
                    
                    tickDev = abs(tickInstructions.savedTickmark - Data.pred);
                    updatedTickDev = abs(practData.pred(end-1) - savedTickmark);
                    al_drawCross(taskParam);
                    al_lineAndBack(taskParam)
                    al_drawCross(taskParam)
                    al_drawCircle(taskParam)
                    Screen('DrawingFinished', taskParam.gParam.window.onScreen, 1);
                    Screen('Flip', taskParam.gParam.window.onScreen, t + 2.1, 1);
                    WaitSecs(1);
                    
                    al_drawCross(taskParam);
                    al_lineAndBack(taskParam)
                    al_drawCross(taskParam)
                    al_drawCircle(taskParam)
                    al_drawOutcome(taskParam, outcome)
                    al_predictionSpot(taskParam);
                    Screen('DrawingFinished', taskParam.gParam.window.onScreen, 1);
                    Screen('Flip', taskParam.gParam.window.onScreen, t + 3.1, 1);
                    WaitSecs(0.5);
                    
                    al_drawCross(taskParam);
                    al_lineAndBack(taskParam)
                    al_drawCross(taskParam)
                    al_drawCircle(taskParam)
                    Screen('DrawingFinished', taskParam.gParam.window.onScreen, 1);
                    Screen('Flip', taskParam.gParam.window.onScreen, t + 2.1, 1);
                    WaitSecs(1);
                    
                    al_drawCross(taskParam);
                    al_lineAndBack(taskParam)
                    al_drawCross(taskParam)
                    al_drawCircle(taskParam)
                    al_shield(taskParam, 20, Data.pred, 1)
                    al_drawOutcome(taskParam, outcome)
                    Screen('DrawingFinished', taskParam.gParam.window.onScreen, 1);
                    Screen('Flip', taskParam.gParam.window.onScreen, t + 3.1, 1);
                    WaitSecs(1);
                    
                end
            end
            
        case 7
            
            if tickDev <= 10 && updatedTickDev <= 10 && ~isnan(updatedTickDev)
                header = '';
                txt = ['Well done! In this block you can practice '...
                    'the task with an invisible cannon. Keep in '...
                    'mind that the cannon occasionally reaims to '...
                    'its previous position. Use the red tickmark '...
                    'to mark the previous aim of the cannon.'];
                
                feedback = false;
                fw = al_bigScreen(taskParam,...
                    taskParam.strings.txtPressEnter, header, txt, feedback);
                if fw == 1
                    screenIndex = screenIndex + 1;
                elseif bw == 1
                    screenIndex = screenIndex - 2;
                end
            elseif tickDev > 10
                
                header = 'Try again!';
                txt = ['In this case you did not use the information '...
                    'of the tickmark for your current prediction. '...
                    'Keep in mind to use the tickmark '...
                    'this time!.'];
                
                feedback = false;
                fw = al_bigScreen(taskParam, taskParam.strings.txtPressEnter, header, txt, feedback);
                
                if fw == 1
                    screenIndex = screenIndex - 1;
                    
                end
                
            elseif updatedTickDev > 10 || isnan(updatedTickDev)
                
                header = 'Try again!';
                txt = ['In this case you did not correctly update your '...
                    'tickmark after the cannon reaimed. Keep '...
                    'in mind to use the tickmark this time!'];
                
                feedback = false;
                fw = al_bigScreen(taskParam, taskParam.strings.txtPressEnter, header, txt, feedback);
                
                if fw == 1
                    screenIndex = screenIndex - 1;
                    
                end
                
            end
            
            WaitSecs(0.1);
            
        case 8
            
            condition = 'reversalPracticeNoiseInv2';
            LoadData = 'reversalNotVisibleNoise';
            
            cannon = false;
            savedTickmark = nan;
            
            %                     [taskParam, practData] = practLoop(taskParam,...
            %                         subject, taskParam.gParam.haz(1),...
            %                         taskParam.gParam.concentration(1),...
            %                         cannon, condition, LoadData);
            % added this (02.01.17) to get rid of practLoop
            [taskParam, practData] =  al_mainLoop(taskParam, taskParam.gParam.haz(1), taskParam.gParam.concentration(3), condition, subject);
            
            [txt, header] = al_feedback(practData, taskParam, subject, condition);
            feedback = true;
            fw = al_bigScreen(taskParam, taskParam.strings.txtPressEnter, header, txt, feedback);
            sumCannonDev = sum(abs(practData.cannonDev) >= 10);
            
            
            if fw == 1
                screenIndex = screenIndex + 1;
            end
            WaitSecs(0.1);
            
        case 9
            
            if isnan(practData.savedTickmark)
                
                header = 'Try it again!';
                txt = ['In that block you have never used '...
                    'your tickmark. Remember: Placing '...
                    'your tickmark where the cannon was '...
                    'previously aimed will be the '...
                    'best way to catch cannonballs. Now try again.' ];
                
                feedback = false;
                fw = al_bigScreen(taskParam, taskParam.strings.txtPressEnter, header,txt, feedback);
                if fw == 1
                    screenIndex = screenIndex - 1;
                elseif bw == 1
                    screenIndex = screenIndex - 2;
                end
            else
                header = 'Fourth Practice';
                txt = ['Now comes the last practice block. In this '...
                    'block of trials the cannon will not always '...
                    'reaim to its previous target, but will '...
                    'occasionally aim at a new location on the '...
                    'circle. You can still use the red tickmark to '...
                    'mark the previous aim of the cannon. '...
                    'That is, if you realize that the cannon '...
                    'changed its aim you have to decide whether '...
                    'it reaimed to the previous location or '...
                    'whether it is aiming at a new location.'];
                
                feedback = false;
                fw = al_bigScreen(taskParam, taskParam.strings.txtPressEnter, header, txt, feedback);
                if fw == 1
                    screenIndex = screenIndex + 1;
                elseif bw == 1
                    screenIndex = screenIndex - 2;
                end
                
                WaitSecs(0.1);
            end
            
        case 10
            
            break
            
    end
end

end
