%% ExportData
%
% Use this script to merge all specified data and to export them to
% a CSV file called 'DATA'.

clear all
computer = 'Macbook';
%% Which subjects and variables do you want to load?

% Use {'all'} for all subjects or give IDs like {'001' '002'}.
subject = {'p03'};% 'test' 'test2'
variable = {'cond', 'oddBall' 'cp', 'hit', 'actRew', 'triggers'};
     
   

if isequal(subject,{'all'})
    if isequal(computer, 'Dresden_Rene')
    subjectFile= dir(fullfile('F:\\dokumente\\MATLAB\\adaptive_learning\\DataDirectory\\*.mat'));
    else
    subjectFile= dir(fullfile('AdaptiveLearning/DataDirectory/*.mat'));    
    end  
    DataLoad = cell(numel(subjectFile),1);
    for i = 1:length(subjectFile)
        DataLoad{i} = subjectFile(i).name; % Full data files to load.
        subject(i) = DataLoad(i); % Find subject names and...
        subject(i) = {subject{i}(13:end-4)}; %... extract them.
    end
else
    DataLoad = cell(numel(subject),1);
    for j = 1:length(subject)
        if isequal(computer, 'Dresden_Rene')
        DataLoad{j,1} = dir(fullfile(sprintf('F:\\dokumente\\MATLAB\\adaptive_learning\\DataDirectory\\*%s.mat', num2str(cell2mat((subject(j)))))));
        else
        DataLoad{j,1} = dir(fullfile(sprintf('AdaptiveLearning/DataDirectory/*%s.mat', num2str(cell2mat((subject(j)))))));
        end
        DataLoad{j,1} = DataLoad{j,1}.name;
        %DataLoad{j,1} = sprintf('BattleShips_%s.mat',...
        %   num2str(cell2mat((subject(j))))); % Full data files to load.
    end
end

% Cell that containts structs with all data.
allData = cell(length(DataLoad));
for i = 1:length(DataLoad)
    allData{i,1} = load(DataLoad{i});
end

allData{1}.DataCP_p03.triggers = allData{1}.DataCP_p03.triggers(:,7);
allData{1}.DataOddball_p03.triggers = allData{1}.DataOddball_p03.triggers(:,7);

%% Export selected data.

% Filename for csv file.
if isequal(computer, 'Dresden_Rene')
DATA = fopen('F:\\dokumente\\MATLAB\\adaptive_learning\\DataDirectory\\DATA.csv', 'w');
else
DATA = fopen('AdaptiveLearning/DataDirectory/DATA.csv', 'w');
end
% Raw names of structs.
name = cell(1,length(subject));%cell(6,length(subject));
for i = 1:length(subject);
    name{:,i} = fields(allData{i}); %name(:,i)
end
% preallocate variable that contains the structs of the subject.
structure = cell(2,1);

% some tricks that save us space.
print = '%s';
st = '%s\t';
stn = '%s\n';

% Headers for csv output.
for z = 1:length(variable)
    if z <= (length(variable)-1)
        fprintf(DATA, st, variable{z});
    else
        fprintf(DATA, stn, variable{z});
    end
end

% Loop through data and print out variables.
for a = 1:length(allData)
    for i = 1:length(name{a}) % name. das ist der springende punkt!
        trials=(length(allData{a}.(name{a}{i}).(variable{1}))); % Read out trial N.  Hier Problem mit der l�nge der Cell. sollte aber gehen. (length(allData{a}.(name{i,a}).(variable{1})))
        for k = 1:trials
            for x = 1:length(variable) % variable.
                val = allData{a}.(name{a}{i}).(variable{x})(k);  % und hier auch! val = allData{a}.(name{i,a}{1}).(variable{1})(1) %%%allData{a}.(name{i,a}).(variable{x})(k);
                type = class(val);
                if isequal(type, 'cell')
                    val = cell2mat(val);
                elseif isequal(type, 'double') || isequal(type, 'logical')
                    val = num2str(val);
                end
                if x < (length(variable))
                    fprintf(DATA, '%s\t', val);
                else
                    fprintf(DATA, '%s', val);
                end
            end
            fprintf(DATA, '\n');
        end
    end
end
fclose(DATA);