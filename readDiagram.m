%{
A function which inputs a .Diagram file, and prints whether a bimodial
distribution was found within it
%}

function [components, num] = readDiagram (oneDiagram)
    



    fileName = ['./Diagrams/d0_diagrams/', oneDiagram];
    fileName = char(fileName);

    fileID = fopen(fileName);
    oneLine = fgets(fileID);
        
    %Two patterns to identify the bimodial distribution of '|' within the
    %diagram file
    pattern1 = '\s+\|+\s+\|*';
    pattern2 = '\s+\|*\s+\|+';

    %A table to hold the results of the searched diagram file
    searchedDiagram = [];
    while ischar(oneLine)
        

        oneLine = fgets(fileID);
        strOneLine = num2str(oneLine);

        %Storing the matges of the regular expressions
        temp1 = regexp(strOneLine, pattern1,'match');
        temp2 = regexp(strOneLine, pattern2,'match');

        %If temp1 or temp2 are not empty, replace '|' with a 1
        if ~isempty(temp1) || ~isempty(temp2)
            temp = zeros(length(strOneLine),1);
            flag = strfind(strOneLine, '|');
            temp(flag) = 1;
            searchedDiagram = [searchedDiagram; temp'];
        end
    end

    %Closing the file
    fclose(fileID);

    %Creating a lable matrix that contains labels for the connected objects
    %found in BW
    [components, num] = bwlabel(searchedDiagram, 4);
    
    
end



