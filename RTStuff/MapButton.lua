import "Turbine.UI";
import "Turbine.UI.Lotro";

-- a toggle button to put on the map
MapButton = class( Turbine.UI.Button );

function MapButton:Constructor( control,x,y, coords )
    Turbine.UI.Button.Constructor( self );
    
    self.isactive = false;

    self.makeQS = false;
    
    self:SetParent( control );
    self:SetBackground("MathPlugins/RTStuff/Resources/inactive.tga");
    self:SetSize(16,16);
    self:SetPosition( x-8,y-8 );
    self:SetBlendMode( Turbine.UI.BlendMode.AlphaBlend );
    
    self.Toggle = function( )
        self.isactive = not self.isactive;
        if self.isactive then
            self.Activate( );
        else
            self.Deactivate( );
        end
    end
    
    self.Click = function(sender, args)
        self.Toggle();
        SaveData( mainwindow );
    end
    
    self.Activate = function()
        self.isactive = true;
        self:SetBackground( "MathPlugins/RTStuff/Resources/active.tga" );
    end
    
    self.Deactivate = function()
        self.isactive = false;
        self:SetBackground( "MathPlugins/RTStuff/Resources/inactive.tga" );
    end
    
    self.SetLocked = function( button, bool )
        if bool then
            button.Click = nil;
        else
            button.Click = function(sender, args) button.Toggle() end
        end
    end
    
    self:SetWantsKeyEvents(true);
    Turbine.UI.Lotro.Action.AltKey = 268435556;
    Turbine.UI.Lotro.Action.ControlKey = 268435575;

    self.KeyDown = function(sender, args)
        if (args.Action == Turbine.UI.Lotro.Action.ControlKey) and self.makeQS and mainwindow:IsVisible() then
            local QSdata = "";
            if mainwindow.channelList:GetSelectedIndex()==5 then
                QSdata = mainwindow.channelList:GetValue()..mainwindow.target:GetText().." "
                    ..strings[locale]["nexttarget1"]..coords..strings[locale]["nexttarget2"];
            else
                QSdata = mainwindow.channelList:GetValue()
                    ..strings[locale]["nexttarget1"]..coords..strings[locale]["nexttarget2"];
            end
            self.CreateQuickslot(Turbine.UI.Color.Yellow, QSdata);
        elseif (args.Action == Turbine.UI.Lotro.Action.AltKey) and self.makeQS and mainwindow:IsVisible() then
            self.CreateQuickslot(Turbine.UI.Color.Blue, "/way target "..coords);
            self.qs.MouseClick = function()
                mainwindow:SetVisible(false);
            end
        end
    end

    self.KeyUp = function(sender, args)
        self.DestroyQuickslot();
    end

    self.CreateQuickslot = function(color, alias)
        self.DestroyQuickslot();
        self.qs = Turbine.UI.Lotro.Quickslot();
        self.qs:SetParent(self);
        self.qs:SetShortcut(Turbine.UI.Lotro.Shortcut(Turbine.UI.Lotro.ShortcutType.Alias, alias));
        self.qs.hider = Turbine.UI.Control();
        self.qs.hider:SetParent(self);
        self.qs.hider:SetMouseVisible(false);
        self.qs.hider:SetBackground("MathPlugins/RTStuff/Resources/inactive.tga");
        self.qs.hider:SetBackColor(color);
        self.qs.hider:SetBackColorBlendMode(Turbine.UI.BlendMode.Color);
    end
    
    self.DestroyQuickslot = function()
        if (self.qs) then
            self.qs:SetParent(nil);
            self.qs.hider:SetParent(nil);
            self.qs = nil;
        end
    end
end
