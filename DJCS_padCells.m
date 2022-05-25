function [newVals] = DJCS_padCells(vals,maxLengthCell) 

    %zeropad the elements in each cell array with a length shorter than the maxlength
    for i=1:length(vals)
        for j=cellfun('size',vals(i),2)+1:maxLengthCell
             vals{i}(j)=0;   
        end
    end
    temp=cell2mat(vals); 
    newVals = str2num(temp);
end