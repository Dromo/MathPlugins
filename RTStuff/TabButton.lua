import "Turbine.UI";
import "Turbine.UI.Lotro";

-- a tab button in a specific color with appropriate mouseover/mousedown changes, as well as an active status
TabButton = class( Turbine.UI.Button );

function TabButton:Constructor( text,width,height,color )
    Turbine.UI.Button.Constructor( self );
    
    self.isFront = false;
    
    self.r = color.R
    self.g = color.G
    self.b = color.B

    self:SetSize(width,height);
    self:SetText( text );
    
    self:SetBlendMode(Turbine.UI.BlendMode.Overlay);
    self:SetBackColor( Turbine.UI.Color(0.6,self.r,self.g,self.b) );
    
    self.MouseEnter=function()
        if not self.isFront then
                self:SetBackColor(Turbine.UI.Color(0.8,self.r,self.g,self.b));
        end
    end
    self.MouseLeave=function()
        if not self.isFront then
            self:SetBackColor(Turbine.UI.Color(0.6,self.r,self.g,self.b));
        end
    end
    self.MouseDown=function()
        if not self.isFront then
            local dr = 0;
            local dg = 0;
            local db = 0;
            if self.r<=0.8 then dr = self.r+0.2 else dr = self.r end;
            if self.g<=0.8 then dg = self.g+0.2 else dg = self.g end;
            if self.b<=0.8 then db = self.b+0.2 else db = self.b end;
            self:SetBackColor(Turbine.UI.Color(1,dr,dg,db));
        end
    end
    self.MouseUp=function()
        if not self.isFront then
            self:SetBackColor(Turbine.UI.Color(0.8,self.r,self.g,self.b));
        end
    end
end

function TabButton:SetFront( front )
    self.isFront = front
    if self.isFront then
        self:SetBackColor( Turbine.UI.Color(1,self.r,self.g,self.b) );
    else
        self:SetBackColor( Turbine.UI.Color(0.6,self.r,self.g,self.b) );
    end
end
