tweak_data.screen_colors.in_lobby = Color(255, 114, 198, 255) / 255
tweak_data.screen_colors.in_game = Color(255, 163, 209, 93) / 255

Hooks:Add("LocalizationManagerPostInit", "CrimeNET_Enhanced_loc", function(...)
	LocalizationManager:add_localized_strings({
		menu_compact_info = "Compact Host info",
		menu_steam_profile = "Steam Profile",
		menu_epic_profile = "Epic Games Profile",
		menu_hrs_pl = " h.",
		menu_hidden_steam_profile = "Private Profile",
		menu_hours_hidden = "Game Info is Hidden",
		menu_epic_no_profiles = "Epic Games Account",
		menu_suspect_loadout = "Loadout",
		menu_suspect_database = "Database",
		menu_ban = "Ban",
		menu_unban = "Unban",
		menu_add = "Add",
		menu_remove = "Remove",
		menu_join = "Join",
		cji_panel_size = "Panels size",
		cji_panel_size_desc = "Size of the Info Panels.",
		cji_panel_on_jobs = "Compact info on contracts",
		cji_panel_on_jobs_desc = "Enable compact info on pop-up contracts in Crime.NET.",
		cji_mods_panel_cutoff = "Mods List Maximum Width",
		cji_mods_panel_cutoff_desc = "In case the players decide to rename the mod with a long name.",
		cji_host_head_size = "Host Info size",
		cji_host_head_size_desc = "Size of the central panel.",
		cji_btn_panel_size = "Buttons size",
		cji_btn_panel_size_desc = "Size of the buttons below the central panel. (Join, Steam Profile and etc.)",
		cji_job_info_size = "Job Info size",
		cji_job_info_size_desc = "Size of the left panel.",
		cji_mods_panel_size = "Mods List size",
		cji_mods_panel_size_desc = "Size of the right panel.",
		cji_panel_position = "Panel appear",
		cji_panel_position_desc = "Choose where the panel will appear, when you selecting a server on Crime.Net.",
		cji_under_cursor = "Under Cursor",
		cji_lefttop = "Left-Top",
		cji_leftbottom = "Left-Bottom",
		cji_centertop = "Center-Top",
		cji_centerbottom = "Center-Bottom",
		cji_righttop = "Right-Top",
		cji_rightbottom = "Right-Bottom",
	})

	if Idstring("schinese"):key() == SystemInfo:language():key() then
		LocalizationManager:add_localized_strings({
			menu_compact_info = "Compact Host info",
			menu_steam_profile = "Steam资料",
			menu_epic_profile = "Epic Games资料",
			menu_hrs_pl = " 小时",
			menu_hidden_steam_profile = "隐藏资料",
			menu_hours_hidden = "已隐藏信息",
			menu_epic_no_profiles = "Epic Games账号",
			menu_suspect_loadout = "装备",
			menu_suspect_database = "嫌疑人档案",
			menu_ban = "封禁",
			menu_unban = "解除封禁",
			menu_add = "添加",
			menu_remove = "移除",
			menu_join = "加入",
			cji_panel_size = "界面大小",
			cji_panel_size_desc = "信息界面的大小",
			cji_panel_on_jobs = "合约资料紧凑",
			cji_panel_on_jobs_desc = "在弹出式合同中启用紧凑信息Crime.NET。",
			cji_mods_panel_cutoff = "模组列表最大宽度",
			cji_mods_panel_cutoff_desc = "以防玩家模组名称过长。",
			cji_host_head_size = "主机信息大小",
			cji_host_head_size_desc = "主机信息界面的大小。",
			cji_btn_panel_size = "按钮大小",
			cji_btn_panel_size_desc = "在主界面下的按钮大小。(加入、STEAM资料等)。",
			cji_job_info_size = "合约信息大小",
			cji_job_info_size_desc = "左侧界面的大小。",
			cji_mods_panel_size = "模组列表大小",
			cji_mods_panel_size_desc = "模组列表界面大小。",
			cji_panel_position = "显示界面",
			cji_panel_position_desc = "选择你在Crime.Net上选择服务器时，界面出现的位置。",
			cji_under_cursor = "光标下方",
			cji_lefttop = "左上方",
			cji_leftbottom = "左下方",
			cji_centertop = "正上方",
			cji_centerbottom = "正下方",
			cji_righttop = "右上方",
			cji_rightbottom = "右下方",
		})
	elseif Idstring("spanish"):key() == SystemInfo:language():key() then
		LocalizationManager:add_localized_strings({
			menu_steam_profile = "Perfil de Steam",
			menu_epic_profile = "Perfil de Epic Games",
			menu_hrs_pl = " hrs.",
			menu_hidden_steam_profile = "Perfil privado",
			menu_suspect_loadout = "Equipamiento",
			menu_suspect_database = "Base de datos",
			menu_ban = "Bloquear",
			menu_unban = "Desbloquear",
			menu_add = "Añadir",
			menu_remove = "Eliminar",
			menu_join = "Unirse",
			cji_panel_size = "Tamaño de los paneles",
			cji_panel_size_desc = "Establecer el tamaño de los paneles de información",
			cji_panel_on_jobs = "Información compacta sobre contratos",
			cji_panel_on_jobs_desc = "Habilite la información compacta en contratos emergentes en Crime.NET.",
			cji_mods_panel_cutoff = "Ancho Máximo de la Lista de Modificaciones",
			cji_mods_panel_cutoff_desc = "En caso de que los jugadores decidan cambiar el nombre del mod con un nombre largo.",
			cji_host_head_size = "Tamaño de la información del Host",
			cji_host_head_size_desc = "Tamaño del panel central.",
			cji_btn_panel_size = "Tamaño de los botones",
			cji_btn_panel_size_desc = "Tamaño de los botones debajo del panel central. (Unirse, Perfil de Steam, etc.)",
			cji_job_info_size = "Tamaño de la Información del Trabajo",
			cji_job_info_size_desc = "Tamaño del panel izquierdo.",
			cji_mods_panel_size = "Tamaño de la lista de modificaciones",
			cji_mods_panel_size_desc = "Tamaño del panel derecho.",
			cji_panel_position = "Aparece el panel",
			cji_panel_position_desc = "Elija dónde aparecerá el panel, cuando seleccione un servidor en Crime.Net.",
			cji_under_cursor = "Debajo del Cursor",
			cji_lefttop = "Arriba a la Izquierda",
			cji_leftbottom = "Izquierda-Abajo",
			cji_centertop = "Parte Superior central",
			cji_centerbottom = "Centro Abajo",
			cji_righttop = "Arriba a la Derecha",
			cji_rightbottom = "Abajo a la Derecha",
		})
	elseif Idstring("latam"):key() == SystemInfo:language():key() or SystemInfo:language():key() == "37f9903497cc5470" then
		LocalizationManager:add_localized_strings({
			menu_steam_profile = "Perfil de Steam",
			menu_epic_profile = "Perfil de Epic Games",
			menu_hrs_pl = " hrs.",
			menu_hidden_steam_profile = "Perfil privado",
			menu_suspect_loadout = "Equipamiento",
			menu_suspect_database = "Base de datos",
			menu_ban = "Bloquear",
			menu_unban = "Desbloquear",
			menu_add = "Añadir",
			menu_remove = "Eliminar",
			menu_join = "Unirse",
			cji_panel_size = "Tamaño de los paneles",
			cji_panel_size_desc = "Establecer el tamaño de los paneles de información",
			cji_panel_on_jobs = "Informações compactas sobre Contratos",
			cji_panel_on_jobs_desc = "Habilite informações compactas em contratos pop-up em Crime.NET.",
			cji_mods_panel_cutoff = "Lista de modificações Largura máxima",
			cji_mods_panel_cutoff_desc = "Caso os jogadores decidam renomear o mod com um nome longo.",
			cji_host_head_size = "Tamanho das informações do Host",
			cji_host_head_size_desc = "Tamanho do painel central.",
			cji_btn_panel_size = "Tamanho dos botões",
			cji_btn_panel_size_desc = "Tamanho dos botões abaixo do painel central. (Entrar, perfil Steam e etc.)",
			cji_job_info_size = "Job Info tamanho",
			cji_job_info_size_desc = "Tamanho do painel esquerdo.",
			cji_mods_panel_size = "Tamanho da lista de modificações",
			cji_mods_panel_size_desc = "Tamanho do painel direito.",
			cji_panel_position = "Painel aparecer",
			cji_panel_position_desc = "Escolha onde o painel aparecerá, ao selecionar um servidor em Crime.Net.",
			cji_under_cursor = "Sob Cursor",
			cji_lefttop = "Esquerda Superior",
			cji_leftbottom = "Inferior Esquerdo",
			cji_centertop = "Topo Central",
			cji_centerbottom = "Centro Inferior",
			cji_righttop = "Direita-Superior",
			cji_rightbottom = "Inferior Direito",
		})
	elseif Idstring("russian"):key() == SystemInfo:language():key() then
		LocalizationManager:add_localized_strings({
			menu_steam_profile = "Профиль Steam",
			menu_epic_profile = "Профиль Epic Games",
			menu_hrs_pl = " ч.",
			menu_epic_no_profiles = "Аккаунт Epic Games",
			menu_hidden_steam_profile = "Скрытый Профиль",
			menu_hours_hidden = "Игровая информация скрыта",
			menu_suspect_loadout = "Снаряжение",
			menu_suspect_database = "База данных",
			menu_ban = "Забанить",
			menu_unban = "Разбанить",
			menu_add = "Добавить",
			menu_remove = "Убрать",
			menu_join = "Присоединится",
			menu_drop_in_stealth_prompt = "По скрытому подходу",
			cji_panel_size = "Размер панелей",
			cji_panel_size_desc = "Размер панелей информации.",
			cji_panel_on_jobs = "Компактная инфо. на контрактах",
			cji_panel_on_jobs_desc = "Включить компактную инфо. на всплывающих контрактах в Crime.NET.",
			cji_mods_panel_cutoff = "Макс. ширина списка модификаций",
			cji_mods_panel_cutoff_desc = "На случай если игроки решат переименовать мод длинным названием.",
			cji_host_head_size = "Размер Информации о Хосте",
			cji_host_head_size_desc = "Размер центральной панели.",
			cji_btn_panel_size = "Размер кнопок",
			cji_btn_panel_size_desc = "Размер кнопок, которые находятся ниже центральной панели. (Присоединится, Steam Профиль и тд.)",
			cji_job_info_size = "Размер ифнормации о задании",
			cji_job_info_size_desc = "Размер левой панели.",
			cji_mods_panel_size = "Размер списка модификаций",
			cji_mods_panel_size_desc = "Размер правой панели.",
			cji_panel_position = "Появление панели",
			cji_panel_position_desc = "Выберите где панель будет появлятся, когда вы выбираете сервер в Crime.Net.",
			cji_under_cursor = "Под курсором",
			cji_lefttop = "Сверху-слева",
			cji_leftbottom = "Снизу-слева",
			cji_centertop = "По центру сверху",
			cji_centerbottom = "По центру снизу",
			cji_righttop = "Сверху-справа",
			cji_rightbottom = "Снизу-справа",
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
			size = 0.85,
			panel_on_jobs = true
		}
		self:Save()
	end
end

Hooks:Add("MenuManagerInitialize", "MenuManagerInitialize_Compact_Info", function(...)
	Compact_Info:Load()
end)

Hooks:Add("MenuManagerBuildCustomMenus", "MenuManagerBuildCustomMenus_Compact_Info", function(menu_manager, nodes)
	function MenuCallbackHandler:set_cji_values_callback(item)
		Compact_Info.settings[item:parameters().name:gsub("cji_", "")] = tonumber(item:value())
		Compact_Info:Save()
	end
	
	function MenuCallbackHandler:set_cji_toggle_callback(item)
		Compact_Info.settings[item:parameters().name:gsub("cji_", "")] = item:value() == "on" and true or nil
		Compact_Info:Save()
	end

	local menu_id = "compact_job_info_options"
	MenuHelper:NewMenu(menu_id)

	local items = {
		"cji_under_cursor",
		"cji_lefttop",
		"cji_leftbottom",
		"cji_centertop",
		"cji_centerbottom",
		"cji_righttop",
		"cji_rightbottom"
	}

	MenuHelper:AddToggle({
		id = "cji_panel_on_jobs",
		title = "cji_panel_on_jobs",
		desc = "cji_panel_on_jobs_desc",
		callback = "set_cji_toggle_callback",
		value = Compact_Info.settings.panel_on_jobs or false,
		menu_id = menu_id,
		priority = 5,
	})
	
	MenuHelper:AddMultipleChoice({
		id = "cji_position",
		title = "cji_panel_position",
		desc = "cji_panel_position_desc",
		callback = "set_cji_values_callback",
		items = items,
		value = Compact_Info.settings.position or 1,
		menu_id = menu_id,
		priority = 6,
	})

	MenuHelper:AddSlider({
		id = "cji_size",
		title = "cji_panel_size",
		desc = "cji_panel_size_desc",
		callback = "set_cji_values_callback",
		value = Compact_Info.settings.size,
		max = 1.2,
		min = 0.5,
		step = 0.1,
		show_value = true,
		menu_id = menu_id,
		priority = 1
	})
	
	MenuHelper:AddSlider({
		id = "cji_mods_panel_cutoff",
		title = "cji_mods_panel_cutoff",
		desc = "cji_mods_panel_cutoff_desc",
		callback = "set_cji_values_callback",
		value = Compact_Info.settings.mods_panel_cutoff or 500,
		max = 500,
		min = 150,
		step = 1,
		show_value = true,
		menu_id = menu_id,
		priority = 1
	})

	MenuHelper:AddDivider({
		id = "cji_divider_1",
		size = 16,
		menu_id = menu_id,
	})

	MenuHelper:AddSlider({
		id = "cji_host_head_size",
		title = "cji_host_head_size",
		desc = "cji_host_head_size_desc",
		callback = "set_cji_values_callback",
		value = Compact_Info.settings.host_head_size or 1,
		max = 1.2,
		min = 0.5,
		step = 0.1,
		show_value = true,
		menu_id = menu_id,
		priority = -1
	})

	MenuHelper:AddSlider({
		id = "cji_btn_panel_size",
		title = "cji_btn_panel_size",
		desc = "cji_btn_panel_size_desc",
		callback = "set_cji_values_callback",
		value = Compact_Info.settings.btn_panel_size or 1,
		max = 1.2,
		min = 0.5,
		step = 0.1,
		show_value = true,
		menu_id = menu_id,
		priority = -2
	})

	MenuHelper:AddSlider({
		id = "cji_job_info_size",
		title = "cji_job_info_size",
		desc = "cji_job_info_size_desc",
		callback = "set_cji_values_callback",
		value = Compact_Info.settings.job_info_size or 1,
		max = 1.2,
		min = 0.5,
		step = 0.1,
		show_value = true,
		menu_id = menu_id,
		priority = -3
	})

	MenuHelper:AddSlider({
		id = "cji_mods_panel_size",
		title = "cji_mods_panel_size",
		desc = "cji_mods_panel_size_desc",
		callback = "set_cji_values_callback",
		value = Compact_Info.settings.mods_panel_size or 1,
		max = 1.2,
		min = 0.5,
		step = 0.1,
		show_value = true,
		menu_id = menu_id,
		priority = -4
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

	if PeerModListHighlights.lists then
		if PeerModListHighlights.lists.greenlist and table.contains(PeerModListHighlights.lists.greenlist, string.upper(mod)) then
			config.mod_rate = 3
			config.color = PeerModListHighlights.greencolour
		elseif PeerModListHighlights.lists.yellowlist and table.contains(PeerModListHighlights.lists.yellowlist, string.upper(mod)) then
			config.mod_rate = 2
			config.color = PeerModListHighlights.yellowcolour
		elseif PeerModListHighlights.lists.redlist and table.contains(PeerModListHighlights.lists.redlist, string.upper(mod)) then
			config.mod_rate = 1
			config.color = PeerModListHighlights.redcolour
		end
	end
end

local function open_url(url)
	if Steam then
		Steam:overlay_activate("url", url)
	else
		os.execute("start " .. url)
	end
end

function CrimeNetGui:create_host_info(job, x, y)
	if self._host_info_panel then
		return
	end
	
	local job_tweak = tweak_data.narrative:job_data(job.job_id)
	job.host_id = job.host_id or ""

	managers.menu:active_menu().logic:selected_node():parameters().block_back = true

	self._host_info_panel = self._panel:panel({
		layer = 28
	})

	local job_info = self._host_info_panel:panel({
		name = "job_info"
	})

	local lowest_val = 0.5
	local size_value = (Compact_Info.settings.job_info_size or 1) * Compact_Info.settings.size
	local size = size_value < lowest_val and lowest_val or size_value
	
	local name_id = job_tweak and managers.localization:text(job_tweak.name_id)
	local job_name = job_info:text({
		x = 8 * size,
		y = 8 * size,
		name = "job_name",
		text = job.server_data.level_name or name_id or "NO JOB",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size * size
	})
	fine_text(job_name)

	local csrank = tonumber(job.crime_spree) or -1
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

	local exp_str = job.job_id and job.difficulty_id and show_exp(job.job_id, job.difficulty_id) or ""
	local experience = job_info:text({
		x = 8 * size,
		name = "experience",
		text = exp_str,
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size * size
	})
	fine_text(experience)
	experience:set_top(difficulty_name:bottom())
	
	local job_ghost_mul = managers.job:get_ghost_bonus() or 0
	local ghost_xp_text = nil

	if exp_str ~= "" and job_ghost_mul ~= 0 then
		local job_ghost = math.round(job_ghost_mul * 100)
		local job_ghost_string = tostring(math.abs(job_ghost))
		local ghost_color = tweak_data.screen_colors.ghost_color

		if job_ghost == 0 and job_ghost_mul ~= 0 then
			job_ghost_string = string.format("%0.2f", math.abs(job_ghost_mul * 100))
		end

		local text_prefix = job_ghost_mul < 0 and "-" or "+"
		local text_string = " (" .. text_prefix .. job_ghost_string .. "%)"
		ghost_xp_text = job_info:text({
			blend_mode = "add",
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size * size,
			text = text_string,
			color = ghost_color
		})
		
		fine_text(ghost_xp_text)
		ghost_xp_text:set_position(experience:right(), experience:top())
	end
	
	local job_heat = managers.job:_get_job_heat(job.job_id) or 0
	local job_heat_mul = managers.job:heat_to_experience_multiplier(job_heat) - 1 or 0
	local heat_color = managers.job:get_heat_color(job_heat)
	local heat_xp_text = nil

	if exp_str ~= "" and job_heat_mul ~= 0 then
		job_heat = math.round(job_heat_mul * 100)
		local job_heat_string = tostring(math.abs(job_heat))

		if job_heat == 0 and job_heat_mul ~= 0 then
			job_heat_string = string.format("%0.2f", math.abs(job_heat_mul * 100))
		end

		local text_prefix = job_heat_mul < 0 and "-" or "+"
		local text_string = " (" .. text_prefix .. job_heat_string .. "%)"
		heat_xp_text = job_info:text({
			blend_mode = "add",
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size * size,
			text = text_string,
			color = heat_color
		})
		
		fine_text(heat_xp_text)
		heat_xp_text:set_position(math.round(ghost_xp_text and ghost_xp_text:right() or experience:right()), experience:top())
	end

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

	-- From FastNET Continued by test1.
	-- Originally "function MenuNodeTableGui:completed_job" in `.../mods/FastNet Continued/Hooks/ServerColumns.lua`
	local function completed_job(job_id, difficulty, is_one_down)
		if job_id == nil then return 0 end

		local job_stats = managers.statistics._global.sessions.jobs
		local tweak_jobs = tweak_data.narrative.jobs
		local job_wrapper = nil

		if tweak_data.narrative:has_job_wrapper(job_id) then
			job_wrapper = tweak_jobs[job_id].job_wrapper
		elseif tweak_data.narrative:is_wrapped_to_job(job_id) then
			job_wrapper = tweak_jobs[tweak_jobs[job_id].wrapped_to_job].job_wrapper
		end

		local function single_job_count(job_id, difficulty, is_one_down)
			local stat_prefix = tostring(job_id) .. "_" .. tostring(difficulty)
			local stat_suffix = "_completed"

			local count = 0

			count = count + (job_stats[stat_prefix .. "_od" .. stat_suffix] or 0)

			if not is_one_down then
				count = count + (job_stats[stat_prefix .. stat_suffix] or 0)
			end

			return count
		end

		local count = 0

		if job_wrapper then
			local count = 0

			for _, wrapped_job in ipairs(job_wrapper) do
				count = count + single_job_count(wrapped_job, difficulty, is_one_down)
			end

			return count
		end

		return single_job_count(job_id, difficulty, is_one_down)
	end

	local completed = job_info:text({
		x = 8 * size,
		name = "completed",
		text = managers.localization:text("daily_discord_progress") .. ": ",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size * size,
		color = tweak_data.screen_colors.text:with_alpha(0.675)
	})
	fine_text(completed)
	completed:set_top(money:bottom())
	
	local comp_num = job_info:text({
		x = 8 * size,
		name = "comp_num",
		text = tostring(completed_job(job.job_id, job.difficulty, job.one_down == 1)),
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size * size
	})
	fine_text(comp_num)
	comp_num:set_lefttop(completed:right(), money:bottom())

	local server_data = job.server_data
	
	local job_plan_header = job_info:text({
		x = 8 * size,
		name = "job_plan_header",
		text = server_data.job_plan and server_data.job_plan ~= -1 and managers.localization:text("menu_preferred_plan") .. ": " or "",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size * size,
		color = tweak_data.screen_colors.text:with_alpha(0.675)
	})
	fine_text(job_plan_header)
	job_plan_header:set_top(completed:bottom())

	local tactics = {
		managers.localization:text("menu_plan_loud"),
		managers.localization:text("menu_plan_stealth"),
		[-1.0] = ""
	}
	local job_plan = job_info:text({
		x = 8 * size,
		name = "job_plan",
		text = tactics[server_data.job_plan],
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size * size,
		color = server_data.job_plan == 2 and tweak_data.screen_colors.ghost_color or tweak_data.screen_colors.heat_warm_color
	})
	fine_text(job_plan)
	job_plan:set_lefttop(job_plan_header:right(), job_plan_header:top())

	local drop_in = {
		[0] = managers.localization:text("menu_off"),
		"",
		managers.localization:text("menu_drop_in_prompt"),
		managers.localization:text("menu_drop_in_stealth_prompt")
	}
	local drop_in_header = job_info:text({
		x = 8 * size,
		name = "drop_in_header",
		text = server_data.drop_in and server_data.drop_in ~= 1 and managers.localization:text("menu_toggle_drop_in") .. ": " or "",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size * size,
		color = tweak_data.screen_colors.text:with_alpha(0.675)
	})
	fine_text(drop_in_header)
	drop_in_header:set_top(job_plan_header:bottom())

	local drop_in = job_info:text({
		x = 8 * size,
		name = "drop_in",
		text = drop_in[server_data.drop_in],
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size * size,
		color = server_data.drop_in == 3 and tweak_data.screen_colors.ghost_color or tweak_data.screen_colors.text
	})
	fine_text(drop_in)
	drop_in:set_lefttop(drop_in_header:right(), drop_in_header:top())

	local kick_header = job_info:text({
		x = 8 * size,
		name = "kick_header",
		text = server_data.kick_option and server_data.kick_option ~= 1 and managers.localization:text("menu_kicking_allowed_option") .. ": " or "",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size * size,
		color = tweak_data.screen_colors.text:with_alpha(0.675)
	})
	fine_text(kick_header)
	kick_header:set_top(drop_in_header:bottom())
	local kick = {
		[0] = managers.localization:text("menu_kick_disabled"),
		"",
		managers.localization:text("menu_kick_vote")
	}
	local kick = job_info:text({
		x = 8 * size,
		name = "kick",
		text = kick[server_data.kick_option],
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size * size,
		color = server_data.kick == 1 and tweak_data.screen_colors.ghost_color or tweak_data.screen_colors.text
	})
	fine_text(kick)
	kick:set_lefttop(kick_header:right(), kick_header:top())

	local rep_permission_header = job_info:text({
		x = 8 * size,
		name = "rep_permission_header",
		text = server_data.min_level and server_data.min_level > 0 and managers.localization:text("menu_reputation_permission") .. ": " or "",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size * size,
		color = tweak_data.screen_colors.text:with_alpha(0.675)
	})
	fine_text(rep_permission_header)
	rep_permission_header:set_top(kick_header:bottom())

	local rep_permission = job_info:text({
		x = 8 * size,
		name = "rep_permission",
		text = server_data.min_level and server_data.min_level > 0 and tostring(server_data.min_level) or "",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size * size
	})
	fine_text(rep_permission)
	rep_permission:set_lefttop(rep_permission_header:right(), rep_permission_header:top())

	local permission = {
		"",
		managers.localization:text("menu_friends_only_game"),
		managers.localization:text("menu_private_game")
	}
	local permission = job_info:text({
		x = 8 * size,
		name = "permission",
		text = permission[server_data.permission],
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size * size
	})
	fine_text(permission)
	permission:set_top(rep_permission:bottom())

	job_info:set_size(
		math.max(
			job_name:right(),
			difficulty_name:right(),
			one_down:right(),
			experience:right(),
			ghost_xp_text and ghost_xp_text:right() or 0,
			heat_xp_text and heat_xp_text:right() or 0,
			money:right(),
			completed:right(),
			comp_num:right(),
			job_plan:right(),
			drop_in:right(),
			kick:right(),
			rep_permission:right(),
			permission:right()
		) + (8 * size),

		math.max(
			completed:bottom(),
			job_plan:bottom(),
			drop_in:bottom(),
			kick:bottom(),
			rep_permission:bottom(),
			permission:bottom()
		) + (8 * size)
	)

	local size_value = (Compact_Info.settings.host_head_size or 1) * Compact_Info.settings.size
	local size = size_value < lowest_val and lowest_val or size_value
	local host_head = self._host_info_panel:panel({
		name = "host_head",
		w = 150 * size
	})
	host_head:set_left(job_info:right() + 5)

	local avatar_panel = host_head:panel({
		name = "avatar_panel",
		y = 8 * size,
		h = 0,
		w = host_head:w() - 16 * size
	})
	avatar_panel:set_center_x(host_head:w() / 2)
	avatar_panel:set_h(host_head:w() - 16 * size)
	
	if job.host_id == "" then
		if job_tweak and job_tweak.contract_visuals and job_tweak.contract_visuals.preview_image then
			local data = job_tweak.contract_visuals.preview_image
			local path, rect = nil

			if data.id then
				path = "guis/dlcs/" .. (data.folder or "bro") .. "/textures/pd2/crimenet/" .. data.id
				rect = data.rect
			elseif data.icon then
				path, rect = tweak_data.hud_icons:get_icon_data(data.icon)
			end

			if path and DB:has(Idstring("texture"), path) then
				job.host_avatar = path
			end
		end
	end
	
	local avatar = avatar_panel:bitmap({
		h = avatar_panel:h(),
		w = avatar_panel:w(),
		texture = #job.host_id == 32 and "guis/dlcs/shub/textures/epic_player_icon" or "guis/dlcs/shub/textures/steam_player_icon",
		alpha = 1,
		blend_mode = "normal"
	})
	avatar:set_image(job.host_avatar)

	BoxGuiObject:new(avatar_panel, {
		sides = {1, 1, 1, 1}
	})

	local steam_username = #job.host_id ~= 32 and Steam and managers.network:sanitize_peer_name(Steam:username(job.host_id)) or job.host_name -- Epic uses a 32-character ID; Steam doesn't have a guaranteed single length.
	local name_id = job_tweak and managers.localization:text(tweak_data.narrative.contacts[job_tweak.contact].name_id)
	local host_nickname = host_head:text({
		name = "host_nickname",
		align = "center",
		text = job.host_id == "" and name_id or tostring((steam_username ~= "" and steam_username) or (job.host_name ~= nil and job.host_name) or "Unknown"),
		font_size = tweak_data.menu.pd2_small_font_size * size,
		font = tweak_data.menu.pd2_small_font
	})
	redone_text_length(host_nickname, host_head)

	fine_text(host_nickname)
	host_nickname:set_top(avatar_panel:bottom() + 5)
	host_nickname:set_center_x(avatar_panel:center_x())
	
	local name_id = job_tweak and managers.localization:text(job_tweak.name_id)
	local playtime = host_head:text({
		name = "playtime",
		align = "center",
		text = job.host_id == "" and name_id or managers.localization:text("menu_http_loading") or "",
		font_size = tweak_data.menu.pd2_small_font_size * size,
		font = tweak_data.menu.pd2_small_font,
		color = tweak_data.screen_colors.achievement_grey
	})
	fine_text(playtime)
	playtime:set_top(host_nickname:bottom())
	playtime:set_center_x(avatar_panel:center_x())

	local hrs = managers.localization:text("menu_hrs_pl")
	local hidden = managers.localization:text("menu_hidden_steam_profile")
	local private = managers.localization:text("menu_hours_hidden")
	local epic_profile = managers.localization:text("menu_epic_no_profiles")

	local function set_playtime_to_center(str, text, panel)
		if alive(text) then
			text:set_text(str)
			redone_text_length(text, host_head)
			fine_text(text)
			text:set_center_x(panel:center_x())
		end
	end

	if not self._players_playtime_by_id then
		self._players_playtime_by_id = {}
	end

	if job.host_id ~= "" then
		if #job.host_id ~= 32 then
			if table.has(self._players_playtime_by_id, job.host_id) then
				local play_hours = self._players_playtime_by_id[job.host_id]
				set_playtime_to_center(play_hours .. ((play_hours ~= hidden and play_hours ~= private) and hrs or ""), playtime, avatar_panel)
			else
				dohttpreq('http://steamcommunity.com/profiles/' .. job.host_id .. '/games/?xml=1', function(page)
					if type(page) == "string" then
						local game = "<appID>218620</appID>"
						if string.find(tostring(page), game) then
							local _, pd2 = string.find(tostring(page), game)
							local _, st = string.find(tostring(page), "<hoursOnRecord>", pd2)
							local en, _ = string.find(tostring(page), "</hoursOnRecord>", st)
							local hours = string.sub(tostring(page), st + 1, en - 1)

							set_playtime_to_center(hours .. hrs, playtime, avatar_panel)
							self._players_playtime_by_id[job.host_id] = hours
						elseif string.find(tostring(page), "is private") then -- No lang identifier in query, so result should be in English and make this work.
							set_playtime_to_center(hidden, playtime, avatar_panel)
						else
							set_playtime_to_center(private, playtime, avatar_panel)
							self._players_playtime_by_id[job.host_id] = private
						end
					end
				end)
			end
		else
			set_playtime_to_center(epic_profile, playtime, avatar_panel)
		end
	end

	local in_lobby = managers.localization:text("menu_lobby_server_state_in_lobby")
	local in_game = managers.localization:text("menu_lobby_server_state_in_game")
	local server_state = host_head:text({
		name = "server_state",
		align = "center",
		text = job.server_data.state_name or "",
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
	
	if job.num_plrs then
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
	end

	peers_panel:set_size(cw - (3 * size), ch)
	peers_panel:set_top(server_state:bottom() + 2)
	peers_panel:set_center_x(avatar_panel:center_x())
	host_head:set_h(peers_panel:bottom() + (8 * size))

	local size_value = (Compact_Info.settings.btn_panel_size or 1) * Compact_Info.settings.size
	local size = size_value < lowest_val and lowest_val or size_value
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
		text = job.host_id == "" and managers.localization:text("menu_create_lobby") or managers.localization:text("menu_join"),
		font_size = (tweak_data.menu.pd2_large_font_size / 1.5) * size,
		font = tweak_data.menu.pd2_large_font,
		color = tweak_data.screen_colors.button_stage_2
	})
	fine_text(join)
	join:set_w(btn_panel:w())

	local steam_profile = btn_panel:text({
		name = "steam_profile",
		align = "center",
		text = job.host_id == "" and "" or #job.host_id == 32 and managers.localization:text("menu_epic_profile") or managers.localization:text("menu_steam_profile"),
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
		text = (job.host_id == "" or #job.host_id == 32) and "" or managers.localization:text("menu_suspect_loadout"),
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
		text = (job.host_id == "" or #job.host_id == 32) and "" or managers.localization:text("menu_suspect_database"),
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
		text = job.host_id == "" and "" or managers.ban_list:banned(job.host_id) and managers.localization:text("menu_unban") or managers.localization:text("menu_ban"),
		font_size = tweak_data.menu.pd2_small_font_size * size,
		font = tweak_data.menu.pd2_small_font,
		color = tweak_data.screen_colors.button_stage_2
	})
	fine_text(ban)
	ban:set_w(btn_panel:w())
	ban:set_top(database:bottom())
	
	redone_text_length(playtime, avatar_panel) -- Not sure if this is necessary? - T.S./l3laze
	redone_text_length(join, btn_panel)
	redone_text_length(steam_profile, btn_panel)
	redone_text_length(loadout, btn_panel)
	redone_text_length(database, btn_panel)
	redone_text_length(ban, btn_panel)

	btn_panel:set_h(ban:bottom() + 5)

	self._host_info_panel:set_size(host_head:right(), btn_panel:bottom())

	if job.mods and job.mods ~= "" and job.mods ~= "1" and job.mods ~= "7d66a433be3a1fe2" then
		self._fine_mods = {}
		
		local mods_list = string.split(job.mods, "|")
		for i = 1, #mods_list, 2 do
			local name = mods_list[i] or ""
			local config = {
				name = name,
				folder = mods_list[i + 1] or "",
				color = tweak_data.screen_colors.text,
				mod_rate = 0
			}
			peer_modlist_highlight_injector(name, config)
			
			if name ~= "SuperBLT" and name ~= "BeardLib" then
				table.insert(self._fine_mods, config)
			end
		end
		
		if table.size(self._fine_mods) > 0 then
			local size_value = (Compact_Info.settings.mods_panel_size or 1) * Compact_Info.settings.size
			local size = size_value < lowest_val and lowest_val or size_value
			local mods_panel = self._host_info_panel:panel({name = "mods_panel"})
			local scroll_panel = mods_panel:panel({name = "scroll_panel"})
			
			table.sort(self._fine_mods, function (a, b)
				if a.mod_rate ~= b.mod_rate then
					return a.mod_rate > b.mod_rate
				end
				
				return a.name:lower() < b.name:lower()
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
					local cutoff = Compact_Info.settings.mods_panel_cutoff or 500
					if w > cutoff then
						w = cutoff
					end
					
					panel_w = w
				end

				mod:set_w(1000)
			end

			panel_y = panel_y + (16 * size)

			local scrollable_panel_y = panel_y
			if panel_y > btn_panel:bottom() then
				panel_y = btn_panel:bottom()
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

	self:move_host_info(x, y, nil, nil, "new")

	setup_panel(job_info)
	setup_panel(host_head)
	setup_panel(btn_panel)
end

function CrimeNetGui:recreate_host_info(job)
	if alive(self._host_info_panel) then
		local mods_panel = self._host_info_panel:child("mods_panel")
		local host_nickname = self._host_info_panel:child("host_head"):child("host_nickname"):text()
		local l, t = self._host_info_panel:left() + self._host_info_panel:child("job_info"):w() + 5, self._host_info_panel:top()
		local pos, up_visible, down_visible = nil, false, true

		if alive(mods_panel) then
			pos = mods_panel:child("scroll_panel"):y()
			up_visible = mods_panel:child("scroll_up"):visible()
			down_visible = mods_panel:child("scroll_down"):visible()
		end

		self:destroy_host_info()
		self:create_host_info(job)

		self._host_info_panel:set_lefttop(l - self._host_info_panel:child("job_info"):w() - 5, t)

		if self._host_info_panel:top() < self._panel:top() then
			self._host_info_panel:set_top(self._panel:top())
		elseif self._host_info_panel:bottom() > self._panel:bottom() - 60 then
			self._host_info_panel:set_bottom(self._panel:bottom() - 60)
		end

		if self._host_info_panel:left() < self._panel:left() + 60 then
			self._host_info_panel:set_left(self._panel:left() + 60)
		elseif self._host_info_panel:right() > self._panel:right() then
			self._host_info_panel:set_right(self._panel:right() - 5)
		end

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

function CrimeNetGui:move_host_info(x, y, ax, ay, pos)
	x = x or 0
	y = y or 0
	ax = ax or 0
	ay = ay or 0

	if not self._grabbed_coords then
		self._grabbed_coords = {x = x - ax, y = y - ay}
	end
	
	if alive(self._host_info_panel) then
		if pos == "new" then
			ax = self._host_info_panel:child("host_head"):center_x()
			ay = self._host_info_panel:child("host_head"):center_y()
			self._host_info_panel:set_lefttop(x - ax, y - ay + (ay / 3))
		else
			self._host_info_panel:set_center(x - self._grabbed_coords.x, y - self._grabbed_coords.y)
		end
		
		if self._host_info_panel:top() < self._panel:top() then
			self._host_info_panel:set_top(self._panel:top())
		elseif self._host_info_panel:bottom() > self._panel:bottom() - 60 then
			self._host_info_panel:set_bottom(self._panel:bottom() - 60)
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

function CrimeNetGui:dialog_move_mod_to_list(button, mods_panel, scroll_panel, mods_table, up, down, x, y)
	for id, mod in pairs(mods_table) do
		local btn = scroll_panel:child(mod.name .. id)
		if alive(btn) and mods_panel:inside(x, y) and btn:inside(x, y) and not (up:inside(x, y) or down:inside(x, y)) then
			if PeerModListHighlights and button == Idstring("0") then
				self._hold_compact_panel = false
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
				open_url("https://modworkshop.net/find/mod?q=" .. mod.name .. "&tags=&gid=1")
				managers.menu_component:post_event("menu_enter")
			end
		end
	end
end

function CrimeNetGui:press_mouse_on_info_panels(button, x, y)
	if not self:input_focus() then
		return
	end
	
	local trigger_scroll = false
	local scroll_speed = 15
	if tostring(button) == "Idstring(@ID8056b7956bde8b70@)" then
		button = Idstring("0")
		self._grabbed_coords = nil
		self._accident_click_on_btns = nil
	elseif tostring(button) == "Idstring(@IDd95354c7c30900a0@)" then
		button = Idstring("1")
		if not self._hold_compact_panel then
			self._inside_info = nil
		end
		self._hold_compact_panel = nil
		self._grabbed_coords = nil
		self._accident_click_on_btns = nil
	elseif tostring(button) == "Idstring(@IDedad8678cae3162c@)" then
		button = Idstring("mouse wheel up")
		trigger_scroll = true
		scroll_speed = 50
	elseif tostring(button) == "Idstring(@IDdb322f73dadd0be4@)" then
		button = Idstring("mouse wheel down")
		trigger_scroll = true
		scroll_speed = 50
	end

	if self._accident_click_on_btns then
		self._accident_click_on_btns = nil
		return
	end
	
	if alive(self._host_info_panel) and button == Idstring("1") and not self._inside_info then
		self:destroy_host_info()
		managers.menu_component:post_event("menu_exit")
	end
	
	local job = self._local_job
	if self._host_info_panel then
		if button == Idstring("0") then
			local host_head = self._host_info_panel:child("host_head")
			local btn_panel = self._host_info_panel:child("btn_panel")
			local job_info = self._host_info_panel:child("job_info")
			local mods_panel = self._host_info_panel:child("mods_panel")
			
			if host_head:inside(x, y) or btn_panel:inside(x, y) or job_info:inside(x, y) or (mods_panel and mods_panel:inside(x, y)) then
				self._grabbed_map = nil
			end

			if self._inside_info then
				self._hold_compact_panel = not self._hold_compact_panel and true or false
			end
			
			if job.host_id and job.host_id ~= "" then
				if btn_panel:child("join"):inside(x, y) then
					managers.menu_component:post_event("menu_enter")
					managers.network.matchmake:join_server_with_check(job.room_id, false, job)
					self._hold_compact_panel = false
				elseif btn_panel:child("steam_profile"):inside(x, y) then
					self._hold_compact_panel = false
					managers.menu_component:post_event("menu_enter")
					local url = #job.host_id ~= 32 and "https://steamcommunity.com/profiles/" .. job.host_id or "https://store.epicgames.com/en-US/u/" .. job.host_id
					open_url(url)
				elseif btn_panel:child("loadout"):inside(x, y) then
					self._hold_compact_panel = false
					managers.menu_component:post_event("menu_enter")
					open_url("http://fbi.paydaythegame.com/loadout/" .. job.host_id)
				elseif btn_panel:child("database"):inside(x, y) then
					self._hold_compact_panel = false
					managers.menu_component:post_event("menu_enter")
					open_url("http://fbi.paydaythegame.com/suspect/" .. job.host_id)
				elseif btn_panel:child("ban"):inside(x, y) then
					self._hold_compact_panel = false
					managers.menu_component:post_event("menu_enter")
					local ban = btn_panel:child("ban")
					local banned = managers.ban_list:banned(job.host_id)
					local dialog_data = {
						title = managers.localization:text(banned and "dialog_sure_to_unban_title" or "dialog_sure_to_ban_title"),
						text = managers.localization:text(banned and "dialog_sure_to_unban_body" or "dialog_sure_to_kick_ban_body", {
							USER = Steam and Steam:username(job.host_id) or job.host_name or ""
						})
					}
					local yes_button = {
						text = managers.localization:text("dialog_yes"),
						callback_func = function()
							if managers.ban_list:banned(job.host_id) then
								managers.ban_list:unban(job.host_id)
								if self._host_info_panel and ban then
									ban:set_text(managers.localization:text("menu_ban"))
									fine_text(ban)
									ban:set_w(btn_panel:w())
								end
							else
								managers.ban_list:ban(job.host_id, #job.host_id ~= 32 and Steam and Steam:username(job.host_id) or job.host_name or "")
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
			elseif not job.host_id or job.host_id == "" then
				if btn_panel:child("join"):inside(x, y) then
					self._hold_compact_panel = false
					managers.menu_component:post_event("menu_enter")
					MenuCallbackHandler:start_job(job)
				end
			end
		end

		local mods_panel = self._host_info_panel:child("mods_panel")
		if alive(mods_panel) then
			local scroll_panel, scroll_up, scroll_down = mods_panel:child("scroll_panel"), mods_panel:child("scroll_up"), mods_panel:child("scroll_down")
			self:dialog_move_mod_to_list(button, mods_panel, scroll_panel, self._fine_mods, scroll_up, scroll_down, x, y)
		end

		local mods_panel = self._host_info_panel:child("mods_panel")
		local inside_mods = mods_panel and mods_panel:inside(x, y)
		
		if trigger_scroll then
			inside_mods = true
		end

		if mods_panel and mods_panel:child("scroll_panel"):h() > mods_panel:h() and inside_mods then
			local scroll_panel, scroll_up, scroll_down = mods_panel and mods_panel:child("scroll_panel"), mods_panel:child("scroll_up"), mods_panel:child("scroll_down")
			if button == Idstring("mouse wheel up") or scroll_up:inside(x, y) and button == Idstring("0") then
				self._hold_compact_panel = false
				scroll_panel:set_y(scroll_panel:y() + scroll_speed)
				if scroll_panel:top() >= -12 then
					scroll_panel:set_top(0)
				end
			elseif button == Idstring("mouse wheel down") or scroll_down:inside(x, y) and button == Idstring("0") then
				self._hold_compact_panel = false
				scroll_panel:set_y(scroll_panel:y() - scroll_speed)
				
				if scroll_panel:bottom() <= mods_panel:h() + 12 then
					scroll_panel:set_bottom(mods_panel:h())
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
	self._tweak_data.controller.snap_distance = self._inside_info and 0 or 50
	
	if self:input_focus() then
		if alive(info) then
			if self._hold_compact_panel then
				self:move_host_info(x, y, info:center())
				used, pointer = true, "grab"
			elseif not self._hold_compact_panel and self._inside_info then
				used, pointer = true, "hand"
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
			local hidden_profile = playtime:text() == managers.localization:text("menu_hidden_steam_profile") or playtime:text() == managers.localization:text("menu_hours_hidden")

			button(btn_panel:child("join"))
			button(btn_panel:child("steam_profile"))
			button(btn_panel:child("loadout"), hidden_profile)
			button(btn_panel:child("database"), hidden_profile)
			button(btn_panel:child("ban"))

			if alive(info:child("mods_panel")) then
				local scroll_panel, scroll_up, scroll_down = info:child("mods_panel"):child("scroll_panel"), info:child("mods_panel"):child("scroll_up"), info:child("mods_panel"):child("scroll_down")
				for id, mod in pairs(self._fine_mods) do
					local btn = scroll_panel:child(mod.name .. id)

					if PeerModListHighlights and alive(btn) then
						if PeerModListHighlights.settings.include_mod_folder_crimenet and info:child("mods_panel"):inside(x, y) and btn:inside(x, y) then
							local folder_name = "{" .. mod.folder .. "}"
							if btn:text() ~= folder_name then
								btn:set_text(folder_name)
							end
						else
							if btn:text() ~= mod.name then
								btn:set_text(mod.name)
							end
						end
					end
					
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

local orig_gui = CrimeNetGui._create_job_gui
function CrimeNetGui:_create_job_gui(data, type, fixed_x, fixed_y, fixed_location)
	local gui_data = orig_gui(self, data, type, fixed_x, fixed_y, fixed_location)
	if Steam and gui_data.host_id then
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
	if self._inside_info then
		inside_any_job = false
		
		if closest_job then
			closest_job.mouse_over = 1
		end
	end

	data(self, closest_job, inside_any_job)
end

local data = CrimeNetGui.mouse_pressed
function CrimeNetGui:mouse_pressed(o, button, x, y)
	local pressed = data(self, o, button, x, y)
	
	self:press_mouse_on_info_panels(button, x, y)
	
	return pressed
end

local data = CrimeNetGui.special_btn_pressed
function CrimeNetGui:special_btn_pressed(button)
	if Input:keyboard():pressed(Idstring("esc")) and self._host_info_panel then
		self:destroy_host_info()
	end

	self:press_mouse_on_info_panels(button, managers.mouse_pointer:modified_mouse_pos())

	return data(self, button)
end

Hooks:PostHook(CrimeNetGui, "mouse_released", "ECN_stop_moving_host_info", function(self, ...)
	self._hold_compact_panel = nil
	self._grabbed_coords = nil
end)

local data = CrimeNetGui._set_zoom
function CrimeNetGui:_set_zoom(zoom, x, y)
	if alive(self._host_info_panel) and self._host_info_panel:child("mods_panel") then
		local mods_panel = self._host_info_panel:child("mods_panel")
		local scroll_up, scroll_down = mods_panel:child("scroll_panel"), mods_panel:child("scroll_up"), mods_panel:child("scroll_down")
		if mods_panel:inside(managers.mouse_pointer:modified_mouse_pos()) and (scroll_up:visible() or scroll_down:visible()) then
			return
		end
	end

	data(self, zoom, x, y)
end

Hooks:PostHook(CrimeNetGui, "update_server_job", "ECN_update_job_info", function(self, data, i, ...)
	local job_index = data.id or i
	local job = self._jobs[job_index]

	if (job and type(job) == "table" and job.host_id) and (self._local_job and type(self._local_job) == "table" and self._local_job.host_id) then
		if job.host_id == self._local_job.host_id and job ~= self._local_job then
			self._local_job = job
			self:recreate_host_info(self._local_job)
		end
	end
end)

function CrimeNetGui:check_job_pressed(x, y)
	for id, job in pairs(self._jobs) do
		if job.mouse_over == 1 then
			job.expanded = not job.expanded
			local job_data = tweak_data.narrative:job_data(job.job_id)
			local data = {
				difficulty = job.difficulty,
				difficulty_id = job.difficulty_id,
				one_down = job.one_down,
				job_id = job.job_id,
				level_id = job.level_id,
				id = id,
				room_id = job.room_id,
				server = job.server or false,
				num_plrs = job.num_plrs or 0,
				state = job.state,
				host_name = job.host_name,
				host_id = job.host_id,
				special_node = job.special_node,
				dlc = job.dlc,
				contract_visuals = job_data and job_data.contract_visuals,
				info = job.info,
				mutators = job.mutators,
				is_crime_spree = job.crime_spree and job.crime_spree >= 0,
				crime_spree = job.crime_spree,
				crime_spree_mission = job.crime_spree_mission,
				server_data = job.server_data,
				mods = job.mods,
				skirmish = job.skirmish,
				skirmish_wave = job.skirmish_wave,
				skirmish_weekly_modifiers = job.skirmish_weekly_modifiers
			}

			managers.menu_component:post_event("menu_enter")

			if not data.dlc or managers.dlc:is_dlc_unlocked(data.dlc) then
				local node = job.special_node

				if not node then
					if Global.game_settings.single_player then
						node = "crimenet_contract_singleplayer"
					elseif job.server then
						node = "crimenet_contract_join"

						if job.is_crime_spree then
							node = "crimenet_contract_crime_spree_join"
						end

						if job.is_skirmish then
							node = "skirmish_contract_join"
						end
					else
						node = "crimenet_contract_host"
					end
				end

				if (not Compact_Info.settings.panel_on_jobs and node == "crimenet_contract_host") or node == "crimenet_contract_singleplayer" then
					managers.menu:open_node(node, {data})
				else
					if not self._inside_info then
						self._local_job = job

						if alive(self._host_info_panel) then
							self:recreate_host_info(job)
							self._accident_click_on_btns = true
						else
							local pos = Compact_Info.settings.position
							if pos == 2 then
								x, y = 0, 75
							elseif pos == 3 then
								x, y = 0, self._panel:h()
							elseif pos == 4 then
								x, y = self._panel:w() / 2, 75
							elseif pos == 5 then
								x, y = self._panel:w() / 2, self._panel:h()
							elseif pos == 6 then
								x, y = self._panel:w(), 75
							elseif pos == 7 then
								x, y = self._panel:w(), self._panel:h()
							end

							self:create_host_info(job, x, y)
							self._accident_click_on_btns = true
						end
					end
				end
			elseif SystemInfo:distribution() == Idstring("STEAM") then
				local dlc_data = Global.dlc_manager.all_dlc_data[data.dlc]
				local app_id = dlc_data and dlc_data.app_id

				if app_id then
					managers.network.account:overlay_activate("store", app_id)
				end
			elseif SystemInfo:distribution() == Idstring("EPIC") then
				-- Nothing
			end

			if job.expanded then
				for id2, job2 in pairs(self._jobs) do
					if job2 ~= job then
						job2.expanded = false
					end
				end
			end

			return true
		end
	end
end
