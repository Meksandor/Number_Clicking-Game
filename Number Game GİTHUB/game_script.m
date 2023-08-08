function game_script
    % Initialize the GUI
    guiFig = openfig('gameinterface.fig', 'reuse');
    handles = guihandles(guiFig);

    % Initialize the game
    currentNumber = randi([0, 9]);
    set(handles.staticText1, 'String', num2str(currentNumber));

    % Set the common callback function for all buttons
    set(handles.pushbutton1, 'Callback', @(src, event) buttonClickCallback(src, handles));
    set(handles.pushbutton2, 'Callback', @(src, event) buttonClickCallback(src, handles));
    set(handles.pushbutton3, 'Callback', @(src, event) buttonClickCallback(src, handles));
    set(handles.pushbutton4, 'Callback', @(src, event) buttonClickCallback(src, handles));
    set(handles.pushbutton5, 'Callback', @(src, event) buttonClickCallback(src, handles));
    set(handles.pushbutton6, 'Callback', @(src, event) buttonClickCallback(src, handles));
    set(handles.pushbutton7, 'Callback', @(src, event) buttonClickCallback(src, handles));
    set(handles.pushbutton8, 'Callback', @(src, event) buttonClickCallback(src, handles));
    set(handles.pushbutton9, 'Callback', @(src, event) buttonClickCallback(src, handles));
    set(handles.pushbutton10, 'Callback', @(src, event) buttonClickCallback(src, handles));

    guidata(guiFig, handles);

    % Wait for the GUI to close
    waitfor(guiFig);
end

function buttonClickCallback(src, handles)
    % Get the number from the button
    buttonNumber = str2double(get(src, 'String'));

    % Get the current number from the static text
    currentNumber = str2double(get(handles.staticText1, 'String'));

    % Check if the clicked button's number matches the current number
    if buttonNumber == currentNumber
        % Generate a new random number and update the static text
        newNumber = randi([0, 9]);
        set(handles.staticText1, 'String', num2str(newNumber));

        % Divide by 255 to scale the RGB values to the range [0, 1]
        set(handles.text3, 'backgroundcolor', [178 228 157] / 255);
        set(handles.text5,'backgroundcolor', [178 228 157] / 255);
        set(handles.text3, 'String','✅ヽ(͡◕ ͜ʖ ͡◕)ﾉ✅');
        set(handles.text5, 'String', '✅ヽ(͡◕ ͜ʖ ͡◕)ﾉ✅');
    else
        set(handles.text3,'backgroundcolor', [245 143 166] / 255);
        set(handles.text5,'backgroundcolor', [245 143 166] / 255);
        set(handles.text3, 'String','❌乁( ͡° ͜ʖ ͡°)ㄏ❌');
        set(handles.text5, 'String', '❌乁( ͡° ͜ʖ ͡°)ㄏ❌');
    end
end