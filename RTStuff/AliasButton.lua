import "Turbine.UI";
import "Turbine.UI.Lotro";

-- a button with underlying quickslot to send things to chat
AliasButton = class( Turbine.UI.Control );

function AliasButton:Constructor( width,height )
    Turbine.UI.Control.Constructor( self );
    
    self.ShortcutData = "";

    self:SetBackColor(Turbine.UI.Color(1,0.8,0.8,0.8));
    self:SetSize(width,height);
    
    self.qs = Turbine.UI.Lotro.Quickslot();
    self.qs:SetSize(width-2,height-2);
    self.qs:SetParent( self );
    self.qs:SetPosition(1,1);
    self.qs:SetAllowDrop(false);
    self.qs.DragDrop=function()
        local sc=Turbine.UI.Lotro.Shortcut(Turbine.UI.Lotro.ShortcutType.Alias,"");
        sc:SetData(self.ShortcutData);
        self:SetShortcut(sc);
    end

    self.qs.Icon=Turbine.UI.Button();
    self.qs.Icon:SetParent( self );
    self.qs.Icon:SetText(  );
    self.qs.Icon:SetSize(width-2,height-2);
    self.qs.Icon:SetPosition(1,1);
    self.qs.Icon:SetZOrder(self.qs:GetZOrder()+1);
    self.qs.Icon:SetMouseVisible(false);
    self.qs.Icon:SetBlendMode(Turbine.UI.BlendMode.Overlay);
    self.qs.Icon:SetBackColor(Turbine.UI.Color(1,0.1,0.1,0.1));
    
    self.qs.MouseEnter=function()
            self.qs.Icon:SetBackColor(Turbine.UI.Color(1,0.3,0.3,0.3));
    end
    self.qs.MouseLeave=function()
        self.qs.Icon:SetBackColor(Turbine.UI.Color(1,0.1,0.1,0.1));
    end
    self.qs.MouseDown=function()
        self.qs.Icon:SetBackColor(Turbine.UI.Color(1,0.5,0.5,0.5));
    end
    self.qs.MouseUp=function()
        self.qs.Icon:SetBackColor(Turbine.UI.Color(1,0.3,0.3,0.3));
    end
end

function AliasButton:SetShortcutData( alias )
    self.ShortcutData = alias;
    self.qs:SetShortcut(Turbine.UI.Lotro.Shortcut(Turbine.UI.Lotro.ShortcutType.Alias, alias));
end

function AliasButton:SetText( text )
    self.qs.Icon:SetText( text )
end
