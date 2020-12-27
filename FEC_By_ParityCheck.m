% Goal: Implement a FEC scheme on data comprising three hexidecimal 
% values with four parity bits and eight data bits.
%
% Written by Maxwell Zines
% Written 2020/12/26
% Revision No. 1.0.0
%
%    This code performs the functions of a simple FEC scheme utilising 
% four parity bits to protect an eight-bit word.
%    The program will look at a user-defined word and treat it as received
% data. It checks the word using an EVEN-PARITY scheme. 
%    The user enters a three-character hexidecimal value and the program 
% determines whether the value represents correctly transmitted data 
% (parity is even) or, otherwise, performs a correction to fix the word.
%
%    If you can devise a better scheme than my spaghetti FOR looping to
% calculate the sum bit values, please feel free to revise this code! The
% majority of the length of this code is complicated looping. 
% ----------------------------------------------------------------------

%Data
clear all; 
decValues = zeros(1,3);
binValues = zeros(1,12);
errorFlag = 0;

% Prompt user for input:
disp('Enter a hexidecimal word of length three (e.x. 0x8F3)');
UserWord = input('0x','s');

% Grab each character individually and convert it to binary
% Yes, this is a convoluted method - but for this demonstration it will do 
% the trick. Especially because we want to access each bit individually.
for i=1:3
     decValues(i) = hex2dec(UserWord(i));
     if decValues(i)>=8
         binValues((4*i)-3) = 1;
         decValues(i) = decValues(i) - 8;
     end
     if decValues(i)>=4
         binValues((4*i)-2) = 1;
         decValues(i) = decValues(i) - 4;
     end
     if decValues(i)>=2
         binValues((4*i)-1) = 1;
         decValues(i) = decValues(i) - 2;
     end
     if decValues(i) == 1
         binValues(4*i) = 1;
     end
end

%Parity bit one checks bits 1, 3, 5, 7, 9, and 11
%Parity bit one check:
SumBitOne = 0;
for i=1:2:12
    if binValues(i) == 1
        SumBitOne = SumBitOne + 1;
    end
end
if mod(SumBitOne,2) == 1
    errorFlag = 1;
    SumBitOne = 1;
end

%Parity bit two checks bits 2, 3, 6, 7, 10, and 11
%Parity bit two check:
SumBitTwo = 0;
for i=2:4:10
    if binValues(i) == 1
        SumBitTwo = SumBitTwo + 1;
    end
end
for i=3:4:11
    if binValues(i) == 1
        SumBitTwo = SumBitTwo + 1;
    end
end
if mod(SumBitTwo,2) == 1
    errorFlag = 1;
    SumBitTwo = 1;
end

%Parity bit three checks bits 4, 5, 6, 7, and 12
%Parity bit three check:
SumBitThree = 0;
for i=4:1:7
    if binValues(i) == 1
        SumBitThree = SumBitThree + 1;
    end
end
if binValues(12) == 1
        SumBitThree = SumBitThree + 1;
end
if mod(SumBitThree,2) == 1
    errorFlag = 1;
end

%Parity bit four checks bits 8, 9, 10, 11, and 12
%Parity bit four check:
SumBitFour = 0;
for i=8:1:12
    if binValues(i) == 1
        SumBitFour = SumBitFour + 1;
    end
end
if mod(SumBitFour,2) == 1
    errorFlag = 1;
    SumBitFour= 1;
end

% Determine if an error was detected, and generate the parity error string
% if so:
if errorFlag == 1
    parityError = [SumBitFour SumBitThree SumBitTwo SumBitOne];
    for i=1:4
        if mod(parityError(i),2) == 0
            parityError(i) = 0;
        end
    end
    
    % Next, find the value of the parity error string to determine which 
    % bit must be changed
    parityError = num2str(parityError);
    parityError(isspace(parityError)) = '';
    parityError = bin2dec(parityError);
    
    %Swap the value of the indicated bit
    if binValues(parityError) == 1
        binValues(parityError) = 0;
    else
        binValues(parityError) = 1;
    end
end

%Finally, convert the binary string back to hex (one character at a time)
charOne = 0;
charTwo = 0;
charThree = 0;

for i=1:4
    if binValues(i) == 1
        switch i
            case 1
                charThree = charThree + 8;
            case 2
                charThree = charThree + 4;
            case 3
                charThree = charThree + 2;
            case 4
                charThree = charThree + 1;
        end
    end
end
charThree = dec2hex(charThree);

for i=5:8
    if binValues(i) == 1
        switch i
            case 5
                charTwo = charTwo + 8;
            case 6
                charTwo = charTwo + 4;
            case 7
                charTwo = charTwo + 2;
            case 8
                charTwo = charTwo + 1;
        end
    end
end
charTwo = dec2hex(charTwo);

for i=9:12
    if binValues(i) == 1
        switch i
            case 9
                charOne = charOne + 8;
            case 10
                charOne = charOne + 4;
            case 11
                charOne = charOne + 2;
            case 12
                charOne = charOne + 1;
        end
    end
end
charOne = dec2hex(charOne);

finalValue = [charThree charTwo charOne];
finalValue = num2str(finalValue);
finalValue(isspace(finalValue)) = '';

fprintf('Corrected data: 0x%s\n', finalValue);
