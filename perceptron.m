function perceptron()
%SINGLE LAYER PERCEPTRON MODEL FOR AND DATA SET
%AUTHOR: HYDER NABI
%MCA- 2020(BATCH)
 
    %AND data set is used.
    dataSet = load('AND.txt');
 
    %n = size of data set(NO of instances)
    n = size(dataSet,1);
    
    %initial weights(the first element of vector is the weight for bias)
    %size of weight = 3 (inputs) + 1(bias) = 4
    %Initial Weights are set to zero
    weight = zeros(1,size(dataSet,2));
    
    % x = weighted sum(initially set to zero) 
    x = 0;
    
    %epoch = ith epoch (total epochs are 8)
    for epoch = 1:8
        
        %p = jth instance of data set in the ith epoch
        for p = 1:n         
            
            %1.0 here is the Bias Factor
            %Bias is multiplied by its corresponding weight.
            x = 1.0 * weight(1);
            
            %Rest inputs are multiplied by their corresponding weights and
            %Added together.
            for i = 1:size(dataSet,2)-1
                x = x + dataSet(p,i) * weight(i+1);
            end
            
            %yd = The Desired/Actual output of the jth instance
            %in the ith epoch
            yd = dataSet(p,end);
        
            %y= the Predicted output of the jth instance
            %in the ith epoch
            %Here, Sign Activation Function is used
            y = sign(x);
            
            %if the Actual output is not equal to the predicted Output
            if y ~= yd
                
                %e = error between the actual and predicted output.
                e = yd - y;
                
                %adjust/update Weights using old Weights + delta function
                
                %update the weight of Bias input 
                weight(1) = weight(1) + (1 * 1 * e);
                
                %update the weight of rest of the inputs
                weight(2:end) = weight(2:end) + (1 * dataSet(p,1:end-1) * e);
            end
    
        end
 
    end
    %Calling Function Test() to test the Perceptron.
    %pass Final Calculated weight as a parameter
    Test(weight)
end
%end of Training function
 
%function for Testing the Perceptron
function Test(weight)
    
    %Display the Weights
    disp(weight);
    
    %Load the Test Data set
    test = load('TestAnd.txt');
    
    %n = size of the test data set
    n = size(test,1);
    
    %loop from 1st to nth instance of test set
    for p = 1:n
        
        %1.0 here is the Bias Factor
        %Bias is multiplied by its corresponding weight.
        x = 1.0 * weight(1);
        
        %Rest inputs are multiplied by their corresponding weights and
        %Added together.
        for i = 1:size(test,2)
            x = x + test(p,i) * weight(i+1);
        end
        
        %y= the Predicted output of the jth instance
        %in the ith epoch
        %Here, Sign Activation Function is used
        y = sign(x);
        
        %display pth instance of test set
        disp(test(p,:));
        
        %display the PREDECTED output of pth test set
        disp(y);
        
        if y == 1
            
            %Plot the data with marker = 'o' and color = red
            % for the data instance whose Predicted class = +1
            plot3(test(p,1),test(p,2),test(p,3),'o r');
            hold on;
        else
            
            %Plot the data with marker = '*' and color = blue
            % for the data instance whose Predicted class = -1
             plot3(test(p,1),test(p,2),test(p,3),'* b');
             hold on;
        end
            
    end
   
end
