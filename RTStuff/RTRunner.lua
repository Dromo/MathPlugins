import "Turbine";
import "Turbine.UI";
import "Turbine.UI.Lotro";
import "MathPlugins.RTStuff";

local function mapBg( location, parent )
    local bg = Turbine.UI.Control();
    bg:SetParent( parent );
    bg:SetSize( 800, 600 );
    bg:SetPosition( 0, 20 );
    bg:SetBackground( strings[location] );
    bg:SetStretchMode( 2 );
    bg:SetVisible( false );
    return bg;
end

-- the main plugin window
RTRunner = class( Turbine.UI.Window );

function RTRunner:Constructor()
    Turbine.UI.Window.Constructor( self );

    local rtrunner = self;
    self.loaded=false;
    self.Update=function()
        if not self.loaded then
            self.loaded=true;
            Plugins["RTPlugin"].Unload = function(self,sender,args)
                UnloadMe( rtrunner );
            end
            self:SetWantsUpdates(false);
        end
    end
    self:SetWantsUpdates(true);
    
    
    -- Window Dragging functions
    is_dragging = false;
    self.startDrag = function(sender, args)
        if ( args.Button ~= Turbine.UI.MouseButton.Left ) then return; end
        startX = args.X;
        startY = args.Y;
        is_dragging = true;
    end
    winHasMoved = false;
    self.endDrag = function(sender, args)
        if ( is_dragging ) then
            self:SetLeft(self:GetLeft() + (args.X - startX));
            self:SetTop(self:GetTop() + (args.Y - startY));
            is_dragging = false;
            if self:GetLeft() < 0 then
                self:SetLeft(0);
            elseif self:GetLeft() + self:GetWidth() > Turbine.UI.Display:GetWidth() then
                self:SetLeft(Turbine.UI.Display:GetWidth()-self:GetWidth());
            end
            if self:GetTop() < 0 then
                self:SetTop(0);
            elseif self:GetTop() + self:GetHeight() > Turbine.UI.Display:GetHeight() then
                self:SetTop(Turbine.UI.Display:GetHeight()-self:GetHeight());
            end
            winHasMoved = false;
        end
    end
    self.doDrag = function(sender, args)
        if ( is_dragging ) then
            self:SetLeft(self:GetLeft() + (args.X - startX));
            self:SetTop(self:GetTop() + (args.Y - startY));
            winHasMoved = true;
        end
    end
    self.attachDragListener = function(target)
        target.MouseDown = self.startDrag;
        target.MouseUp = self.endDrag; --60
        target.MouseMove = self.doDrag;
    end
    
    -- Toggle visibility on F12 and Esc
    hudVisible = true;
    self.windowvisible = true;
    self.KeyDown=function(sender, args)
        if ( args.Action == Turbine.UI.Lotro.Action.Escape ) then
                self:SetVisible( false );
        elseif ( args.Action == 268435635 ) then
                hudVisible=not hudVisible;
                if hudVisible then
                    self:SetVisible(self.windowvisible);
                else
                self.windowvisible =self:IsVisible();
                self:SetVisible(false);
            end
        end
    end
    self:SetWantsKeyEvents(true);
    

    self:SetText( "Roving Threats" );
    self:SetSize( 800,750 );
    self.nrMaps = 12;
    self.activeMap = 1;
        
    self.bottomBar = Turbine.UI.Control();
    self.bottomBar:SetParent( self );
    
    self.mapsBg = {};
    self.mapsBg[1] = mapBg( "Angmar", self );
    self.mapsBg[2] = mapBg( "Evendim", self );
    self.mapsBg[3] = mapBg( "Forochel", self );
    self.mapsBg[4] = mapBg( "Misty Mountains", self );
    self.mapsBg[5] = mapBg( "North Downs", self );
    self.mapsBg[6] = mapBg( "Southern Mirkwood", self );
    self.mapsBg[7] = mapBg( "Western Gondor", self );
    self.mapsBg[8] = mapBg( "Central Gondor", self );
    self.mapsBg[9] = mapBg( "Eastern Gondor", self );
    self.mapsBg[10] = mapBg( "The Wastes", self );
    self.mapsBg[11] = mapBg( "Gorgoroth", self );
    self.mapsBg[12] = mapBg( "Northern Mirkwood", self );
    
    self.maps = {};
    self.maps[1] = MapControl("Angmar", self );
    self.maps[2] = MapControl("Evendim", self );
    self.maps[3] = MapControl("Forochel", self );
    self.maps[4] = MapControl("Misty Mountains", self );
    self.maps[5] = MapControl("North Downs", self );
    self.maps[6] = MapControl("Southern Mirkwood", self );
    self.maps[7] = MapControl("Western Gondor", self );
    self.maps[8] = MapControl("Central Gondor", self );
    self.maps[9] = MapControl("Eastern Gondor", self );
    self.maps[10] = MapControl("The Wastes", self );
    self.maps[11] = MapControl("Gorgoroth", self );
    self.maps[12] = MapControl("Northern Mirkwood", self );

    self.tabs = {};
    self.tabs[1] = TabButton(strings[locale]["Angmar"],strings[locale]["Angmarw"],20,Turbine.UI.Color(1,0.8,0,0));
    self.tabs[2] = TabButton(strings[locale]["Evendims"],45,20,Turbine.UI.Color(1,0.5,0.5,0.5));
    self.tabs[3] = TabButton(strings[locale]["Forochels"],45,20,Turbine.UI.Color(1,0,0,1));
    self.tabs[4] = TabButton(strings[locale]["Misty Mountainss"],45,20,Turbine.UI.Color(1,0.8,0.5,0));
    self.tabs[5] = TabButton(strings[locale]["North Downss"],45,20,Turbine.UI.Color(1,0.8,0.4,0.4));
    self.tabs[6] = TabButton(strings[locale]["Southern Mirkwoods"],45,20,Turbine.UI.Color(1,0.8,0.8,0));
    self.tabs[7] = TabButton(strings[locale]["Western Gondors"],45,20,Turbine.UI.Color(1,0.2,0.8,0));
    self.tabs[8] = TabButton(strings[locale]["Central Gondors"],45,20,Turbine.UI.Color(1,0.4,0,1));
    self.tabs[9] = TabButton(strings[locale]["Eastern Gondors"],45,20,Turbine.UI.Color(1,0,0.6,0.45));
    self.tabs[10] = TabButton(strings[locale]["The Wastess"],45,20,Turbine.UI.Color.Black);
    self.tabs[11] = TabButton(strings[locale]["Gorgoroths"],45,20,Turbine.UI.Color.SteelBlue);
    self.tabs[12] = TabButton(strings[locale]["Northern Mirkwoods"],45,20,Turbine.UI.Color.Green);

    for i=1,self.nrMaps do
        self.tabs[i]:SetParent( self );
        self.maps[i]:SetParent( self );
        self.maps[i]:SetPosition( 0,20 );
        self.maps[i]:SetVisible( false );
        if i==1 then
            self.tabs[i]:SetPosition( 0,0 );
        else
            self.tabs[i]:SetPosition( self.tabs[i-1]:GetLeft()+self.tabs[i-1]:GetWidth(),0 );
        end
        self.tabs[i].MouseClick = function()
            SetActiveMap( self, i );
        end
        self.attachDragListener(self.maps[i]);
    end
    self.maps[self.activeMap]:SetVisible( true );
    self.maps[self.activeMap]:SetMakeQS( true );
    self.tabs[self.activeMap]:SetFront( true );
    self.mapsBg[self.activeMap]:SetVisible( true );

    self.closeb = Turbine.UI.Control();
    self.closeb:SetParent( self.maps[self.activeMap] );
    self.closeb:SetSize( 16,16 );
    self.closeb:SetPosition( 783,0 );
    self.closeb:SetBackground( 0x41000196 );
    self.closeb.MouseEnter=function() self.closeb:SetBackground( 0x41000198 ) end
    self.closeb.MouseLeave=function() self.closeb:SetBackground( 0x41000196 ) end
    self.closeb.MouseDown=function() self.closeb:SetBackground( 0x41000197 ) end
    self.closeb.MouseUp=function() self.closeb:SetBackground( 0x41000196 ) end
    self.closeb.MouseClick=function() self:SetVisible( false ); self.windowvisible = false; end
    
    self.bottomBar:SetBackColor( Turbine.UI.Color(0.9,0,0,0) );
    self.bottomBar:SetSize( 800,30);
    self.bottomBar:SetPosition( 0,620 );
    self.attachDragListener(self.bottomBar);

    self.resetButton = Turbine.UI.Lotro.Button();
    self.resetButton:SetText( strings[locale]["reset"] );
    self.resetButton:SetSize( 135,20 );
    self.resetButton:SetParent( self );
    self.resetButton:SetZOrder( self.bottomBar:GetZOrder()+1 );
    self.resetButton:SetPosition( 5,625 );
    self.resetButton.MouseClick=function()
        for i=1,self.nrMaps do
            self.maps[i]:SetActive( {} );
        end
    end
    
    self.sendLabel = Turbine.UI.Label();
    self.sendLabel:SetText( strings[locale]["sendtext"] );
    self.sendLabel:SetSize( 165,20 );
    self.sendLabel:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleRight );
    self.sendLabel:SetParent( self );
    self.sendLabel:SetZOrder( self.bottomBar:GetZOrder()+1 );
    self.sendLabel:SetPosition( 145,625 );
    
    self.channelList = DropDownList();
    self.channelList:SetParent( self.maps[self.activeMap] );
    if locale=="fr" then -- slight movement in case of french, since some labels are bigger
        moveleft = 12
    else
        moveleft = 0
    end
    self.channelList:SetSize( 100-moveleft,20 );
    self.channelList:SetZOrder( self.bottomBar:GetZOrder()+1 );
    self.channelList:SetPosition( 319,605 );
    self.channelList:SetDropRows(6);
    
    self.channelTable = strings[locale]["channelList"];
    for _,value in pairs( self.channelTable ) do
        self.channelList:AddItem(value[1], value[2]);
    end

    self.target = Turbine.UI.Lotro.TextBox();
    self.target:SetSize( 150-moveleft,29 );
    self.target:SetParent( self );
    self.target:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleLeft );
    self.target:SetZOrder( self.bottomBar:GetZOrder()+1 );
    self.target:SetPosition( 425-moveleft,621 );
    
    self.sendButton = AliasButton( 60,20 );
    self.sendButton:SetText( strings[locale]["send"] );
    self.sendButton:SetParent( self );
    self.sendButton:SetZOrder( self.bottomBar:GetZOrder()+1 );
    self.sendButton:SetPosition( 580-2*moveleft,625 );
    AddCallback(self.sendButton.qs, "MouseEnter", function()
        if self.channelList:GetSelectedIndex()==5 then
            self.sendButton:SetShortcutData( self.channelList:GetValue()..self.target:GetText().." "
            ..self.maps[self.activeMap].location.."RT: "
            ..table.concat(self.maps[self.activeMap]:GetActive(), ", ") );
        else
            self.sendButton:SetShortcutData( self.channelList:GetValue()..self.maps[self.activeMap].location.."RT: "
            ..table.concat(self.maps[self.activeMap]:GetActive(), ", ") );
        end
    end);
    
    self.recLabel = Turbine.UI.Label();
    self.recLabel:SetText( strings[locale]["recievetext"] );
    self.recLabel:SetSize( 120+2*moveleft,20 );
    self.recLabel:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleRight );
    self.recLabel:SetParent( self );
    self.recLabel:SetZOrder( self.bottomBar:GetZOrder()+1 );
    self.recLabel:SetPosition( 645-2*moveleft,625 );
    
    self.recCheck = Turbine.UI.Lotro.CheckBox();
    self.recCheck:SetParent( self );
    self.recCheck:SetSize( 18,18 );
    self.recCheck:SetZOrder( self.bottomBar:GetZOrder()+1 );
    self.recCheck:SetPosition( 776,626 );
    
    LoadData( self );
end

function SetActiveMap( rtrun, i )
    if i>=1 and i<=rtrun.nrMaps then
        rtrun.maps[rtrun.activeMap]:SetVisible( false );
        rtrun.maps[rtrun.activeMap]:SetMakeQS( false );
        rtrun.tabs[rtrun.activeMap]:SetFront( false );
        rtrun.tabs[rtrun.activeMap]:SetWidth( 45 );
        rtrun.tabs[rtrun.activeMap]:SetText( strings[locale][rtrun.maps[rtrun.activeMap].location.."s"] );
        rtrun.mapsBg[rtrun.activeMap]:SetVisible( false );
        rtrun.activeMap = i;
        rtrun.maps[rtrun.activeMap]:SetVisible( true );
        rtrun.maps[rtrun.activeMap]:SetMakeQS( true );
        rtrun.tabs[rtrun.activeMap]:SetFront( true );
        rtrun.tabs[rtrun.activeMap]:SetWidth( strings[locale][rtrun.maps[rtrun.activeMap].location.."w"] );
        rtrun.tabs[rtrun.activeMap]:SetText( strings[locale][rtrun.maps[rtrun.activeMap].location] );
        rtrun.mapsBg[rtrun.activeMap]:SetVisible( true );
        rtrun.closeb:SetParent( rtrun.maps[rtrun.activeMap] );
        rtrun.channelList:SetParent( rtrun.maps[rtrun.activeMap] );
        for j=2,rtrun.nrMaps do
            rtrun.tabs[j]:SetPosition( rtrun.tabs[j-1]:GetLeft()+rtrun.tabs[j-1]:GetWidth(),0 );
        end
    end
end

function SaveData( rtrun )  
    local t = {}
    for i=1,rtrun.nrMaps do
        t[rtrun.maps[i].location] = rtrun.maps[i]:GetActive( );
    end
    PatchDataSave(Turbine.DataScope.Server , "RTcoords", t);
end

function LoadData( rtrun )
    local t = Turbine.PluginData.Load( Turbine.DataScope.Server , "RTcoords");
    if t~= nil then 
        for i=1,rtrun.nrMaps do
            if t[rtrun.maps[i].location]~= nil then
                rtrun.maps[i]:SetActive(t[rtrun.maps[i].location]);
            end
        end
    end
end
