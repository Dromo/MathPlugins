import "Turbine";
import "Turbine.UI";
import "Turbine.UI.Lotro";
import "MathPlugins.RTStuff";

locale = "en";
if Turbine.Engine:GetLanguage() == Turbine.Language.German then
    locale = "de"
elseif Turbine.Engine:GetLanguage() == Turbine.Language.French then
    locale = "fr"
elseif Turbine.Engine:GetLanguage() == Turbine.Language.Russian then
    locale = "en"
end

wx,wy,wvis,tx,ty,chan,targ,getdata,locklist,activemap = 100,0,true,50,100,5,"",false,{},1; -- standard settings
-- load settings
local t = PatchDataLoad( Turbine.DataScope.Server , "RTsettings");
if t~= nil then
    if t["window"]~= nil then
        wx,wy,wvis = t["window"]["x"],t["window"]["y"],t["window"]["visible"];
    end
    if t["toggle"]~= nil then
        tx,ty = t["toggle"]["x"],t["toggle"]["y"];
    end
    if t["send"]~=nil then
        chan,targ = t["send"]["channel"],t["send"]["target"];
    end
    if t["recievedata"]=="true" then
        getdata = true;
    end
    if t["locked"]~=nil then
        locklist = t["locked"];
    end
    if t["activemap"]~=nil then
        activemap = t["activemap"];
    end
end

-- the main window
mainwindow = RTRunner();
mainwindow:SetPosition( wx,wy );
mainwindow:SetVisible( wvis );
mainwindow.channelList:SetSelectedIndex( chan );    
mainwindow.target:SetText( targ );
mainwindow.recCheck:SetChecked( getdata );
for i=1,mainwindow.nrMaps do
    if tableContains(locklist,mainwindow.maps[i].location) then
        mainwindow.maps[i]:SetLocked( true );
    end
end
SetActiveMap( mainwindow,activemap );

-- the toggle button to show/hide the window
tog = ToggleView();
tog:SetPosition( tx,ty );
tog:SetVisible( true );
tog.button.MouseClick = function()
    if not tog.is_dragging then
        mainwindow:SetVisible( not mainwindow:IsVisible() );
    end
end

-- the handling of the chat to get data from other players
chatHandler = Turbine.UI.Control();
chatHandler.isactive = getdata;
chatHandler.chat = Turbine.Chat;
ChatReceived = function(sender, args)
    local message = "";
    -- regional, uc1-4, world
    if tableContains({19,28,29,30,31,38}, args.ChatType) and args.Message~=nil
         and args.Message:sub(1,4)~="[To " then
        message = args.Message:match("%'(.*)%'");
    -- fellowship, kinship, officer, raid
    elseif tableContains({11,12,13,23}, args.ChatType) and args.Message~=nil
         and args.Message:sub(1,4)~="[To " then
        message = args.Message:match(": (.*)$");
    -- tells
    elseif args.ChatType==6 and args.Message~=nil then
        message = args.Message;
    end
    if message~=nil then
        local t = extractPatterns(message, "%a-%s?%a*RT:", "(%d%d?%.%d%u%s?%d%d?%.%d%u)",-3); -- extract map and coordinates
        if t~=nil then
            for i=1,mainwindow.nrMaps do
                if mainwindow.maps[i].location==t[1] then mainwindow.maps[i]:AddActive( t ); end
            end
        end
    end
end
if chatHandler.isactive then
    AddCallback(chatHandler.chat, "Received", ChatReceived);
end
chatHandler:SetWantsUpdates( true );

-- activate/deactivate the chat handling depending on the checkbox in the main window
mainwindow.recCheck.CheckedChanged = function(sender, args)
    chatHandler.isactive = mainwindow.recCheck:IsChecked();
    if chatHandler.isactive then AddCallback(chatHandler.chat, "Received", ChatReceived);
    else RemoveCallback(chatHandler.chat, "Received", ChatReceived); end
end

-- add the shell command
rtCommand = Turbine.ShellCommand();
function rtCommand:Execute( command, arguments )
    if command:lower() == 'rtplugin' or command:lower() == 'rtp' then
        mainwindow:SetVisible( not mainwindow:IsVisible() );
    end end
function rtCommand:GetHelp() return strings[locale]["commandH"]; end
function rtCommand:GetShortHelp() return strings[locale]["commandSH"]; end
Turbine.Shell.AddCommand( "RTPlugin;RTP;rtplugin;rtp", rtCommand );
listCommandsCommand = Turbine.ShellCommand();

-- unloading of the data
function UnloadMe( rtrun )
    RemoveCallback(chatHandler.chat, "Received", ChatReceived);
    Turbine.Shell.RemoveCommand( rtCommand );
    local t = {};
    t["window"] = {};
    t["window"]["x"],t["window"]["y"] = mainwindow:GetPosition();
    t["window"]["visible"] = mainwindow:IsVisible();
    t["toggle"] = {};
    t["toggle"]["x"],t["toggle"]["y"] = tog:GetPosition();
    t["send"] = {};
    t["send"]["channel"],t["send"]["target"] = mainwindow.channelList:GetSelectedIndex(),mainwindow.target:GetText();
    if mainwindow.recCheck:IsChecked() then
        t["recievedata"] = "true";
    else
        t["recievedata"] = "false";
    end
    local locklist = {};
    for i=1,mainwindow.nrMaps do
        if mainwindow.maps[i].locked then table.insert(locklist,mainwindow.maps[i].location) end
    end
    t["locked"] = locklist;
    t["activemap"] = mainwindow.activeMap;
    PatchDataSave( Turbine.DataScope.Server , "RTsettings", t);
    SaveData( rtrun );
end
