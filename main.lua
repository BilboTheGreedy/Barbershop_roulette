BR_SavedVars = {
	player = "test",
amount = 1,
xpos = 110,
ypos = 500,
hmsg = "roulette",
bmsg = "Misery",
hidden = false,
auto = true
}


local function RandBarber()
	for variable = math.random(8), 10, 1 do
		SetNextBarberShopStyle(1);
	end 
	for variable = math.random(8), 10, 1 do
		SetNextBarberShopStyle(2);
	end 
	for variable = math.random(8), 10, 1 do
		SetNextBarberShopStyle(3);
	end 
	for variable = math.random(8), 10, 1 do
		SetNextBarberShopStyle(4);
	end 
	for variable = math.random(8), 10, 1 do
		SetNextBarberShopStyle(5);
	end 
	ApplyBarberShopStyle()
end


local button = CreateFrame("Button", nil, mainframe)
local function OnEnter(self)
	if self.Tooltip then
		GameTooltip:SetOwner(self,"ANCHOR_TOP");
		GameTooltip:AddLine(self.Tooltip,0,1,0.5,1,1,1);
		GameTooltip:Show();
		
	end
end
local function OnLeave(self) if GameTooltip:IsOwned(self) then GameTooltip:Hide(); end end
button:SetPoint("CENTER", mainframe, "CENTER", BR_SavedVars.ypos, BR_SavedVars.xpos)
button:SetSize(50, 30)
button:Hide()
button:SetNormalFontObject("GameFontNormalSmall");
button:SetHighlightFontObject("GameFontHighlightSmall");
button:SetDisabledFontObject("GameFontDisableSmall");
button:SetText("Random");
button:SetScript("OnEnter",OnEnter);
button:SetScript("OnLeave",OnLeave);
button.Tooltip="Try your luck.";

local ntex = button:CreateTexture()
ntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
ntex:SetTexCoord(0, 0.625, 0, 0.6875)
ntex:SetAllPoints()	
button:SetNormalTexture(ntex)

local htex = button:CreateTexture()
htex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight")
htex:SetTexCoord(0, 0.625, 0, 0.6875)
htex:SetAllPoints()
button:SetHighlightTexture(htex)

local ptex = button:CreateTexture()
ptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
ptex:SetTexCoord(0, 0.425, 0, 0.4875)
ptex:SetAllPoints()
button:SetPushedTexture(ptex)

button:SetScript("OnClick", function(self, arg1)
	RandBarber();
end)

  button:RegisterEvent("BARBER_SHOP_OPEN")
  button:RegisterEvent("BARBER_SHOP_CLOSE")
  
button:SetScript("OnEvent", function(self, event)
if event == "BARBER_SHOP_OPEN" then
	button.Tooltip="I'm loving it!";	
	button:Show();
	if BR_SavedVars.auto then
	PlaySound("MapPing", "master");
	RandBarber();
	end
end

if event == "BARBER_SHOP_CLOSE" then
	button:Hide();
end
end)



SLASH_br1 = '/br';
local function handler(msg, editbox)
 local command = msg:match("^(%S*)%s*(.-)$");
	 print(GetAddOnMetadata("BarberRoulette", "Title"), 'version ' .. GetAddOnMetadata("BarberRoulette", "Version"));
 end
SlashCmdList["br"] = handler;