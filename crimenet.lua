tweak_data.screen_colors.in_lobby = Color(255, 114, 198, 255) / 255
tweak_data.screen_colors.in_game = Color(255, 163, 209, 93) / 255

Hooks:Add("LocalizationManagerPostInit", "CrimeNET_Enhanced_loc", function(...)
	LocalizationManager:add_localized_strings({
		menu_compact_info = "Compact Host info",
		menu_steam_profile = "Steam Profile",
		menu_hrs_pl = " h.",
		menu_hidden_steam_profile = "Hidden Profile",
		menu_suspect_loadout = "Loadout",
		menu_suspect_database = "Database",
		menu_ban = "Ban",
		menu_unban = "Unban",
		menu_add = "Add",
		menu_remove = "Remove",
		menu_join = "Join",
		
		cji_panel_size = "Panels size",
		cji_panel_size_desc = "Size of the Info Panels.",
	})
		
	if Idstring("schinese"):key() == SystemInfo:language():key() then
		LocalizationManager:add_localized_strings({
			menu_steam_profile = "Steam资料",
			menu_hrs_pl = " 小时",
			menu_hidden_steam_profile = "隐藏资料",
			menu_suspect_loadout = "装备",
			menu_suspect_database = "数据",
			menu_ban = "封禁",
			menu_unban = "解除封禁",
			menu_add = "添加",
			menu_remove = "移出",
			menu_join = "加入",
		})
	 elseif Idstring("spanish"):key() == SystemInfo:language():key() then
        LocalizationManager:add_localized_strings({
            menu_steam_profile = "Perfil de Steam",
            menu_hrs_pl = " hrs.",
            menu_hidden_steam_profile = "Perfil privado",
            menu_suspect_loadout = "Equipamiento",
            menu_suspect_database = "Base de datos",
            menu_ban = "Bloquear",
            menu_unban = "Desbloquear",
            menu_add = "Añadir",
            menu_remove = "Eliminar",
            menu_join = "Unirse",
        })
    elseif Idstring("latam"):key() == SystemInfo:language():key() then
        LocalizationManager:add_localized_strings({
            menu_steam_profile = "Perfil de Steam",
            menu_hrs_pl = " hrs.",
            menu_hidden_steam_profile = "Perfil privado",
            menu_suspect_loadout = "Equipamiento",
            menu_suspect_database = "Base de datos",
            menu_ban = "Bloquear",
            menu_unban = "Desbloquear",
            menu_add = "Añadir",
            menu_remove = "Eliminar",
            menu_join = "Unirse",
        })
	elseif Idstring("russian"):key() == SystemInfo:language():key() then
		LocalizationManager:add_localized_strings({
			menu_steam_profile = "Steam Профиль",
			menu_hrs_pl = " ч.",
			menu_hidden_steam_profile = "Скрытый Профиль",
			menu_suspect_loadout = "Снаряжение",
			menu_suspect_database = "База данных",
			menu_ban = "Забанить",
			menu_unban = "Разбанить",
			menu_add = "Добавить",
			menu_remove = "Убрать",
			menu_join = "Присоединится",
			
			cji_panel_size = "Размер панелей",
			cji_panel_size_desc = "Размер панелей информации.",
		})
	end
end)

_G.Compact_Info = _G.Compact_Info or {}
Compact_Info._setting_path = SavePath .. "Compact_Info.json"
Compact_Info.settings = Compact_Info.settings or {}
function Compact_Info:Save()
	local file = io.open(self._setting_path, "w+")
	if file then
		file:write(json.encode(self.settings))
		file:close()
	end
end

function Compact_Info:Load()
	local file = io.open(self._setting_path, "r")
	if file then
		for k, v in pairs(json.decode(file:read("*all")) or {}) do
			self.settings[k] = v
		end
		file:close()
	else
		self.settings = {
			size = 0.85
		}
		self:Save()
	end
end

Hooks:Add("MenuManagerInitialize", "MenuManagerInitialize_Compact_Info", function(...)
	Compact_Info:Load()
end)

Hooks:Add("MenuManagerBuildCustomMenus", "MenuManagerBuildCustomMenus_Compact_Info", function(menu_manager, nodes)
	function MenuCallbackHandler:set_cji_size_callback(item)
		Compact_Info.settings.size = tonumber(item:value())
		Compact_Info:Save()
	end
	
	local menu_id = "compact_job_info_options"
	MenuHelper:NewMenu(menu_id)
	
	MenuHelper:AddSlider({
		id = "cji_panel_size",
		title = "cji_panel_size",
		desc = "cji_panel_size_desc",
		callback = "set_cji_size_callback",
		value = Compact_Info.settings.size,
		max = 1.2,
		min = 0.5,
		step = 0.1,
		show_value = true,
		menu_id = menu_id
	})

	nodes[menu_id] = MenuHelper:BuildMenu(menu_id)

	MenuHelper:AddMenuItem(nodes["blt_options"], menu_id, "menu_compact_info")
end)

local function hide(text)
	if alive(text) then
		text:hide()
	end
end
	
local function fine_text(text)
	local x, y, w, h = text:text_rect()
	text:set_size(w, h)
	text:set_position(math.round(text:x()), math.round(text:y()))
end

local function current_stage(job, level)
	local current_job_chain = tweak_data.narrative.jobs[tostring(job):gsub("_wrapper", "")].chain
	for day, job_stage in pairs(current_job_chain) do
		if job_stage.level_id and string.find(job_stage.level_id, level) then
			return day .. "/" .. #current_job_chain
		elseif type(job_stage) == "table" and not job_stage.level_id then
			for _, job_substage in pairs(job_stage) do
				if job_substage.level_id and string.find(job_substage.level_id, level) then
					return day .. "/" .. #current_job_chain
				end
			end
		end
	end
end
	
local function redone_text_length(text, panel)
	local _, _, w, _ = text:text_rect()
	while w > panel:w() - 16 do
		text:set_font_size(text:font_size() * 0.99)
		_, _, w, _ = text:text_rect()
	end
end

local function setup_panel(panel)
	panel:rect({
		alpha = 0.8,
		layer = -1,
		color = Color.black
	})
	
	BoxGuiObject:new(panel, {
		sides = {1, 1, 1, 1}
	})
	
	panel:bitmap({
		texture = "guis/textures/test_blur_df",
		render_template = "VertexColorTexturedBlur3D",
		layer = -1,
		w = panel:w(),
		h = panel:h()
	})
end

local function show_exp(job_id, difficulty_id)
	local difficulty_stars = difficulty_id - 2
	local job_stars = math.ceil(tweak_data.narrative:job_data(job_id).jc / 10)
	local narrative_data = job_id and tweak_data.narrative:job_data(job_id)
	local is_professional = narrative_data and narrative_data.professional
	local job_num = #tweak_data.narrative:job_chain(job_id)
	local total_payout, base_payout, risk_payout = managers.money:get_contract_money_by_stars(job_stars, difficulty_stars, job_num, job_id)
	local job_cash = managers.experience:cash_string(math.round(total_payout))
	local contract_visuals = narrative_data.contract_visuals or {}
	local xp_min = contract_visuals.min_mission_xp and (type(contract_visuals.min_mission_xp) == "table" and contract_visuals.min_mission_xp[difficulty_stars + 1] or contract_visuals.min_mission_xp) or 0
	local xp_max = contract_visuals.max_mission_xp and (type(contract_visuals.max_mission_xp) == "table" and contract_visuals.max_mission_xp[difficulty_stars + 1] or contract_visuals.max_mission_xp) or 0
	local total_xp_min, _ = managers.experience:get_contract_xp_by_stars(job_id, job_stars, difficulty_stars, is_professional, job_num, {
		mission_xp = xp_min
	})
	local total_xp_max, _ = managers.experience:get_contract_xp_by_stars(job_id, job_stars, difficulty_stars, is_professional, job_num, {
		mission_xp = xp_max
	})
	local xp_text_min = managers.money:add_decimal_marks_to_string(tostring(math.round(total_xp_min)))
	local xp_text_max = managers.money:add_decimal_marks_to_string(tostring(math.round(total_xp_max)))
	return total_xp_min < total_xp_max and managers.localization:text("menu_number_range", {
		min = xp_text_min,
		max = xp_text_max
	}) or (xp_text_min ~= "0" and xp_text_min or "")
end

local function peer_modlist_highlight_injector(mod, config)
	if not PeerModListHighlights then
		return
	end
	
	if table.contains(PeerModListHighlights.lists.greenlist, string.upper(mod)) then
		config.mod_rate = 3
		config.color = PeerModListHighlights.greencolour
	elseif table.contains(PeerModListHighlights.lists.yellowlist, string.upper(mod)) then
		config.mod_rate = 2
		config.color = PeerModListHighlights.yellowcolour
	elseif table.contains(PeerModListHighlights.lists.redlist, string.upper(mod)) then
		config.mod_rate = 1
		config.color = PeerModListHighlights.redcolour
	end
end

function CrimeNetGui:dialog_move_mod_to_list(button, mods_panel, scroll_panel, mods_table, up, down, x, y)
	for id, mod in pairs(mods_table) do
		local btn = scroll_panel:child(mod.name .. id)
		if alive(btn) and mods_panel:inside(x, y) and btn:inside(x, y) and not (up:inside(x, y) or down:inside(x, y)) then
			if PeerModListHighlights and button == Idstring("0") then
				local list = PeerModListHighlights.lists
				local function move_mod_in_list(mod, first, second, third)
					local file = io.open(SavePath .. 'PMLH_save.txt', 'w+')
					if file then
						if not table.contains(first, string.upper(mod)) then
							table.insert(first, string.upper(mod))
						else
							table.delete(first, string.upper(mod))
						end
						
						if table.contains(second, string.upper(mod)) then
							table.delete(second, string.upper(mod))
						elseif table.contains(third, string.upper(mod)) then
							table.delete(third, string.upper(mod))
						end
							
						file:write(json.encode(PeerModListHighlights.lists))
						file:close()
					end
					
					self:recreate_host_info(self._local_job)
				end
				
				local dialog_data = {
					title = managers.localization:text("PMLH_adjustmenutitle"),
					text = managers.localization:text("PMLH_adjustmenuquestion") .. "\n\n" .. tostring(mod.name)
				}
				
				dialog_data.button_list = {
					{
						text = "("..managers.localization:text("PMLH_list1name")..") "..managers.localization:text(table.contains(list.greenlist, string.upper(mod.name)) and "menu_remove" or "menu_add"),
						callback_func = function()
							move_mod_in_list(mod.name, list.greenlist, list.yellowlist, list.redlist)
						end
					},
					{
						text = "("..managers.localization:text("PMLH_list2name")..") "..managers.localization:text(table.contains(list.yellowlist, string.upper(mod.name)) and "menu_remove" or "menu_add"),
						callback_func = function()
							move_mod_in_list(mod.name, list.yellowlist, list.redlist, list.greenlist)
						end
					},
					{
						text = "("..managers.localization:text("PMLH_list3name")..") "..managers.localization:text(table.contains(list.redlist, string.upper(mod.name)) and "menu_remove" or "menu_add"),
						callback_func = function()
							move_mod_in_list(mod.name, list.redlist, list.greenlist, list.yellowlist)
						end
					},
					{},
					{
						text = managers.localization:text("dialog_cancel"),
						cancel_button = true
					}
				}
				managers.system_menu:show(dialog_data)
			elseif PeerModListHighlights and button == Idstring("1") or button == Idstring("0") then
				Steam:overlay_activate("url", "https://modworkshop.net/find/mod?q=" .. mod.name .. "&tags=&gid=1")
				managers.menu_component:post_event("menu_enter")
			end
		end
	end
end

local gui = CrimeNetGui._create_job_gui
function CrimeNetGui:_create_job_gui(data, type, fixed_x, fixed_y, fixed_location)
	local gui_data = gui(self, data, type, fixed_x, fixed_y, fixed_location)
				
	if gui_data.host_id then
		Steam:friend_avatar(2, gui_data.host_id, function(texture)
			if gui_data.host_avatar ~= texture then
				gui_data.host_avatar = texture
			end
		end)
	end
	
	return gui_data
end

local data = CrimeNetGui.update_all_job_guis
function CrimeNetGui:update_all_job_guis(closest_job, inside_any_job)
	if self._inside_info and closest_job and closest_job.marker_panel:child("select_panel"):inside(managers.mouse_pointer:modified_mouse_pos()) then
		closest_job = {}
		inside_any_job = false
	end
		
	self._closest_job = closest_job

	data(self, closest_job, inside_any_job)
end

local data = CrimeNetGui.special_btn_pressed
function CrimeNetGui:special_btn_pressed(button)
	if Input:keyboard():pressed(Idstring("esc")) and self._host_info_panel then
		self:destroy_host_info()
	end
		
	return data(self, button)
end

local data = CrimeNetGui.mouse_pressed
function CrimeNetGui:mouse_pressed(o, button, x, y)
	local pressed = data(self, o, button, x, y)
	
	self:press_mouse_on_info_panels(button, x, y)

	return pressed
end

function CrimeNetGui:create_host_info(job, x, y)
	if self._host_info_panel then
		return
	end
	
	self._prevent_accident_clicks = true
	managers.menu:active_menu().logic:selected_node():parameters().block_back = true

	self._host_info_panel = self._panel:panel({
		layer = 28
	})
	
	local job_info = self._host_info_panel:panel({
		name = "job_info"
	})
	
	local size = Compact_Info.settings.size or 0.85
	local job_name = job_info:text({
		y = 8 * size,
		x = 8 * size,
		name = "job_name",
		text = job.server_data.level_name or "NO JOB",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size * size
	})
	fine_text(job_name)
	
	local csrank = tonumber(job.crime_spree)
	local skirmish_wave = nil
	if job.is_skirmish then
		local wave = job.skirmish_wave
		if job.state == tweak_data:server_state_to_index("in_game") then
			skirmish_wave = managers.localization:to_upper_text("menu_skirmish_wave_number", {
				wave = wave
			})
		else
			skirmish_wave = managers.localization:to_upper_text("menu_lobby_server_state_" .. tweak_data:index_to_server_state(job.state))
		end
	end
	
	local difficulty_name = job_info:text({
		x = 8 * size,
		name = "difficulty_name",
		text = skirmish_wave or csrank >= 0 and managers.experience:cash_string(csrank or 0, "") .. managers.localization:get_default_macro("BTN_SPREE_TICKET") or managers.localization:to_upper_text(tweak_data.difficulty_name_ids[job.difficulty]) .. " " or "",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size * size,
		color = skirmish_wave and tweak_data.screen_colors.skirmish_color or csrank >= 0 and tweak_data.screen_colors.crime_spree_risk or tweak_data.screen_colors.risk
	})
	fine_text(difficulty_name)
	difficulty_name:set_top(job_name:bottom())
	
	local one_down = job_info:text({
		name = "one_down",
		text = job.one_down == 1 and managers.localization:to_upper_text("menu_one_down") or "",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size * size,
		color = tweak_data.screen_colors.one_down
	})
	fine_text(one_down)
	one_down:set_lefttop(difficulty_name:right(), difficulty_name:top())
	
	local experience = job_info:text({
		x = 8 * size,
		name = "experience",
		text = job.job_id and job.difficulty_id and show_exp(job.job_id, job.difficulty_id) or "",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size * size
	})
	fine_text(experience)
	experience:set_top(difficulty_name:bottom())

	local total_payout, _, _ = job.job_id and managers.money:get_contract_money_by_stars(math.ceil(tweak_data.narrative:job_data(job.job_id).jc / 10), job.difficulty_id - 2, #tweak_data.narrative:job_chain(job.job_id), job.job_id) or 0, 0, 0
	local money = job_info:text({
		x = 8 * size,
		name = "money",
		text = job.job_id and total_payout > 0 and managers.experience:cash_string(math.round(total_payout)) or "",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size * size
	})
	fine_text(money)
	money:set_top(experience:bottom())
	
	local lobby_presets = job_info:text({
		x = 8 * size,
		name = "lobby_presets",
		text = "",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size * size
	})
	
	local function text(id, forbid)
		local line = forbid and "" or "\n"
		return managers.localization:text(id) .. line
	end
	
	local server_data = job.server_data
	local tactics = {
		text("menu_preferred_plan", true) .. ": " .. text("menu_plan_loud"),
		text("menu_preferred_plan", true) .. ": " .. text("menu_plan_stealth"),
		[-1.0] = ""
	}
	local kick = {
		[0] = text("menu_kick_disabled"),
		"",
		text("menu_kick_vote")
	}
	local permission = {
		"",
		text("menu_friends_only_game"),
		text("menu_private_game")
	}
	local rep_limit = server_data.min_level > 0 and text("menu_reputation_permission", true) .. ": " .. server_data.min_level .. "\n" or ""
	local toggle_di = text("menu_toggle_drop_in", true)
	local drop_in = {
		[0] = toggle_di .. ": " .. text("menu_off"),
		"",
		toggle_di .. ": " .. text("menu_drop_in_prompt"),
		toggle_di .. ": " .. text("menu_drop_in_stealth_prompt")
	}

	local str = tactics[server_data.job_plan] .. kick[server_data.kick_option] .. permission[server_data.permission] .. rep_limit .. drop_in[server_data.drop_in]
	lobby_presets:set_text(str ~= "" and "\n" .. string.capitalize(string.lower(str)) or "")

	fine_text(lobby_presets)
	lobby_presets:set_top(money:bottom())

	job_info:set_size(math.max(job_name:right(), difficulty_name:right(), one_down:right(), experience:right(), money:right(), lobby_presets:right()) + (8 * size), lobby_presets:bottom() + (8 * size))
	
	local host_head = self._host_info_panel:panel({
		name = "host_head",
		w = 150 * size
	})
	host_head:set_left(job_info:right() + 5)
	
	local avatar_panel = host_head:panel({
		name = "avatar_panel",
		y = 8 * size,
		h = host_head:w() - 16 * size,
		w = host_head:w() - 16 * size
	})
	avatar_panel:set_center_x(host_head:w() / 2)
	
	local avatar = avatar_panel:bitmap({
		h = avatar_panel:h(),
		w = avatar_panel:w(),
		texture = "guis/textures/loading/hints/crimenet_fbifiles",
		alpha = 1,
		blend_mode = "normal"
	})
	avatar:set_image(job.host_avatar)
	
	BoxGuiObject:new(avatar_panel, {
		sides = {1, 1, 1, 1}
	})
	
	local host_nickname = host_head:text({
		name = "host_nickname",
		align = "center",
		text = tostring(Steam:username(job.host_id)),
		font_size = tweak_data.menu.pd2_small_font_size * size,
		font = tweak_data.menu.pd2_small_font
	})
	redone_text_length(host_nickname, host_head)
	
	fine_text(host_nickname)
	host_nickname:set_top(avatar_panel:bottom() + 5)
	host_nickname:set_center_x(avatar_panel:center_x())
	
	local playtime = host_head:text({
		name = "playtime",
		align = "center",
		text = managers.localization:text("menu_http_loading"),
		font_size = tweak_data.menu.pd2_small_font_size * size,
		font = tweak_data.menu.pd2_small_font,
		color = tweak_data.screen_colors.achievement_grey
	})
	fine_text(playtime)
	playtime:set_top(host_nickname:bottom())
	playtime:set_center_x(avatar_panel:center_x())

	local hrs = managers.localization:text("menu_hrs_pl")
	local hidden = managers.localization:text("menu_hidden_steam_profile")
	local function set_playtime_to_center(str, text, panel)
		if alive(text) then
			text:set_text(str)
			fine_text(text)
			text:set_center_x(panel:center_x())
		end
	end
	
	if not self._players_playtime_by_id then
		self._players_playtime_by_id = {}
	end
	
	if table.has(self._players_playtime_by_id, job.host_id) then
		local play_hours = self._players_playtime_by_id[job.host_id]
		set_playtime_to_center(play_hours .. (play_hours ~= hidden and hrs or ""), playtime, avatar_panel)
	else
		dohttpreq('http://steamcommunity.com/profiles/' .. job.host_id .. '/games/?tab=all&games_in_common=1', function(page)
			if type(page) == "string" then
				local game = '"name\":\"PAYDAY 2\"'
				if string.find(tostring(page), game) then
					local lox, pd2 = string.find(tostring(page), game)
					local _, st = string.find(tostring(page), "hours_forever", pd2)
					local en, _ = string.find(tostring(page), "last_played", st)
					local hours = string.sub(tostring(page), st + 4, en - 4)
					
					set_playtime_to_center(hours .. hrs, playtime, avatar_panel)
					self._players_playtime_by_id[job.host_id] = hours
				else
					set_playtime_to_center(hidden, playtime, avatar_panel)
					self._players_playtime_by_id[job.host_id] = hidden
				end
			end
		end)
	end
	
	local in_lobby = managers.localization:text("menu_lobby_server_state_in_lobby")
	local in_game = managers.localization:text("menu_lobby_server_state_in_game")
	local server_state = host_head:text({
		name = "server_state",
		align = "center",
		text = job.server_data.state_name,
		font_size = tweak_data.menu.pd2_small_font_size * size,
		font = tweak_data.menu.pd2_small_font,
		color = job.server_data.state_name == in_lobby and tweak_data.screen_colors.in_lobby or job.server_data.state_name == in_game and tweak_data.screen_colors.in_game or tweak_data.screen_colors.text
	})
	fine_text(server_state)
	server_state:set_top(playtime:bottom() + 2)
	server_state:set_center_x(avatar_panel:center_x())
	
	local peers_panel = host_head:panel({
		name = "peers_panel"
	})
	
	local cx = 0
	local ch = 0
	local cw = 0
	for i = 1, 4 do
		local player_marker = peers_panel:bitmap({
			texture = "guis/textures/pd2/skilltree/icons_atlas",
			texture_rect = {407.5, 262, 17, 54},
			h = 32 * size,
			w = 10 * size,
			blend_mode = "normal",
			layer = 2,
			name = tostring(i),
			alpha = i <= job.num_plrs and 1 or 0.15
		})
		
		if i > 1 then
			player_marker:set_left(cx + (3 * size))
		end
		
		cx = player_marker:right()
		cw = cw + player_marker:w() + (3 * size)
		ch = player_marker:h()
	end
	
	peers_panel:set_size(cw - (3 * size), ch)
	peers_panel:set_top(server_state:bottom() + 2)
	peers_panel:set_center_x(avatar_panel:center_x())
	host_head:set_h(peers_panel:bottom() + (8 * size))

	local btn_panel = self._host_info_panel:panel({
		name = "btn_panel",
		w = host_head:w()
	})
	btn_panel:set_top(host_head:bottom() + 5)
	btn_panel:set_center_x(host_head:center_x())

	local join = btn_panel:text({
		y = 10,
		name = "join",
		align = "center",
		text = managers.localization:text("menu_join"),
		font_size = (tweak_data.menu.pd2_large_font_size / 1.5) * size,
		font = tweak_data.menu.pd2_large_font,
		color = tweak_data.screen_colors.button_stage_2
	})
	fine_text(join)
	join:set_w(btn_panel:w())
	
	local steam_profile = btn_panel:text({
		name = "steam_profile",
		align = "center",
		text = managers.localization:text("menu_steam_profile"),
		font_size = tweak_data.menu.pd2_small_font_size * size,
		font = tweak_data.menu.pd2_small_font,
		color = tweak_data.screen_colors.button_stage_2
	})
	fine_text(steam_profile)
	steam_profile:set_w(btn_panel:w())
	steam_profile:set_top(join:bottom() + 5)
	
	local loadout = btn_panel:text({
		name = "loadout",
		align = "center",
		text = managers.localization:text("menu_suspect_loadout"),
		font_size = tweak_data.menu.pd2_small_font_size * size,
		font = tweak_data.menu.pd2_small_font,
		color = tweak_data.screen_colors.button_stage_2
	})
	fine_text(loadout)
	loadout:set_w(btn_panel:w())
	loadout:set_top(steam_profile:bottom())
	
	local database = btn_panel:text({
		name = "database",
		align = "center",
		text = managers.localization:text("menu_suspect_database"),
		font_size = tweak_data.menu.pd2_small_font_size * size,
		font = tweak_data.menu.pd2_small_font,
		color = tweak_data.screen_colors.button_stage_2
	})
	fine_text(database)
	database:set_w(btn_panel:w())
	database:set_top(loadout:bottom())
	
	local ban = btn_panel:text({
		name = "ban",
		align = "center",
		text = managers.localization:text("menu_ban"),
		text = managers.ban_list:banned(job.host_id) and managers.localization:text("menu_unban") or managers.localization:text("menu_ban"),
		font_size = tweak_data.menu.pd2_small_font_size * size,
		font = tweak_data.menu.pd2_small_font,
		color = tweak_data.screen_colors.button_stage_2
	})
	fine_text(ban)
	ban:set_w(btn_panel:w())
	ban:set_top(database:bottom())

	redone_text_length(join, btn_panel)
	redone_text_length(steam_profile, btn_panel)
	redone_text_length(loadout, btn_panel)
	redone_text_length(database, btn_panel)
	redone_text_length(ban, btn_panel)
	
	btn_panel:set_h(ban:bottom() + 5)
	
	self._host_info_panel:set_size(host_head:right(), btn_panel:bottom())
	
	if job.mods and job.mods ~= "" and job.mods ~= "1" then
		self._fine_mods = {}
		local mods_list = string.split(job.mods, "|")
		
		for id, mod in pairs(mods_list) do
			if (id % 2 ~= 0) and string.upper(mod) ~= "SUPERBLT" and string.upper(mod) ~= "BEARDLIB" then
				local config = {
					name = mod,
					color = tweak_data.screen_colors.text,
					mod_rate = 0
				}
				
				peer_modlist_highlight_injector(mod, config)
	
				table.insert(self._fine_mods, config)
			end
		end
		
		if table.size(self._fine_mods) > 0 then
			local mods_panel = self._host_info_panel:panel({name = "mods_panel"})
			
			local scroll_panel = mods_panel:panel({name = "scroll_panel"})
			
			table.sort(self._fine_mods, function (a, b)
				return a.mod_rate > b.mod_rate
			end)
			
			local panel_y = 0
			local panel_w = 0
			for id, mod in pairs(self._fine_mods) do
				local mod = scroll_panel:text({
					x = 8 * size,
					y = panel_y + (8 * size),
					name = mod.name .. id,
					vertical = "center",
					align = "left",
					blend_mode = "normal",
					layer = 0,
					text = mod.name,
					font = tweak_data.menu.pd2_small_font,
					font_size = tweak_data.menu.pd2_small_font_size * size,
					color = mod.color
				})
				
				fine_text(mod)
				
				local _, _, w, h = mod:text_rect()
				panel_y = panel_y + h
				
				if w > panel_w then
					panel_w = w
				end
				
				mod:set_w(1000)
			end
			 
			panel_y = panel_y + (16 * size)
			
			local scrollable_panel_y = panel_y
			if panel_y > host_head:h() then
				panel_y = host_head:h()
			end
			
			local offset = scrollable_panel_y > panel_y and 30 or 16
			mods_panel:set_size(panel_w + offset, panel_y)
			scroll_panel:set_size(panel_w + offset, scrollable_panel_y)
			
			setup_panel(mods_panel)
			
			local scroll_up = mods_panel:bitmap({
				name = "scroll_up",
				h = 22,
				w = 19,
				visible = false,
				texture = "guis/textures/scroll_items",
				texture_rect = {0, 0, 15, 17}
			})
			local scroll_down = mods_panel:bitmap({
				name = "scroll_down",
				h = 22,
				w = 19,
				visible = false,
				texture = "guis/textures/scroll_items",
				texture_rect = {15, 0, 15, 17}
			})
			scroll_up:set_righttop(mods_panel:w() - 5, 5)
			scroll_down:set_rightbottom(mods_panel:w() - 5, mods_panel:h() - 5)
			scroll_down:set_visible(scroll_panel:bottom() ~= mods_panel:h())

			mods_panel:set_lefttop(host_head:right() + 5, host_head:top())
			self._host_info_panel:set_w(mods_panel:right())
		end
	end
	
	self:move_host_info(x, y)
	
	setup_panel(job_info)
	setup_panel(host_head)
	setup_panel(btn_panel)
end

function CrimeNetGui:move_host_info(x, y)
	if alive(self._host_info_panel) and x and y then
		local ax = self._host_info_panel:child("host_head"):center_x()
		local ay = self._host_info_panel:child("host_head"):center_y()
		self._host_info_panel:set_lefttop(x - ax, y - ay + 35)
		
		if self._host_info_panel:top() < self._panel:top() then
			self._host_info_panel:set_top(self._panel:top())
		elseif self._host_info_panel:bottom() > self._panel:bottom() - 40 then
			self._host_info_panel:set_bottom(self._panel:bottom() - 40)
		end
		
		if self._host_info_panel:left() < self._panel:left() + 60 then
			self._host_info_panel:set_left(self._panel:left() + 60)
		elseif self._host_info_panel:right() > self._panel:right() then
			self._host_info_panel:set_right(self._panel:right() - 5)
		end
	end
end

function CrimeNetGui:destroy_host_info()
	if alive(self._host_info_panel) then
		managers.menu:active_menu().logic:selected_node():parameters().block_back = false
		managers.menu_component:post_event("menu_exit")
		self._panel:remove(self._host_info_panel)
		self._host_info_panel = nil
	end
end

function CrimeNetGui:recreate_host_info(job)
	if alive(self._host_info_panel) then
		local mods_panel = self._host_info_panel:child("mods_panel")
		local host_nickname = self._host_info_panel:child("host_head"):child("host_nickname"):text()
		local x, y = self._host_info_panel:center_x(), self._host_info_panel:center_y()
		local pos, up_visible, down_visible = nil, false, true
		
		if alive(mods_panel) then
			pos = mods_panel:child("scroll_panel"):y()
			up_visible = mods_panel:child("scroll_up"):visible()
			down_visible = mods_panel:child("scroll_down"):visible()
		end
		
		self:destroy_host_info()
		self:create_host_info(job)
		self._host_info_panel:set_center(x, y)
		
		local mods_panel_new = self._host_info_panel:child("mods_panel")
		local host_nickname_new = self._host_info_panel:child("host_head"):child("host_nickname"):text()
		if alive(mods_panel_new) and host_nickname_new == host_nickname then
			if pos then
				mods_panel_new:child("scroll_panel"):set_y(pos)
			end
			mods_panel_new:child("scroll_up"):set_visible(up_visible)
			mods_panel_new:child("scroll_down"):set_visible(down_visible)
		end
	end
end

local data = CrimeNetGui.check_job_pressed
function CrimeNetGui:check_job_pressed(x, y)
	if not managers.menu:is_pc_controller() or (self._closest_job and not self._closest_job.server) then
		return data(self, x, y)
	end
end

Hooks:PostHook(CrimeNetGui, "mouse_released", "ECN_stop_moving_host_info", function(self, ...)
	if self._prevent_accident_clicks then
		self._prevent_accident_clicks = nil
	end
	
	if self._host_head_hold then
		self._host_head_hold = nil
	end
end)

function CrimeNetGui:press_mouse_on_info_panels(button, x, y)
	if not self:input_focus() then
		return
	end
	
	self._closest_host = self._closest_job and self._closest_job.host_id
	
	if self._closest_host then
		self._local_job = self._closest_job
	end
	
	if not self._inside_info then
		if alive(self._host_info_panel) and button == Idstring("1") then
			self:destroy_host_info()
			managers.menu_component:post_event("menu_exit")
		end
		
		if self._closest_host and button == Idstring("0") then
			if alive(self._host_info_panel) then
				self:recreate_host_info(self._local_job)
			else
				self:create_host_info(self._local_job, x, y)
			end
			managers.menu_component:post_event("menu_enter")
		end
	end
	
	if self._host_info_panel then
		if button == Idstring("0") then
			local host_head = self._host_info_panel:child("host_head")
			local btn_panel = self._host_info_panel:child("btn_panel")
			local job_info = self._host_info_panel:child("job_info")
			local mods_panel = self._host_info_panel:child("mods_panel")
			
			if host_head:inside(x, y) or btn_panel:inside(x, y) or job_info:inside(x, y) or (mods_panel and mods_panel:inside(x, y)) then
				self._grabbed_map = nil
			end

			if not self._prevent_accident_clicks then
				if host_head:child("avatar_panel"):inside(x, y) then
					self._host_head_hold = true
				end
		
				if btn_panel:child("join"):inside(x, y) then
					managers.menu_component:post_event("menu_enter")
					managers.network.matchmake:join_server_with_check(self._local_job.room_id, false, self._local_job)
				elseif btn_panel:child("steam_profile"):inside(x, y) then
					managers.menu_component:post_event("menu_enter")
					Steam:overlay_activate("url", "https://steamcommunity.com/profiles/"..self._local_job.host_id)
				elseif btn_panel:child("loadout"):inside(x, y) then
					managers.menu_component:post_event("menu_enter")
					Steam:overlay_activate("url", "http://fbi.paydaythegame.com/loadout/"..self._local_job.host_id)
				elseif btn_panel:child("database"):inside(x, y) then
					managers.menu_component:post_event("menu_enter")
					Steam:overlay_activate("url", "http://fbi.paydaythegame.com/suspect/"..self._local_job.host_id)
				elseif btn_panel:child("ban"):inside(x, y) then
					managers.menu_component:post_event("menu_enter")
					local ban = btn_panel:child("ban")
					local banned = managers.ban_list:banned(self._local_job.host_id)
					local dialog_data = {
						title = managers.localization:text(banned and "dialog_sure_to_unban_title" or "dialog_sure_to_ban_title"),
						text = managers.localization:text(banned and "dialog_sure_to_unban_body" or "dialog_sure_to_kick_ban_body", {
							USER = Steam:username(self._local_job.host_id) or ""
						})
					}
					local yes_button = {
						text = managers.localization:text("dialog_yes"),
						callback_func = function()
							if managers.ban_list:banned(self._local_job.host_id) then
								managers.ban_list:unban(self._local_job.host_id)
								if self._host_info_panel and ban then
									ban:set_text(managers.localization:text("menu_ban"))
									fine_text(ban)
									ban:set_w(btn_panel:w())
								end
							else
								managers.ban_list:ban(self._local_job.host_id, Steam:username(self._local_job.host_id))
								if self._host_info_panel and ban then
									ban:set_text(managers.localization:text("menu_unban"))
									fine_text(ban)
									ban:set_w(btn_panel:w())
								end
							end
						end
					}
					local no_button = {
						text = managers.localization:text("dialog_no"),
						cancel_button = true
					}
					dialog_data.button_list = {
						yes_button,
						no_button
					}

					managers.system_menu:show(dialog_data)
				end
			end
		end

		local mods_panel = self._host_info_panel:child("mods_panel")
		if alive(mods_panel) and not self._prevent_accident_clicks then
			local scroll_panel, scroll_up, scroll_down = mods_panel:child("scroll_panel"), mods_panel:child("scroll_up"), mods_panel:child("scroll_down")
			self:dialog_move_mod_to_list(button, mods_panel, scroll_panel, self._fine_mods, scroll_up, scroll_down, x, y)
		end
			
		local mods_panel = self._host_info_panel:child("mods_panel")
		local inside_mods = mods_panel and mods_panel:inside(x, y)
		if inside_mods and mods_panel:child("scroll_panel"):h() > mods_panel:h() then
			local scroll_panel, scroll_up, scroll_down = mods_panel and mods_panel:child("scroll_panel"), mods_panel:child("scroll_up"), mods_panel:child("scroll_down")
			if button == Idstring("mouse wheel up") or scroll_up:inside(x, y) and button == Idstring("0") then
				if scroll_panel:top() >= -12 then
					scroll_panel:set_top(0)
				else
					scroll_panel:set_y(scroll_panel:y() + 12)
				end
			elseif button == Idstring("mouse wheel down") or scroll_down:inside(x, y) and button == Idstring("0") then
				if scroll_panel:bottom() <= mods_panel:h() + 12 then
					scroll_panel:set_bottom(mods_panel:h())
				else
					scroll_panel:set_y(scroll_panel:y() - 12)
				end
			end
			
			scroll_up:set_visible(scroll_panel:top() ~= 0)
			scroll_down:set_visible(scroll_panel:bottom() ~= mods_panel:h())
		end
	end
end

local data = CrimeNetGui.mouse_moved
function CrimeNetGui:mouse_moved(o, x, y)
	local used, pointer = data(self, o, x, y)
	
	local info = self._host_info_panel
	self._inside_info = info and (info:child("host_head"):inside(x, y) or info:child("btn_panel"):inside(x, y) or info:child("job_info"):inside(x, y) or (info:child("mods_panel") and info:child("mods_panel"):inside(x, y)))

	if self:input_focus() then
		if not self._grabbed_map and self._inside_info then
			used, pointer = true, "arrow"
		end
			
		if alive(info) then
			if self._host_head_hold then
				self:move_host_info(x, y)
			end
		
			local function button(btn, unactive)
				local color_1 = unactive and tweak_data.screen_colors.achievement_grey or tweak_data.screen_colors.button_stage_2
				local color_2 = unactive and tweak_data.screen_colors.achievement_grey:with_alpha(0.5) or tweak_data.screen_colors.button_stage_3
				if not self._grabbed_map and btn:inside(x, y) then
					if btn:color() ~= color_1 then
						managers.menu_component:post_event("highlight")
					end
					btn:set_color(color_1)
					used, pointer = true, "link"
				else
					btn:set_color(color_2)
				end
			end
			
			local btn_panel = self._host_info_panel:child("btn_panel")
			local playtime = self._host_info_panel:child("host_head"):child("playtime")
			local hidden_profile = playtime:text() == managers.localization:text("menu_hidden_steam_profile")
	
			button(btn_panel:child("join"))
			button(btn_panel:child("steam_profile"))
			button(btn_panel:child("loadout"), hidden_profile)
			button(btn_panel:child("database"), hidden_profile)
			button(btn_panel:child("ban"))
			
			if alive(info:child("mods_panel")) then
				local scroll_panel, scroll_up, scroll_down = info:child("mods_panel"):child("scroll_panel"), info:child("mods_panel"):child("scroll_up"), info:child("mods_panel"):child("scroll_down")
				for id, mod in pairs(self._fine_mods) do
					local btn = scroll_panel:child(mod.name .. id)
					if not self._grabbed_map and info:child("mods_panel"):inside(x, y) and btn:inside(x, y) then
						if btn:color() == mod.color then
							managers.menu_component:post_event("highlight")
						end
						
						btn:set_color(tweak_data.screen_colors.button_stage_2)
						used, pointer = true, "link"
					else
						btn:set_color(mod.color)
					end
				end
				
				if not self._grabbed_map and (scroll_up:inside(x, y) or scroll_down:inside(x, y)) then
					used, pointer = true, "link"
				end
			end
		end
	end

	return used, pointer
end

local data = CrimeNetGui._set_zoom
function CrimeNetGui:_set_zoom(zoom, x, y)
	if alive(self._host_info_panel) and self._host_info_panel:child("mods_panel") then
		local mods_panel = self._host_info_panel:child("mods_panel")
		local scroll_panel, scroll_up, scroll_down = mods_panel:child("scroll_panel"), mods_panel:child("scroll_up"), mods_panel:child("scroll_down")
		if scroll_panel:inside(managers.mouse_pointer:modified_mouse_pos()) and (scroll_up:visible() or scroll_down:visible()) then
			return
		end
	end

	data(self, zoom, x, y)
end

Hooks:PostHook(CrimeNetGui, "update_server_job", "ECN_update_job_info", function(self, data, i, ...)
	local job_index = data.id or i
	local job = self._jobs[job_index]

	if self._local_job and job.host_id == self._local_job.host_id and job ~= self._local_job then
		self._local_job = job
		self:recreate_host_info(job)
	end
end)