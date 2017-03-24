function main()

szComp1 = 0;
szComp2 = 0;


%clearing the contents of the file to write to
resultID = fopen('results.txt', 'w')


s = dir('./Diagrams/d0_diagrams/hsa*.diagram');
diagramList = {s.name}';

[numDiagram, ~] = size(diagramList);

    for i = 1:numDiagram
    [components, num] = readDiagram(diagramList{i});

        %If a bimodial distribution was found. update the contents of cellLabel,
        %and output that a bimodial distribution was found
        if num == 2
            msg1 = 'Bimodial Distribution';
            current1 = components(1);
            disp(current1)
            [~,szComp1] = size(current1);

            %Checking to make sure the distance of the distribution is within
            %acceptable limits
            if szComp1 <=24 && szComp1 >=19
                msg2 = 'Correct Size';
            else
                msg2 = 'Incorrect Size';
            end

            current2 = components(2);
            [~,szComp2] = size(current2);

            %Checking to make sure the distance of the distribution is within
            %acceptable limits
            if szComp2 <=24 && szComp2 >=19
                msg2 = 'Correct Size';
            else
                msg2 = 'Incorrect Size';
            end

            %If no bimodial distribution was found, output this, and change the
            %cellLabel regarding Correct Size to no
        else
            msg1 = 'Not Bimodial Distribution';
        end


        fprintf(resultID, '%s\t%s\t%s\t%s\t%s\t%s\n', diagramList{i}, num,...
            szComp1, szComp2, msg1, msg2);

    end
    fclose(resultID);

end



