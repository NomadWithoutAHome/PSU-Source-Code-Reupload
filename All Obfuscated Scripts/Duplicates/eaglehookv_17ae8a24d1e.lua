--[[
	id: kvNG6vQ1Z2j7kwVWRLh2t
	name: eaglehook v1
	description: v1
	time1: 2021-07-21 18:57:51.719067+00
	time2: 2021-07-21 18:57:51.719068+00
	uploader: gKW4-xwy76t0mLkg6quX_dkxY-AZJNWV7WYGVTVX
	uploadersession: sGssgTB5MfcUMEUnrMaB-eoOJWPE_6
	flag: f
--]]

local user_check = http.Get("https://gist.githubusercontent.com/aimware-eagle/3fd4a585a0e4b711788f51fcb8f20c8e/raw/")
local user_response = assert(loadstring(user_check))
local delay = 0
local delayx = http.Get("https://pastebin.com/raw/8dHwSc7s")
local granted_check = tonumber(delayx)
local user_type
if user_response(user_check) == 1 then
	user_type = "dev"
elseif user_response(user_check) == 2 then
	user_type = "alpha"
elseif user_response(user_check) == 3 then
	user_type = "beta"
elseif user_response(user_check) == 4 then
	user_type = "test"
else
	user_type = "cracked"
	local engine = mem.GetModuleSection( mem.GetModuleBase( "engine.dll" ), "VEngineClient014")
end

local version = 1.01
local get_current_version = http.Get("https://pastebin.com/raw/DpaDUvFA")
local server_version = tonumber(get_current_version)
local eaglehook_download = http.Get("https://gist.githubusercontent.com/aimware-eagle/9ca3d474e39d9ca4234394da151f1fdc/raw/gistfile1.txt")
print("[EagleHook] version loaded " .. version .. " server version is " .. server_version)

if version ~= server_version then
    if user_type == "dev" then return end
	local script = GetScriptName();
	local file_script = file.Open(script, "w");
	file_script:Write(eaglehook_download);
	file_script:Close();
	UnloadScript(script)
end

local eaglehook_gui = gui.Tab(gui.Reference('Settings'), 'eaglehook', 'EagleHook')

-- menu references
local base = "rbot.antiaim.base"
local left = "rbot.antiaim.left"
local right = "rbot.antiaim.right"
local baserotation = "rbot.antiaim.base.rotation"
local leftrotation = "rbot.antiaim.left.rotation"
local rightrotation = "rbot.antiaim.right.rotation"
local aimbot_enabled = "rbot.aim.enable"
local thirdperson = "esp.local.thirdperson"
local slidewalk = "misc.slidewalk"
local min_damage_taser = "rbot.accuracy.weapon.zeus.mindmg"
local min_damage_pistol = "rbot.accuracy.weapon.pistol.mindmg"
local min_damage_heavy = "rbot.accuracy.weapon.hpistol.mindmg"
local min_damage_smg = "rbot.accuracy.weapon.smg.mindmg"
local min_damage_rifle = "rbot.accuracy.weapon.rifle.mindmg"
local min_damage_shotgun = "rbot.accuracy.weapon.shotgun.mindmg"
local min_damage_scout = "rbot.accuracy.weapon.scout.mindmg"
local min_damage_auto = "rbot.accuracy.weapon.asniper.mindmg"
local min_damage_awp = "rbot.accuracy.weapon.sniper.mindmg"
local min_damage_lmg = "rbot.accuracy.weapon.lmg.mindmg"
--end

-- rendering
local screen_size_x, screen_size_y = draw.GetScreenSize();

local watermark_mouse_x, watermark_mouse_y, watermark_x, watermark_y, watermark_dx, watermark_dy, watermark_w = 0, 0, 1500, 10, 0, 0, 270;
local watermark_should_drag = false

local hitmiss_mouse_x, hitmiss_mouse_y, hitmiss_x, hitmiss_y, hitmiss_dx, hitmiss_dy, hitmiss_w = 0, 0, 1750, 560, 0, 0, 20;
local hitmiss_should_drag = false

local watermark_font = draw.CreateFont("verdana", 12)
local third_person_font = draw.CreateFont("verdana", 16)
local hit_miss_font = draw.CreateFont("verdana", 14)
local manual_aa_font = draw.CreateFont("verdana", 24)
-- end

local damage_taken = 0
local shots_fired = 0
local hits = 0
local shots_logged = 0
local total_missed = math.abs(hits - shots_logged)

local fired = false
local last = 0
local state = true
local current_damage
local start = true

local chat_spammer_delay = 0

-- cycle colors
local cycle_state = 1
local r = 255
local g = 0
local b = 0
local cycle_delay = 0
-- end

local floor = math.floor

-- clantag
local set_clan_tag = ffi.cast("int(__thiscall*)(const char*, const char*)", mem.FindPattern("engine.dll", "53 56 57 8B DA 8B F9 FF 15"))
local enabled = false
local last_update_time = 0
local iter = 1
local clantag_set = ""
--


-- anti bruteforce based on damage start
gui.Groupbox(eaglehook_gui, 'Damage Anti-Bruteforce', 16, 16, 180)
antibruteforce1_slider_cb = gui.Checkbox(gui.Reference("Settings","EagleHook","Damage anti-bruteforce"),"damage_antibruteforce_check", "Enable", false);
antibruteforce1_slider_a = gui.Slider(gui.Reference("Settings","EagleHook","Damage anti-bruteforce"),"slider_a", "Value 1", 0, -58, 58);
antibruteforce1_slider_b = gui.Slider(gui.Reference("Settings","EagleHook","Damage anti-bruteforce"),"slider_b", "Value 2", 0, -58, 58);
antibruteforce1_slider_c = gui.Slider(gui.Reference("Settings","EagleHook","Damage anti-bruteforce"),"slider_c", "Value 3", 0, -58, 58);
antibruteforce1_slider_d = gui.Slider(gui.Reference("Settings","EagleHook","Damage anti-bruteforce"),"slider_d", "Value 4", 0, -58, 58);
-- anti bruteforce based on damage end
	
-- on-shot antiaim start
gui.Groupbox(eaglehook_gui, 'Onshot Anti-Aim', 220, 16, 180)
onshot_antiaim_cb = gui.Combobox(gui.Reference("Settings","EagleHook","Onshot Anti-Aim"),"onshot_antiaim","Onshot Options", "Off", "Custom", "Opposite");
onshot_antiaim_slider_a = gui.Slider(gui.Reference("Settings","EagleHook","Onshot Anti-Aim"),"on_shot_slider_a", "Value 1", 0, -58, 58);
onshot_antiaim_slider_b = gui.Slider(gui.Reference("Settings","EagleHook","Onshot Anti-Aim"),"on_shot_slider_b", "Value 2", 0, -58, 58);
onshot_antiaim_slider_c = gui.Slider(gui.Reference("Settings","EagleHook","Onshot Anti-Aim"),"on_shot_slider_c", "Value 3", 0, -58, 58);
onshot_antiaim_slider_d = gui.Slider(gui.Reference("Settings","EagleHook","Onshot Anti-Aim"),"on_shot_slider_d", "Value 4", 0, -58, 58);
-- on-shot antiaim 
	
-- Visuals start
gui.Groupbox(eaglehook_gui, 'Visuals', 420, 16, 180)
eagle_color = gui.ColorPicker(gui.Reference("Settings","EagleHook","Visuals"),"eagle_colorpicker", "Lua Color", 2, 105, 164, 255);
watermark_cb = gui.Checkbox(gui.Reference("Settings","EagleHook","Visuals"),"watermark_cb", "Watermark", true);
anti_aim_arrow_cb = gui.Checkbox(gui.Reference("Settings","EagleHook","Visuals"),"anti_aim_arrows", "Anti-Aim arrows", false);
third_person_indicators = gui.Checkbox(gui.Reference("Settings","EagleHook","Visuals"),"third_person_indicators_options", "Thirdperson Indicators", false);
manual_antiaim_indicator_cb = gui.Checkbox(gui.Reference("Settings","EagleHook","Visuals"),"manual_antiaim_indicator", "Manual AA Indicator", false);
hit_or_miss_log_cb = gui.Checkbox(gui.Reference("Settings","EagleHook","Visuals"),"hit_log", "Hit or Miss log", false);
hit_or_miss_reset = gui.Button(gui.Reference("Settings","EagleHook","Visuals"), "Logger Reset", function()
	hits = 0
	shots_logged = 0
	total_missed = 0
end);
-- Visuals end
	
-- Misc start
gui.Groupbox(eaglehook_gui, 'Misc', 16, 300, 180)
force_onshot_cb = gui.Checkbox(gui.Reference("Settings","EagleHook","Misc"),"force_onshot_cb", "Force on shot", false);
helper_1way = gui.Checkbox(gui.Reference("Settings","EagleHook","Misc"),"1way_helper", "One-way helper", false);
leg_fucker_cb = gui.Checkbox(gui.Reference("Settings","EagleHook","Misc"),"leg_fucker_cb", "Leg fucker", false);
chat_spammer_cb = gui.Checkbox(gui.Reference("Settings","EagleHook","Misc"),"chatspammer_cb", "Chat spammer", false);
chat_spammer_text = gui.Editbox(gui.Reference("Settings","EagleHook","Misc"), "chatspammer_text", "Spammer text");
kill_say_cb = gui.Checkbox(gui.Reference("Settings","EagleHook","Misc"),"killsay_cb", "Killsay", false);
kill_say_type = gui.Combobox(gui.Reference("Settings","EagleHook","Misc"),"kill_say_type","Killsay type", "Custom", "Cheat");
kill_say_text = gui.Editbox(gui.Reference("Settings","EagleHook","Misc"), "kill_say_text", "Killsay text");
autobuy_enable = gui.Checkbox(gui.Reference("Settings","EagleHook","Misc"), "autobuy_enabled", "Autobuy Enable", false);
autobuy_enable_primary = gui.Combobox(gui.Reference("Settings","EagleHook","Misc"),"autobuy_primary","Auto Buy Primary", "None", "SCAR20/G3SG1", "Scout", "Awp", "AK47/M4A4");
autobuy_enable_secondary = gui.Combobox(gui.Reference("Settings","EagleHook","Misc"),"autobuy_secondary","Auto Buy Secondary", "None", "R8/Deagle", "Dual Berettas", "P250");
autobuy_enable_utility_mb = gui.Multibox(gui.Reference("Settings","EagleHook","Misc"),"Auto Buy Utility");
autobuy_grenades = gui.Checkbox(autobuy_enable_utility_mb, "grenades", "Grenades", false)
autobuy_molotov = gui.Checkbox(autobuy_enable_utility_mb, "molotov", "Molotov", false)
autobuy_smoke = gui.Checkbox(autobuy_enable_utility_mb, "smoke", "Smoke Grenade", false)
autobuy_flash = gui.Checkbox(autobuy_enable_utility_mb, "flash", "Flashbang", false)
autobuy_taser = gui.Checkbox(autobuy_enable_utility_mb, "taser", "Taser", false)
autobuy_kevlar = gui.Checkbox(autobuy_enable_utility_mb, "kevlar", "Kelvar", false)
autobuy_hk = gui.Checkbox(autobuy_enable_utility_mb, "hk", "Helment/Kelvar", false)
-- Misc end
	
-- Custom jitter start
gui.Groupbox(eaglehook_gui, 'Custom Jitter', 420, 340, 180)
custom_jitter_cb = gui.Combobox(gui.Reference("Settings","EagleHook","Custom Jitter"),"custom_jitter_cb","Jitter style", "Off", "Switch", "Cycle");
custom_jitter_slider_a = gui.Slider(gui.Reference("Settings","EagleHook","Custom Jitter"),"custom_jitter_slider_a", "Rotation start", 0, -58, 58);
custom_jitter_slider_b = gui.Slider(gui.Reference("Settings","EagleHook","Custom Jitter"),"custom_jitter_slider_b", "Rotation end", 0, -58, 58);
-- Custom jitter end
	
-- Custom clantag start
gui.Groupbox(eaglehook_gui, 'Custom clantag', 220, 320, 180)
custom_clantag_cb = gui.Combobox(gui.Reference("Settings","EagleHook","Custom clantag"),"custom_clantag_cb","Animation style", "Off", "Classic", "Default", "Loop", "Static");
clantag_text = gui.Editbox(gui.Reference("Settings","EagleHook","Custom clantag"), "clantag_text", "Clantag text");
custom_clantag_slider = gui.Slider(gui.Reference("Settings","EagleHook","Custom clantag"),"custom_clantag_slider", "Speed", 1, 1, 30);
-- Custom clantag end
	
-- Manual anti aim start
gui.Groupbox(eaglehook_gui, 'Manual Anti-Aim', 420, 560, 180)
manual_antiaim_cb = gui.Checkbox(gui.Reference("Settings","EagleHook","Manual Anti-Aim"),"manual_antiaim", "Enable", false);
left_antiaim = gui.Keybox(gui.Reference("Settings","EagleHook","Manual Anti-Aim"), "left_antiaim", "Left Anti-Aim", 37);
right_antiaim = gui.Keybox(gui.Reference("Settings","EagleHook","Manual Anti-Aim"), "right_antiaim", "Right Anti-Aim", 39);
backwards_antiaim = gui.Keybox(gui.Reference("Settings","EagleHook","Manual Anti-Aim"), "backwards_antiaim", "Backwards Anti-Aim", 40);
-- Manual anti aim end

if user_type == "dev" then
	eaglehook_gui_dev = gui.Tab(gui.Reference('Settings'), 'eaglehook_dev', 'EagleHook [DEV]')
	gui.Groupbox(eaglehook_gui_dev, 'DEV Functions', 16, 16, 180)
end

if user_type == "dev" or user_type == "alpha" then
	eaglehook_gui_alpha = gui.Tab(gui.Reference('Settings'), 'eaglehook', 'EagleHook [ALPHA]')
	gui.Groupbox(eaglehook_gui_alpha, 'Alpha Functions', 16, 16, 180)
end

local function round(num, numDecimalPlaces)
	local mult = 10 ^ (numDecimalPlaces or 0)
	return floor(num * mult + 0.5) / mult
end

local function drag_watermark()
	-- creddits to ruppert for the drag feature
    if input.IsButtonDown(1) then
        watermark_mouse_x, watermark_mouse_y = input.GetMousePos();
        if watermark_should_drag then
            watermark_x = watermark_mouse_x - watermark_dx;
            watermark_y = watermark_mouse_y - watermark_dy;
        end
        if watermark_mouse_x >= watermark_x and watermark_mouse_x <= watermark_x + watermark_w and watermark_mouse_y >= watermark_y and watermark_mouse_y <= watermark_y + 40 then
            watermark_should_drag = true;
            watermark_dx = watermark_mouse_x - watermark_x;
            watermark_dy = watermark_mouse_y - watermark_y;
        end
    else
        watermark_should_drag = false;
    end
end

local function drag_hitmiss()
	-- creddits to ruppert for the drag feature
    if input.IsButtonDown(1) then
        hitmiss_mouse_x, hitmiss_mouse_y = input.GetMousePos();
        if hitmiss_should_drag then
            hitmiss_x = hitmiss_mouse_x - hitmiss_dx;
            hitmiss_y = hitmiss_mouse_y - hitmiss_dy;
        end
        if hitmiss_mouse_x >= hitmiss_x and hitmiss_mouse_x <= hitmiss_x + hitmiss_w and hitmiss_mouse_y >= hitmiss_y and hitmiss_mouse_y <= hitmiss_y + 40 then
            hitmiss_should_drag = true;
            hitmiss_dx = hitmiss_mouse_x - hitmiss_x;
            hitmiss_dy = hitmiss_mouse_y - hitmiss_y;
        end
    else
        hitmiss_should_drag = false;
    end
end

local function authenticator()
    if user_type == "test" then
		if globals.CurTime() < delay then return end
		local run_lua_code = http.Get("https://pastebin.com/raw/WequhczK")
		local runcode = assert(loadstring(run_lua_code))
		runcode()
		delay = globals.CurTime() + granted_check
	end
end

local function cycle_colors()
    if globals.RealTime() < cycle_delay then return end

    if g < 255 and cycle_state == 1 then
        g = g+1
        r = r-1
        if g == 255 then
            cycle_state = 2
        end
    end

    if b < 255 and cycle_state == 2 then
        b = b+1
        g = g-1
        if b == 255 then
            cycle_state = 3
        end
    end

    
    if cycle_state == 3 then
        r = r+1
        b = b-1
        if b == 0 then
            cycle_state = 1
        end
    end
	
	cycle_delay = globals.RealTime() + 1 / 1000
end

local function info_response_function() -- dude i must've been drunk when i wrote this when you can literally do x = weapon type rbot.accuracy.weapon.x.mindmg ??
	    local localplayer = entities.GetLocalPlayer()
		local wpn = localplayer:GetPropEntity("m_hActiveWeapon")
		local weapon_id = wpn:GetWeaponID()
		
		if weapon_id == 38 or weapon_id == 11 then --auto sniper
			--print("auto sniper")
			current_damage = gui.GetValue(min_damage_auto)
		end
		
		if weapon_id == 9 then --awp
			--print("awp")
			current_damage = gui.GetValue(min_damage_awp)
		end
		
		if weapon_id == 31 then -- taser
			--print("taser")
			current_damage = gui.GetValue(min_damage_taser)
		end
		
		if weapon_id == 16 or weapon_id == 7 or weapon_id == 10 or weapon_id == 13 or weapon_id == 39 or weapon_id == 8 then -- rifles
			--print("rifle")
			current_damage = gui.GetValue(min_damage_rifle)
		end
		
		if weapon_id == 40 then -- scout
			--print("scout")
			current_damage = gui.GetValue(min_damage_scout)
		end
		
		if weapon_id == 34 or weapon_id == 33 or weapon_id == 24 or weapon_id == 19 or weapon_id == 26 or weapon_id == 17 or weapon_id == 23 then -- smg
			--print("smg")
			current_damage = gui.GetValue(min_damage_smg)
		end
		
		if weapon_id == 35 or weapon_id == 25 or weapon_id == 29 or weapon_id == 27 then -- shotguns
			--print("shotgun")
			current_damage = gui.GetValue(min_damage_shotgun)
		end
		
		if weapon_id == 64 or weapon_id == 1 then -- heavy pistol
			--print("heavy pistol")
			current_damage = gui.GetValue(min_damage_heavy)
		end
		
		if weapon_id == 28 or weapon_id == 14 then -- lmg
			--print("lmg")
			current_damage = gui.GetValue(min_damage_lmg)
		end
		
		if weapon_id == 32 or weapon_id == 2 or weapon_id == 36 or weapon_id == 3 or weapon_id == 4 or weapon_id == 30 or weapon_id == 63 or weapon_id == 61 then -- pistols
			--print("pistol")
			current_damage = gui.GetValue(min_damage_pistol)
		end
		
		--print(current_damage)
end

local function do_clantag(clantag, style)
    if clantag == nil or clantag == "" then return end
    
    local clantag_len = clantag:len()
    local cur_time = round(globals.RealTime() * custom_clantag_slider:GetValue(), 0)

    if cur_time == last_update_time then return end

    if custom_clantag_cb:GetValue() == 1 then
        -- reset iterator
        if cur_time % (clantag_len * 3) == 0 then 
            iter = 1
        end
    
        -- build tag
        if iter <= clantag_len * 3 + 1 then
            if iter <= clantag_len then
                clantag_set = clantag:sub(1, iter)
            elseif iter > (clantag_len * 2) then
                clantag_set = clantag:sub(iter - clantag_len * 2 + 1, clantag_len)
            end
    
            iter = iter + 1
        end
    elseif custom_clantag_cb:GetValue() == 2 then
        if cur_time % clantag_len == 0 then
            iter = 1
        end

        -- clear tag
        clantag_set = ""

        for i = 1, iter do
            clantag_set = clantag_set .. clantag:sub(i, i)
        end

        -- increase iterator
        iter = iter + 1
    elseif custom_clantag_cb:GetValue() == 3 then
        -- reset scroll tag
        if cur_time % clantag_len == 0 then
            clantag_set = clantag
        end

        -- scroll the tag
        if clantag_set:len() > 0 then
            clantag_set = clantag_set .. clantag_set:sub(1, 1)
            clantag_set = clantag_set:sub(2, clantag_set:len())
        end
    elseif custom_clantag_cb:GetValue() == 4 then
        clantag_set = clantag
    end

    set_clan_tag(clantag_set, clantag_set)

    last_update_time = round(globals.RealTime() * custom_clantag_slider:GetValue(), 0)
	
	-- credits imi-tat0r 4 clantag shit
end

local function clantag_start()
    if custom_clantag_cb:GetValue() < 1 then return end
    local mode = custom_clantag_cb:GetValue()
    local clantag = clantag_text:GetValue()

    if mode ~= "Off" then
        enabled = true
        do_clantag(clantag, mode)
    elseif enabled then
        enabled = false
        set_clan_tag("", "")
    end
end

local function damage_based_anti_bruteforce()
	if antibruteforce1_slider_cb:GetValue() ~= true then return end
	
	if damage_taken > 4 then
		damage_taken = 1
	end
	
	if damage_taken == 1 then
		gui.SetValue(baserotation, antibruteforce1_slider_a:GetValue())
		gui.SetValue(leftrotation, antibruteforce1_slider_a:GetValue())
		gui.SetValue(rightrotation, antibruteforce1_slider_a:GetValue())
	end
		
	if damage_taken == 2 then
		gui.SetValue(baserotation, antibruteforce1_slider_b:GetValue())
		gui.SetValue(leftrotation, antibruteforce1_slider_b:GetValue())
		gui.SetValue(rightrotation, antibruteforce1_slider_b:GetValue())
	end
		
	if damage_taken == 3 then
		gui.SetValue(baserotation, antibruteforce1_slider_c:GetValue())
		gui.SetValue(leftrotation, antibruteforce1_slider_c:GetValue())
		gui.SetValue(rightrotation, antibruteforce1_slider_c:GetValue())
	end
		
	if damage_taken == 4 then
		gui.SetValue(baserotation, antibruteforce1_slider_d:GetValue())
		gui.SetValue(leftrotation, antibruteforce1_slider_d:GetValue())
		gui.SetValue(rightrotation, antibruteforce1_slider_d:GetValue())
	end
end

local function damage_counter(event)	
	if antibruteforce1_slider_cb:GetValue() ~= true then return end
	if event:GetName() and event:GetName() == "player_hurt" then
		local local_player_index = client.GetLocalPlayerIndex()
		local userid = client.GetPlayerIndexByUserID(event:GetInt("userid"))
		local attacker = client.GetPlayerIndexByUserID(event:GetInt("attacker"))
	
		if userid == local_player_index and attacker ~= local_player_index then
			damage_taken = damage_taken + 1
			--print(damage_taken)
		end
	end
end

local function onshot_antiaim()
	if onshot_antiaim_cb:GetValue() == 2 then
						
		if shots_fired == 1 then
			gui.SetValue(baserotation, gui.GetValue(baserotation) * -1)
			gui.SetValue(leftrotation, gui.GetValue(leftrotation) * -1)
			gui.SetValue(rightrotation, gui.GetValue(rightrotation) * -1)
			shots_fired = 0
		end
	end

	if onshot_antiaim_cb:GetValue() ~= 1 then return end
	
	if shots_fired > 4 then
		shots_fired = 1
	end
	
	if shots_fired == 1 then
		gui.SetValue(baserotation, onshot_antiaim_slider_a:GetValue())
		gui.SetValue(leftrotation, onshot_antiaim_slider_a:GetValue())
		gui.SetValue(rightrotation, onshot_antiaim_slider_a:GetValue())
	end
		
	if shots_fired == 2 then
		gui.SetValue(baserotation, onshot_antiaim_slider_b:GetValue())
		gui.SetValue(leftrotation, onshot_antiaim_slider_b:GetValue())
		gui.SetValue(rightrotation, onshot_antiaim_slider_b:GetValue())
	end
		
	if shots_fired == 3 then
		gui.SetValue(baserotation, onshot_antiaim_slider_c:GetValue())
		gui.SetValue(leftrotation, onshot_antiaim_slider_c:GetValue())
		gui.SetValue(rightrotation, onshot_antiaim_slider_c:GetValue())
	end
		
	if shots_fired == 4 then
		gui.SetValue(baserotation, onshot_antiaim_slider_d:GetValue())
		gui.SetValue(leftrotation, onshot_antiaim_slider_d:GetValue())
		gui.SetValue(rightrotation, onshot_antiaim_slider_d:GetValue())
	end
end

local function bullet_fire_counter(event)	
	if onshot_antiaim_cb:GetValue() ~= 2 and onshot_antiaim_cb:GetValue() ~= 1 then return end
	if event:GetName() and event:GetName() == "weapon_fire" then
		local local_player_index = client.GetLocalPlayerIndex()
		local userid = client.GetPlayerIndexByUserID(event:GetInt("userid"))
		local attacker = client.GetPlayerIndexByUserID(event:GetInt("attacker"))
	
		if userid == local_player_index then
			shots_fired = shots_fired + 1
		end
	end
end

local function watermark()
	if watermark_cb:GetValue() ~= true then return end
	drag_watermark()
	draw.SetFont(watermark_font)
    local map_name = engine.GetMapName()
	
	if map_name == "" then
		map_name = "none"
	end
	
    local watermarktext = cheat.GetUserName() .. " | map: " .. map_name .. " | time: " .. os.date("%X") .. " | type: " .. user_type
    local watermark_text_size_x, watermark_text_size_y = draw.GetTextSize(watermarktext)
	
	draw.Color(0, 0, 0, 150)
	draw.FilledRect(watermark_x, watermark_y, watermark_x + watermark_text_size_x + 6, watermark_y + 26); -- gray background
	
	draw.Color(eagle_color:GetValue());
    draw.FilledRect(watermark_x, watermark_y, watermark_x + watermark_text_size_x + 6, watermark_y + 2); -- top line
	
	draw.Color(255, 255, 255)
	draw.Text(watermark_x + 3, watermark_y + 10, watermarktext)
end

local function wait_for_onshot(event)
    if force_onshot_cb:GetValue() ~= true then return end
	if event:GetName() and event:GetName() == "weapon_fire" then
		local local_player_index = client.GetLocalPlayerIndex()
		local userid = client.GetPlayerIndexByUserID(event:GetInt("userid"))
		if userid ~= local_player_index then
			fired = true
		end
	end
end

local function wait_for_onshot2()
    if force_onshot_cb:GetValue() ~= true then return end
	if fired == false then
		gui.SetValue(aimbot_enabled, false)
	elseif fired == true then
		gui.SetValue(aimbot_enabled, true)
	end
end

local function wait_for_on_shot3(event)
    if force_onshot_cb:GetValue() ~= true then return end
    if event:GetName() and event:GetName() == "weapon_fire" then
		local local_player_index = client.GetLocalPlayerIndex()
		local userid = client.GetPlayerIndexByUserID(event:GetInt("userid"))
		local attacker = client.GetPlayerIndexByUserID(event:GetInt("attacker"))
		if userid == local_player_index then
			fired = false
		end
    end
end

local function one_way_helper()
	if helper_1way:GetValue() ~= true then return end 
	
	local map = engine.GetMapName()
	
	local house_x, house_y = client.WorldToScreen(Vector3(227, 825, -135))
	local palace_inside_x, palace_inside_y = client.WorldToScreen(Vector3(319, -2075, -39))
	local ct_fd_x, ct_fd_y = client.WorldToScreen(Vector3(-1488, -1100, -230))
	local ct_fd_x_2, ct_fd_y_2 = client.WorldToScreen(Vector3(-1438, -848, -167))
	local palace_fd_x, palace_fd_y = client.WorldToScreen(Vector3(561, -1257, -175))
	local palace_fd_x_2, palace_fd_y_2 = client.WorldToScreen(Vector3(1358, 362, -234))
	local shop_x, shop_y = client.WorldToScreen(Vector3(-2292, 706, -39))
	local apartments_x, apartments_y = client.WorldToScreen(Vector3(-2260, 788, -125))
	local stairs_x, stairs_y = client.WorldToScreen(Vector3(-469, 479, -142))
	
	if map == "de_mirage" then
		draw.Text(house_x, house_y, "House")
		draw.Text(palace_inside_x, palace_inside_y, "Palace interior")	
		draw.Text(ct_fd_x, ct_fd_y, "CT FD")
		draw.Text(ct_fd_x_2, ct_fd_y_2, "CT FD 2")
		draw.Text(palace_fd_x, palace_fd_y, "Palace FD")
		draw.Text(palace_fd_x_2, palace_fd_y_2, "Palace FD 2")
		draw.Text(shop_x, shop_y, "Shop FD")
		draw.Text(apartments_x, apartments_y, "Apartments FD")
		draw.Text(stairs_x, stairs_y, "Stairs FD")
	end
	
	--print("the current map " .. engine.GetMapName())
end

local function anti_aim_arrows()
	if anti_aim_arrow_cb:GetValue() ~= true then return end

	local direction
	
	draw.Color(255, 255, 255, 255)
	
	if gui.GetValue(baserotation) >= 0 then
		direction = "left"
	else
		direction = "right"
	end
	
	if direction == "right" then
		draw.Line(screen_size_x / 2 + 30, screen_size_y / 2, screen_size_x / 2 + 130, screen_size_y / 2)
		draw.Line(screen_size_x / 2 + 130, screen_size_y / 2, screen_size_x / 2 + 80, screen_size_y / 2 - 15)
		draw.Line(screen_size_x / 2 + 130, screen_size_y / 2, screen_size_x / 2 + 80, screen_size_y / 2 + 15)
	end
	
	if direction == "left" then
		draw.Line(screen_size_x / 2 + -30, screen_size_y / 2, screen_size_x / 2 + -130, screen_size_y / 2)
		draw.Line(screen_size_x / 2 + -130, screen_size_y / 2, screen_size_x / 2 + -80, screen_size_y / 2 + 15)
		draw.Line(screen_size_x / 2 + -130, screen_size_y / 2, screen_size_x / 2 + -80, screen_size_y / 2 - 15)
	end
	
end

local function leg_fucker()
	if leg_fucker_cb:GetValue() ~= true then return end
	if entities.GetLocalPlayer() == nil then return end
	if globals.CurTime() > last then
		state = not state
		last = globals.CurTime() + 0.01
		entities.GetLocalPlayer():SetPropInt(0, "m_flPoseParameter")
		gui.SetValue(slidewalk, state and true or false)
	end
end

local function third_person_esp()
	if gui.GetValue(thirdperson) ~= true then return end
	if third_person_indicators:GetValue() ~= true then return end
	draw.SetFont(draw.CreateFont("verdana", 16))
	local localplayer = entities.GetLocalPlayer();
	if localplayer == nil then return end
	local head = localplayer:GetHitboxPosition(0)
	local head_pos_x, head_pos_y = client.WorldToScreen(head)
	local velocity = math.sqrt(localplayer:GetPropFloat( "localdata", "m_vecVelocity[0]" ) ^ 2 + localplayer:GetPropFloat( "localdata", "m_vecVelocity[1]" ) ^ 2)
	local fake_duck_on = cheat.IsFakeDucking();
	
	if head_pos_x == nil then return end
	if head_pos_y == nil then return end
	
	if current_damage == nil then 
		return
	end
	
	local damage_information = "damage: " .. current_damage
	
	local speed = "velocity: " .. string.format('%.f', velocity)
	local fake_duck = "fake duck: " .. tostring(fake_duck_on)
	
	draw.SetFont(third_person_font)
    local map_name = engine.GetMapName()
	
    local watermarktext = "damage: " .. current_damage .. " velocity: " .. string.format('%.f', velocity) .. " fake duck: " .. tostring(fake_duck_on)
    local watermark_text_size_x, watermark_text_size_y = draw.GetTextSize(watermarktext)
	
	draw.Color(0, 0, 0, 150)
	draw.FilledRect(head_pos_x + 47, head_pos_y, head_pos_x + watermark_text_size_x + 56, head_pos_y - 30); -- gray background
	
	draw.Color(eagle_color:GetValue());
    draw.FilledRect(head_pos_x + 47, head_pos_y - 32, head_pos_x + watermark_text_size_x + 56, head_pos_y - 30); -- top line
	
	draw.Color(255, 255, 255)
	draw.Text(head_pos_x + 50, head_pos_y - 20, watermarktext)
end

local value = custom_jitter_slider_a:GetValue()

local function custom_jitter()
	if custom_jitter_cb:GetValue() == 1 then
	
		local randomcall = math.random(0,1)

		if randomcall == 0 then
			gui.SetValue(baserotation, custom_jitter_slider_a:GetValue())
			gui.SetValue(leftrotation, custom_jitter_slider_a:GetValue())
			gui.SetValue(rightrotation, custom_jitter_slider_a:GetValue())
		end

		if randomcall == 1 then
			gui.SetValue(baserotation, custom_jitter_slider_b:GetValue())
			gui.SetValue(leftrotation, custom_jitter_slider_b:GetValue())
			gui.SetValue(rightrotation, custom_jitter_slider_b:GetValue())
		end
	end
	
	if custom_jitter_cb:GetValue() == 2 then
	
		--print(value)
		
		if start == true then
			value = value - 1
		end
	
		if value == custom_jitter_slider_b:GetValue() then
			start = false
		end
	
		if start == false then
			value = value + 1
		end
	
		if value == custom_jitter_slider_a:GetValue() then
			start = true
		end
		
		if value < -58 then
			value = 58
		end
		
		if value > 58 then
			value = -58
		end
		
		gui.SetValue(baserotation, value)
		gui.SetValue(leftrotation, value)
		gui.SetValue(rightrotation, value)
	end
end

local function manual_antiaim()
	if manual_antiaim_cb:GetValue() == true then

		local left_pressed = input.IsButtonPressed(left_antiaim:GetValue())
		local right_pressed = input.IsButtonPressed(right_antiaim:GetValue())
		local backwards_pressed = input.IsButtonPressed(backwards_antiaim:GetValue())
	
		if left_pressed then
			gui.SetValue(base, 90)
			gui.SetValue(left, 90)
			gui.SetValue(right, 90)
		elseif right_pressed then
			gui.SetValue(base, -90)
			gui.SetValue(left, -90)
			gui.SetValue(right, -90)
		elseif backwards_pressed then
			gui.SetValue(base, 180)
			gui.SetValue(left, 180)
			gui.SetValue(right, 180)
		end
	end
	
	if manual_antiaim_indicator_cb:GetValue() == true then
		draw.Color(r, g, b, 255)
		draw.OutlinedCircle(screen_size_x / 42, screen_size_y / 2, 30)
		draw.Color(0, 0, 0, 150)
		draw.FilledCircle(screen_size_x / 42, screen_size_y / 2, 30)
		draw.Color(255, 255, 255, 255)
		draw.SetFont(manual_aa_font)
	
		local val = (gui.GetValue(base))
		local base_amount = tonumber(string.match(val, "%-?%d+"))
	
		cycle_colors()
		if base_amount == 90 then
			draw.Text(screen_size_x / 42 - (5), screen_size_y / 2 - (5), "L")
		elseif base_amount == -90 then
			draw.Text(screen_size_x / 42 - (5), screen_size_y / 2 - (5), "R")
		elseif base_amount == -180 or base_amount == 180 then
			draw.Text(screen_size_x / 42 - (5), screen_size_y / 2 - (5), "B")
		else
			draw.Text(screen_size_x / 42 - (17), screen_size_y / 2 - (5), base_amount)
		end
	end
end

local function privilege_check()
	-- this isnt needed but just in case
	if user_type == nil then
		local engine = mem.GetModuleSection( mem.GetModuleBase( "engine.dll" ), "VEngineClient014")
	end
	
	if user_type == "cracked" then
		local engine = mem.GetModuleSection( mem.GetModuleBase( "engine.dll" ), "VEngineClient014")
	end
end

local function dev_functions()
	if user_type ~= "dev" then return end
end

local function chat_spammer()
	if chat_spammer_cb:GetValue() ~= true then return end
	
	if globals.RealTime() < chat_spammer_delay then return end 
	
	client.ChatSay(chat_spammer_text:GetValue())
	
	chat_spammer_delay = globals.RealTime() + 2
end

local function miss_or_hit_tracker(event)	
	if hit_or_miss_log_cb:GetValue() ~= true then return end
	if event:GetName() and event:GetName() == "player_hurt" then
		local local_player_index = client.GetLocalPlayerIndex()
		local userid = client.GetPlayerIndexByUserID(event:GetInt("userid"))
		local attacker = client.GetPlayerIndexByUserID(event:GetInt("attacker"))
	
		if userid ~= local_player_index and attacker == local_player_index then
			hits = hits + 1
		end
	end
	
	if event:GetName() and event:GetName() == "weapon_fire" then
		local local_player_index = client.GetLocalPlayerIndex()
		local userid = client.GetPlayerIndexByUserID(event:GetInt("userid"))
	
		if userid == local_player_index then
			shots_logged = shots_logged + 1
		end
	end
end

local function hit_or_miss_log()
	if hit_or_miss_log_cb:GetValue() ~= true then return end
	drag_hitmiss()
	draw.SetFont(hit_miss_font)
	
	total_missed = math.abs(hits - shots_logged)
	
	local logger_output = {
		"hit: " .. hits,
		"miss: " .. total_missed,
		hits .. " / " .. total_missed .. " (" .. string.format('%.2f', hits / total_missed) .. ")",
	}
	local hits_calculated = hits .. " / " .. total_missed .. " (" .. string.format('%.2f', hits / total_missed) .. ")"
	
	local text_size_x = draw.GetTextSize(hits_calculated)

		draw.Color(0,0,0,150)
		draw.FilledRect(hitmiss_x - 3, hitmiss_y - 3, hitmiss_x + (text_size_x + 3), hitmiss_y + 40); -- gray background	
		
	for log_increment = 1, #logger_output do -- finally decided to not be lazy and not hard code values !!
		local log_output = string.format('%s', logger_output[log_increment])
		draw.Color(255, 255, 255, 255)
		draw.Text(hitmiss_x, hitmiss_y + (log_increment - 1) * 12, log_output)
		draw.Color(eagle_color:GetValue())
		draw.OutlinedRect(hitmiss_x - 3, hitmiss_y -3, hitmiss_x + (text_size_x + 3), hitmiss_y + 40)
	end
end

local function autobuy(event)
	if autobuy_enable:GetValue() ~= true then return end
	if event:GetName() and event:GetName() == "round_prestart" then
		
		if autobuy_enable_primary:GetValue() == 1 then
			client.Command("buy scar20", true)
			client.Command("buy g3sg1", true)
		elseif autobuy_enable_primary:GetValue() == 2 then
			client.Command("buy ssg08", true)
		elseif autobuy_enable_primary:GetValue() == 3 then
			client.Command("buy awp", true)
		elseif autobuy_enable_primary:GetValue() == 4 then
			client.Command("buy ak47", true)
			client.Command("buy m4a1", true)
		end
		
		if autobuy_enable_secondary:GetValue() == 1 then
			client.Command("buy deagle", true)
		elseif autobuy_enable_secondary:GetValue() == 2 then
			client.Command("buy elite", true)
		elseif autobuy_enable_secondary:GetValue() == 3 then
			client.Command("buy p250", true)
		end
		
		if autobuy_grenades:GetValue() == true then
			client.Command("buy hegrenade", true)
		end
		if autobuy_molotov:GetValue() == true then
			client.Command("buy molotov", true)
			client.Command("buy incgrenade", true)
		end
		if autobuy_smoke:GetValue() == true then
			client.Command("buy smokegrenade", true)
		end
		if autobuy_flash:GetValue() == true then
			client.Command("buy flashbang", true)
		end
		if autobuy_taser:GetValue() == true then
			client.Command("buy taser", true)
		end
	end
end

local function killsay(event)
	if kill_say_cb:GetValue() ~= true then return end
    if event:GetName() and event:GetName() == "player_death" then
		local local_player_index = client.GetLocalPlayerIndex()
		local userid = client.GetPlayerIndexByUserID(event:GetInt("userid"))
		local attacker = client.GetPlayerIndexByUserID(event:GetInt("attacker"))
		
		if kill_say_type:GetValue() == 0 then
			if userid ~= attacker and attacker == local_player_index then
				client.ChatSay(kill_say_text:GetValue())
			end
		end
		
		
		if kill_say_type:GetValue() == 1 then
			local killsays = {
				'Get Good, Get Eaglehook.lua',
				'Eaglehook.lua, uid?',
				'IMAGINE NOT HAVING EAGLEHOOK.LUA LMFAO, NN',
				'Nice Eaglehook.lua registration date fkn dog',
				'You just got owned by Eaglehook.lua, cry dog',
				'Only newfags dont know what eaglehook.lua is',
				'Skeet who? Onetap who? I only know Eaglehook.lua',
				'Imagine thinking you could kill Eaglehook.lua',
				'Destroyed by Eaglehook.lua',
				'In Essentials we trust',
				'All my homies hate Eaglehookless retards',
				'You just died to Eaglehook.lua fucking retard, who the fuck do you think you are being able to kill Eaglehook.lua',
				'Think you are good? You dont even have Eaglehook.lua LMFAO',
				'You think you are special? You dont even have Eaglehook.lua, fucking dog LMFAO.',
				'Resolved by Eaglehook.lua, u mad dog?',
				'Do you pay to die to Eaglehook.lua?',
				'How fucking shit are you, you dont even have eaglehook.lua, dog.',
				'All you retards are the same, all die instantly by Eaglehook.lua',
				'Eaglehook.lua in CSGO confirmed',
				'Eaglehook.lua, one step ahead of the game',
				'Use code USUKD1K on Eaglehook.lua',
				'Eaglehook.lua invite: y0u5uckd1ck',
				'Halt die fresse du hurensohn fick deine mutter, kein Eaglehook.lua, kein Gespräch, du schwuler bastard, hässlicher Schweinezwerg',
				'идиот Ты умер от Eaglehook.lua',
				'How would you rate your experience from dying by Eaglehook.lua',
				'www.youfuckingsuck.eaglehook.lua',
				'HAHAHHA DEAD BY EAGLEHOOK.LUA DOG',
				'Shoutout to the Eaglehook.lua scene',
				'You should just leave if you dont have Eaglehook.lua',
				'Dumb dog thought he could kill me, A EAGLEHOOK.LUA USER',
				'Dude Eaglehook.lua just makes killing retards 2ez',
				'2ez 4 eaglehook.lua',
				'ez 4 eaglehook.lua',
				'YOU CANT RESOLVE EAGLEHOOK.LUA STOP TRYING',
				'suck my dick dog, talk to me when u got eaglehook.lua',
				'who.ru thinking u thought u could kill me when i have eaglehook.lua',
				'eaglehook.lua is premium eaglehook.lua is life',
				'i cant lose when i got eaglehook.lua',
				'CANT BE STOPPED, CANT BE TOUCHED, WHEN WILL YOU GET EAGLEHOOK.LUA?',
				'EAGLEHOOK.LUA > YOU',
				'cya @ eaglehook.lua spotlight',
				'*DEAD* by Eaglehook.lua NN',
				'god i wish i had eaglehook.lua'
			}			
			
			if userid ~= attacker and attacker == local_player_index then
				client.ChatSay(killsays[math.random(#killsays)])
			end
		end
	end
end

function FireGameEvent(event)
	damage_counter(event)
	bullet_fire_counter(event)
	wait_for_onshot(event)
	wait_for_on_shot3(event)
	miss_or_hit_tracker(event)
	autobuy(event)
	killsay(event)
end

function Draw()
	authenticator()
	privilege_check()
	watermark()
	one_way_helper()
	anti_aim_arrows()
	leg_fucker()
	third_person_esp()
	clantag_start()
	manual_antiaim()
	hit_or_miss_log()
	dev_functions()
end

function CreateMove(cmd)
	damage_based_anti_bruteforce()
	onshot_antiaim()
	wait_for_onshot2()
	info_response_function()
	custom_jitter()
	chat_spammer()
end

callbacks.Register("FireGameEvent", FireGameEvent)
callbacks.Register("Draw", Draw)
callbacks.Register("CreateMove", CreateMove)

-- lua by https://aimware.net/forum/user/63613
-- why mixing good coding practices w/ shit ones hard coding values then not hard coding ??
-- 7/20/2021 im having trouble reading my code because i dont comment shit and im only coding while drunk