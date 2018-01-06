LG_SavedVars = {
enabled = true
}; 

SLASH_br1 = '/br';
local function handler(msg, editbox)
 local command = msg:match("^(%S*)%s*(.-)$");
	 print(GetAddOnMetadata("BarberRoulette", "Title"), 'version ' .. GetAddOnMetadata("BarberRoulette", "Version"));
	 for variable = math.random(5), 10, 2 do
		SetNextBarberShopStyle(1);
	 end 
	 for variable = math.random(5), 10, 2 do
		SetNextBarberShopStyle(2);
	 end 
	 for variable = math.random(5), 10, 2 do
		SetNextBarberShopStyle(3);
	 end 
	 ApplyBarberShopStyle()
 end
SlashCmdList["br"] = handler;