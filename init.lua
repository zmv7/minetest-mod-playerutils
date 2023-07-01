core.register_privilege("heal_self", {
	description = "Allows modifying own HP/breath points",
	give_to_singleplayer = false
})
core.register_privilege("heal", {
	description = "Allows modifying any players' HP/breath points",
	give_to_singleplayer = false
})

core.register_privilege("physics_self", {
	description = "Allows applying physics_override to user",
	give_to_singleplayer = false
})
core.register_privilege("physics", {
	description = "Allows applying physics_override to any player",
	give_to_singleplayer = false
})

core.register_privilege("psize_self", {
	description = "Allows managing own size",
	give_to_singleplayer = false
})
core.register_privilege("psize", {
	description = "Allows managing any player's size",
	give_to_singleplayer = false
})

core.register_privilege("hotbar", {
	description = "Allows managing hotbar's width",
	give_to_singleplayer = false
})

core.register_privilege("clearinv", {
	description = "Allows clearing inventories of players",
	give_to_singleplayer = false
})

core.register_chatcommand("whois", {
  description = "View player's client information",
  privs = {server=true},
  params = "<playername>",
  func = function(name, param)
	local info = core.get_player_information(param)
	if not info then
		return false, "Invalid player"
	else
		return true, dump(info,"")
	end
end})

core.register_chatcommand("hotbar", {
  description = "Set hotbar width",
  privs = {hotbar=true},
  params = "<width>",
  func = function(name, param)
	local player = core.get_player_by_name(name)
	if not player then
		return false, "You can't use this command from IRC/Discord!"
	end
	local size = tonumber(param)
	if not size then
		return false, "Invalid width value"
	end
	player:hud_set_hotbar_itemcount(size)
	player:hud_set_hotbar_image("")
end})

core.register_chatcommand("sethp", {
  description = "Set your own or another player's current HP",
  privs = {heal_self=true},
  params = "[playername] <hp>",
  func = function(name, param)
	local nick, hp = param:match("^(%S+) (.+)$")
	if not nick then
		nick, hp = name, param
	end
	if not core.check_player_privs(name,{heal=true}) and nick ~= name then
		return false, "You can only set your own HP"
	end
	local player = core.get_player_by_name(nick)
	if not player then
		return false, "Invalid player"
	end
	if not tonumber(hp) then
		return false, "Invalid HP value"
	end
	player:set_hp(tonumber(hp))
	return true, "HP of "..nick.." set to "..hp
end})

core.register_chatcommand("maxhp", {
  description = "Set your own or another player's maximum HP",
  privs = {heal_self=true},
  params = "[playername] <hp>",
  func = function(name, param)
	local nick, hp = param:match("^(%S+) (.+)$")
	if not nick then
		nick, hp = name, param
	end
	if not core.check_player_privs(name,{heal=true}) and nick ~= name then
		return false, "You can only set your own maximum HP"
	end
	local player = core.get_player_by_name(nick)
	if not player then
		return false, "Invalid player"
	end
	if not tonumber(hp) then
		return false, "Invalid HP value"
	end
	player:set_properties({hp_max=tonumber(hp)})
	return true, "Maximum HP of "..nick.." set to "..hp
end})

core.register_chatcommand("setbp", {
  description = "Set your own or another player's breath points",
  privs = {heal_self=true},
  params = "[playername] <bp>",
  func = function(name, param)
	local nick, bp = param:match("^(%S+) (.+)$")
	if not nick then
		nick, bp = name, param
	end
	if not core.check_player_privs(name,{heal=true}) and nick ~= name then
		return false, "You can only set your own BP"
	end
	local player = core.get_player_by_name(nick)
	if not player then
		return false, "Invalid player"
	end
	if not tonumber(bp) then
		return false, "Invalid HP value"
	end
	player:set_breath(tonumber(bp))
	return true, "Breath points of "..nick.." set to "..bp
end})

core.register_chatcommand("speed", {
  description = "Sets your or another player's movement speed. Use with empty param to reset to default",
  privs={physics_self=true},
  params = "[playername] [speed]",
  func = function(name, param)
	local nick, speed = param:match("^(%S+) (.+)$")
	if not nick then
		nick, speed = name, param
	end
	if not core.check_player_privs(name,{physics=true}) and nick ~= name then
		return false, "You can only set your own speed"
	end
	local player = core.get_player_by_name(nick)
	if not player then
		return false, "Invalid player"
	end
	if speed == "" then
		speed = 1
	end
	if not tonumber(speed) then
		return false, "Invalid speed value"
	end
	player:set_physics_override({speed=speed})
	return true, "Speed value of "..nick.." set to "..speed
end})

core.register_chatcommand("jumph", {
  description = "Sets your or another player's jump height. Use with empty param to reset to default",
  privs={physics_self=true},
  params = "[playername] [jump height]",
  func = function(name, param)
	local nick, jumph = param:match("^(%S+) (.+)$")
	if not nick then
		nick, jumph = name, param
	end
	if not core.check_player_privs(name,{physics=true}) and nick ~= name then
		return false, "You can only set your own jump height"
	end
	local player = core.get_player_by_name(nick)
	if not player then
		return false, "Invalid player"
	end
	if jumph == "" then
		jumph = 1
	end
	if not tonumber(jumph) then
		return false, "Invalid jump height value"
	end
	player:set_physics_override({jump=jumph})
	return true, "Jump height value of "..nick.." set to "..jumph
end})

core.register_chatcommand("gravity", {
  description = "Sets your or another player's gravity. Use with empty param to reset to default",
  privs={physics_self=true},
  params = "[playername] [gravity]",
  func = function(name, param)
	local nick, grav = param:match("^(%S+) (.+)$")
	if not nick then
		nick, grav = name, param
	end
	if not core.check_player_privs(name,{physics=true}) and nick ~= name then
		return false, "You can only set your own gravity"
	end
	local player = core.get_player_by_name(nick)
	if not player then
		return false, "Invalid player"
	end
	if grav == "" then
		grav = 1
	end
	if not tonumber(grav) then
		return false, "Invalid gravity value"
	end
	player:set_physics_override({gravity=grav})
	return true, "Gravity value of "..nick.." set to "..grav
end})

core.register_chatcommand("stun", {
  description = "Disable player's movement",
  privs={physics=true},
  params = "<playername>",
  func = function(name, param)
	local player = core.get_player_by_name(param)
	if not player then
		return false, "Invalid player"
	end
	player:set_physics_override({speed=0,jump=0})
	return true, param.." stunned"
end})

core.register_chatcommand("unstun", {
  description = "Restore player's movement",
  privs={physics=true},
  params = "<playername>",
  func = function(name, param)
	local player = core.get_player_by_name(param)
	if not player then
		return false, "Invalid player"
	end
	player:set_physics_override({speed=1,jump=1})
	return true, param.." unstunned"
end})

core.register_chatcommand("killme", {
  description = "Kill yourself",
  privs = {interact=true},
  func = function(name, param)
	local player = core.get_player_by_name(name)
	if player then
		player:set_hp(0)
	end
end})

core.register_chatcommand("xkill", {
  description = "Set your or another player's HP to 0 until rejoin or /xres",
  privs = {heal_self=true},
  params = "[playername]",
  func = function(name, param)
	local nick = (param ~= "" and param or name)
	if not core.check_player_privs(name,{heal=true}) and nick ~= name then
		return false, "You can use /xkill on yourself only"
	end
	local player = core.get_player_by_name(nick)
	if not player then
		return false, "Invalid player"
	end
	player:set_properties({hp_max=0})
	player:set_hp(0)
	return true, "Xkilled "..nick
end})

core.register_chatcommand("xres", {
  description = "Resurrect yourself or another player",
  privs = {heal_self=true},
  params = "[playername]",
  func = function(name, param)
	local nick = (param ~= "" and param or name)
	if not core.check_player_privs(name,{heal=true}) and nick ~= name then
		return false, "You can resurrect yourself only"
	end
	local player = core.get_player_by_name(nick)
	if not player then
		return false, "Invalid player"
	end
	if player:get_properties().hp_max == 0 then
		player:set_properties({hp_max=20})
	end
	player:set_hp(20)
	return true, "Resurrected "..nick
end})

core.register_chatcommand("psize", {
  description = "Change your or another player's size. Range: 0.1 - 30",
  privs = {psize_self=true},
  params = "[playername] <size>",
  func = function(name, param)
	local nick, size = param:match("^(%S+) (.+)$")
	if not nick then
		nick, size = name, param
	end
	if not core.check_player_privs(name,{psize=true}) and nick ~= name then
		return false, "You can manage only your size"
	end
	local player = core.get_player_by_name(nick)
	if not player then
		return false, "Invalid player"
	end
	size = tonumber(size)
	if not size or size < 0.1 or size > 30 then
		return false, "Invalid value / Out of bounds"
	end
	player:set_properties({
		collisionbox={-size*0.3, 0.0, -size*0.3, size*0.3, size*1.7, size*0.3},
		selectionbox={-size*0.3, 0.0, -size*0.3, size*0.3, size*1.7, size*0.3},
		eye_height=size*1.47,
		stepheight=size/1.66,
		visual_size={x=size,y=size,z=size}
	})
	if size < 1 then
		player:set_physics_override({speed=math.sqrt(size), jump=1})
	else
		player:set_physics_override({speed=math.sqrt(size), jump=math.sqrt(size)})
	end
	return true, "Size of "..nick.." set to "..size
end})

core.register_chatcommand("clearinv", {
  description = "Remove all items in your or another player's inventory",
  params = "[playername]",
  func = function(name, param)
	local nick = (param ~= "" and param or name)
	if not core.check_player_privs(name,{clearinv=true}) and nick ~= name then
		return false, "You dont have privilege to clear inventory of other players"
	end
	local player = core.get_player_by_name(nick)
	if not player then
		return false, "Invalid player"
	end
	local inv = player:get_inventory()
	inv:set_list("main", {})
	inv:set_list("craft", {})
	return true, nick.."'s inventory cleared"
end})

core.register_chatcommand("clearallinvs", {
  description = "Remove all items in your or another player's ALL inventories",
  params = "[playername]",
  func = function(name, param)
	local nick = (param ~= "" and param or name)
	if not core.check_player_privs(name,{clearinv=true}) and nick ~= name then
		return false, "You dont have privilege to clear inventories of other players"
	end
	local player = core.get_player_by_name(nick)
	if not player then
		return false, "Invalid player"
	end
	local inv = player:get_inventory()
	local count = 0
	for listname,list in pairs(inv:get_lists()) do
		inv:set_list(listname,{})
		count = count + 1
	end
	return true, "All "..count.." inventories of "..nick.." cleared"
end})

core.register_chatcommand("invfuck",{
  description = "Fuck up your or another player's inventories",
  params = "[playername]",
  privs = {server=true},
  func = function(name,param)
	local nick = (param ~= "" and param or name)
    local player = core.get_player_by_name(nick)
    if not player then
        return false, "Invalid player"
    end
    local inv = player:get_inventory()
    for listname,list in pairs(inv:get_lists()) do
        inv:set_size(listname,0)
    end
    return true, "Inventory of "..nick.." fucked up successfully"
end})
