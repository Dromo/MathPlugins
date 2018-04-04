import "Turbine.UI";
import "Turbine.UI.Lotro";

-- a draggable togglebutton to put somewhere on the screen
ToggleView = class( Turbine.UI.Window );

function ToggleView:Constructor( x,y )
    Turbine.UI.Window.Constructor( self );
    
    self:SetBackColor( Turbine.UI.Color(0.8,1,1,1) );
    self:SetSize(32,32);
    
    self.button=Turbine.UI.Button();
    self.button:SetParent( self );
    self.button:SetText( "RTP" );
    self.button:SetSize(30,30);
    self.button:SetPosition(1,1);
    self.button:SetBackColor(Turbine.UI.Color(0.5,0.2,0.2,0.2));
    
    self.button.MouseEnter=function()
            self.button:SetBackColor(Turbine.UI.Color(0.9,0,0,0));
    end
    self.button.MouseLeave=function()
        self.button:SetBackColor(Turbine.UI.Color(0.5,0.2,0.2,0.2));
    end
    self.button.MouseDown=function()
        self.button:SetBackColor(Turbine.UI.Color(1,0.4,0.4,0.4));
    end
    self.button.MouseUp=function()
        self.button:SetBackColor(Turbine.UI.Color(0.9,0,0,0));
    end
    
    -- Window Dragging functions --
    self.is_dragging = false;
    self.startDrag = function(sender, args)
        if ( args.Button ~= Turbine.UI.MouseButton.Left ) then return; end
        startX = args.X;
        startY = args.Y;
        self.is_dragging = true;
    end
    self.winHasMoved = false;
    self.endDrag = function(sender, args)
        if ( self.is_dragging ) then
            self:SetLeft(self:GetLeft() + (args.X - startX));
            self:SetTop(self:GetTop() + (args.Y - startY));
            self.is_dragging = false;
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
            self.winHasMoved = false;
        end
    end
    self.doDrag = function(sender, args)
        if ( self.is_dragging ) then
            self:SetLeft(self:GetLeft() + (args.X - startX));
            self:SetTop(self:GetTop() + (args.Y - startY));
            self.winHasMoved = true;
        end
    end
    self.attachDragListener = function(target)
        target.MouseDown = self.startDrag;
        target.MouseUp = self.endDrag;
        target.MouseMove = self.doDrag;
    end
    
    self.attachDragListener( self );
    self.attachDragListener( self.button );
    
    -- Toggle visibility on F12 --
    self.hudVisible = true;
    self.windowvisible = true;
    self.KeyDown=function(sender, args)
        if ( args.Action == 268435635 ) then
                self.hudVisible=not self.hudVisible;
                if self.hudVisible then
                    self:SetVisible(self.windowvisible);
                else
                self.windowvisible =self:IsVisible();
                self:SetVisible(false);
            end
        end
    end
    self:SetWantsKeyEvents(true);
    
end
