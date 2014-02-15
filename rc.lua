---------------------------------------------------------------------------
-- rc.lua awesome wm config -----------------------------------------------
---------------------------------------------------------------------------

rcType = "box"

---------------------------------------------------------------------------
-- include awesome libraries
---------------------------------------------------------------------------
gears = require("gears")
awful = require("awful")
awful.rules = require("awful.rules")
awful.autofocus = require("awful.autofocus")
wibox = require("wibox")
beautiful = require("beautiful")
naughty = require("naughty")
--menubar = require("menubar")
vicious  = require("vicious")

---------------------------------------------------------------------------
-- Run Command Functions
---------------------------------------------------------------------------
function run_or_raise(cmd, properties)
	local clients = client.get()
	local focused = awful.client.next(0)
	local findex = 0
	local matched_clients = {}
	local n = 0
	for i, c in pairs(clients) do
		--make an array of matched clients
		if match(properties, c) then
			n = n + 1
			matched_clients[n] = c
			if c == focused then
				findex = n
			end
		end
	end
   
	if n > 0 then
		local c = matched_clients[1]
		-- if the focused window matched switch focus to next in list
		if 0 < findex and findex < n then
			c = matched_clients[findex+1]
		end
		local ctags = c:tags()
		if #ctags == 0 then
			-- ctags is empty, show client on current tag
			local curtag = awful.tag.selected()
			awful.client.movetotag(curtag, c)
		else
			-- Otherwise, pop to first tag client is visible on
			awful.tag.viewonly(ctags[1])
		end
		-- And then focus the client
		client.focus = c
		c:raise()
		return
	end
	awful.util.spawn(cmd)
end

function run_once(cmd, ip)
	findme = cmd
	firstspace = cmd:find(" ")
	if firstspace then
		findme = cmd:sub(0, firstspace-1)
	end
	ip = ip or 0
	checkip = ""
	if ip == 1 then
		checkip = "ext-ip && "
	end
	awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. checkip .. cmd .. ")")
end 

---------------------------------------------------------------------------
-- Autostart
---------------------------------------------------------------------------

run_once("compton -C")
run_once("dropboxd", 1)
run_once("thunar")
run_once("chromium", 1)
awful.util.spawn_with_shell("urxvt")
awful.util.spawn_with_shell("urxvt")
if rcType == "box" then
	run_once("sudo rc11mod4.py")
	run_once("conky")
	run_once("mpd")
	run_once("parcellite")
end

---------------------------------------------------------------------------
-- Error handling
---------------------------------------------------------------------------

-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
	naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function (err)
	-- Make sure we don't go into an endless error loop
	if in_error then return end
		in_error = true
		naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
		in_error = false
	end)
end

---------------------------------------------------------------------------
-- Theme
---------------------------------------------------------------------------

beautiful.init("/home/viktor/.config/awesome/themes/colored/theme.lua")

---------------------------------------------------------------------------
-- Default Applications & Modkey
---------------------------------------------------------------------------

terminal = "urxvt"
editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor

modkey = "Mod4"

---------------------------------------------------------------------------
-- Init Desktop (Layouts, Wallpaper, Tags)
---------------------------------------------------------------------------

local layouts = {
	awful.layout.suit.floating,
	awful.layout.suit.tile,
	awful.layout.suit.tile.left,
	awful.layout.suit.tile.bottom,
	awful.layout.suit.tile.top,
	awful.layout.suit.fair,
	awful.layout.suit.fair.horizontal,
	-- awful.layout.suit.spiral,
	-- awful.layout.suit.spiral.dwindle,
	awful.layout.suit.max,
	-- awful.layout.suit.max.fullscreen,
	awful.layout.suit.magnifier
}

if beautiful.wallpaper then
	for s = 1, screen.count() do
		gears.wallpaper.maximized(beautiful.wallpaper, s, true)
	end
end

tags = {}
for s = 1, screen.count() do
    tags[s] = awful.tag({ " TERM ", " WEB ", " DATA ", " WORK ", 5, 6, 7, 8, 9 }, s, 
		{ layouts[2], layouts[2], layouts[2], layouts[2], layouts[2], layouts[2], layouts[2], layouts[2], layouts[2] })
end

---------------------------------------------------------------------------
-- Menu
---------------------------------------------------------------------------

myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
--menubar.utils.terminal = terminal -- Set the terminal for applications that require it
--menubar.set_icon_theme("Faenza")

---------------------------------------------------------------------------
-- Widgets ----------------------------------------------------------------
---------------------------------------------------------------------------

---------------------------------------------------------------------------
-- Clock
---------------------------------------------------------------------------

mytextclock = awful.widget.textclock()
mytextclockicon = wibox.widget.imagebox()
mytextclockicon:set_image(beautiful.widget_clock)

---------------------------------------------------------------------------
-- Kernel Info
---------------------------------------------------------------------------

sysicon = wibox.widget.imagebox()
sysicon:set_image(beautiful.widget_sys)
syswidget = wibox.widget.textbox()
vicious.register( syswidget, vicious.widgets.os, "<span color=\"".. beautiful.widget_magenta .."\">$2</span>")

---------------------------------------------------------------------------
-- Uptime
---------------------------------------------------------------------------

uptimeicon = wibox.widget.imagebox()
uptimeicon:set_image(beautiful.widget_uptime)
uptimewidget = wibox.widget.textbox()
vicious.register( uptimewidget, vicious.widgets.uptime, "<span color=\"".. beautiful.widget_red .."\">$2.$3'</span>")

---------------------------------------------------------------------------
-- HDD
---------------------------------------------------------------------------

fsicon = wibox.widget.imagebox()
fsicon:set_image(beautiful.widget_fs)
vicious.cache(vicious.widgets.fs)
fswidget = wibox.widget.textbox()
vicious.register(fswidget, vicious.widgets.fs, "<span color=\"".. beautiful.widget_green .."\">${/ used_p}%</span>", 10)

local function dispdisk()
	local f, infos
	local capi = {
		mouse = mouse,
		screen = screen
	}

	f = io.popen("dfc -d -q mount | grep /dev/sda")
	infos = f:read("*all")
	f:close()

	showdiskinfo = naughty.notify( {
		text	= infos,
		timeout	= 0,
        position = "top_right",
        margin = 10,
        height = 105,
        width = 620,
        border_color = beautiful.border_widget,
        border_width = 1,
        -- opacity = 0.95,
		screen	= capi.mouse.screen })
end

fswidget:connect_signal('mouse::enter', function () dispdisk(path) end)
fswidget:connect_signal('mouse::leave', function () naughty.destroy(showdiskinfo) end)

---------------------------------------------------------------------------
-- Spacers
---------------------------------------------------------------------------

rbracket = wibox.widget.textbox()
rbracket:set_text(']')
lbracket = wibox.widget.textbox()
lbracket:set_text('[')
line = wibox.widget.textbox()
line:set_text('|')
space = wibox.widget.textbox()
space:set_text(' ')

---------------------------------------------------------------------------
-- Battery
---------------------------------------------------------------------------

if rcType == "notebook" then

	function updateBattIcon()
		local handle = io.popen("cat /sys/class/power_supply/BAT0/status")
		local status = handle:read("*line")
		handle:close()
		local handle = io.popen("cat /sys/class/power_supply/BAT0/capacity")
		local cap = tonumber(handle:read("*line"))
		handle:close()
		if status == "Discharging" then
				if cap >= 40 then
					batticon:set_image(beautiful.widget_batt_full)
				elseif cap > 15 then
					batticon:set_image(beautiful.widget_batt_low)
				else
					batticon:set_image(beautiful.widget_batt_empty)
				end
		elseif status == "Charging" then
				batticon:set_image(beautiful.widget_batt_ac)
		else
				batticon:set_image(beautiful.widget_batt_empty)
		end
	end

	batticon = wibox.widget.imagebox()
	updateBattIcon()
	battwidget = wibox.widget.textbox()
	batt_warning = false
	vicious.register(battwidget, vicious.widgets.bat,
		function(widget, args)
			local color
			if args[2] >= 40 then
				color = beautiful.widget_green
				batt_warning = false
			elseif args[2] > 15 then
				color = beautiful.widget_yellow
				batt_warning = false
			else
				if batt_warning == false then
					naughty.notify({ text="Bitte Ladekabel anschließen.",
									 title="Schwacher Akkuzustand!",
									 fg=beautiful.widget_red,
									 icon="/home/viktor/.config/awesome/themes/colored/widgets/red/bat_low_02.png",
									 timeout=0 })
				end
				color = beautiful.widget_red
				batt_warning = true
			end
			
			updateBattIcon()
			
			return "<span color=\"".. color .."\">".. args[2] .."%</span>"
		end, 61, "BAT0")
end

---------------------------------------------------------------------------
-- Temperature
---------------------------------------------------------------------------

tempicon = wibox.widget.imagebox()
tempicon:set_image(beautiful.widget_temp)
tempicon:buttons(awful.util.table.join(
	awful.button({ }, 1, function () awful.util.spawn("urxvt -e sudo powertop", false) end)
	-- awful.button({ }, 3, function () awful.util.spawn("sudo irqbalance", false) end)
))
tempwidget = wibox.widget.textbox()
vicious.register(tempwidget, vicious.widgets.thermal, "<span color=\"".. beautiful.widget_cyan .."\">$1°C</span>", 9, { "coretemp.0", "core"} )

local function disptemp()
	local f, infos
	local capi = {
		mouse = mouse,
		screen = screen
	}

	f = io.popen("sensors")
	infos = f:read("*all")
	f:close()

	showtempinfo = naughty.notify( {
		text	= infos,
		timeout	= 0,
        position = "top_right",
        margin = 10,
        height = 120,
        width = 420,
        border_color = beautiful.border_widget,
        border_width = 1,
        -- opacity = 0.95,
		screen	= capi.mouse.screen })
end

tempwidget:connect_signal('mouse::enter', function () disptemp(path) end)
tempwidget:connect_signal('mouse::leave', function () naughty.destroy(showtempinfo) end)

---------------------------------------------------------------------------
-- Volume
---------------------------------------------------------------------------

function updateVolIcon()
	local h = io.popen("amixer sget Master | grep Mono: | cut -d ' ' -f 8")
	local status = h:read("*line")
	h:close()
	if status == "[off]" then
		volicon:set_image(beautiful.widget_vol_mute)
	else
		volicon:set_image(beautiful.widget_vol)
	end
end

volicon = wibox.widget.imagebox()
updateVolIcon()
volumewidget = wibox.widget.textbox()
vicious.register( volumewidget, vicious.widgets.volume, "<span color=\"".. beautiful.widget_blue .."\">$1%</span>", 1, "Master" )
volumewidget:buttons(awful.util.table.join(
    awful.button({ }, 1, function () awful.util.spawn("volume_ctl mute", false) 				updateVolIcon() end),
    awful.button({ }, 3, function () awful.util.spawn("".. terminal.. " -e alsamixer", false)	updateVolIcon() end),
    awful.button({ }, 4, function () awful.util.spawn("volume_ctl up", false)					updateVolIcon() end),
    awful.button({ }, 5, function () awful.util.spawn("volume_ctl down", false)					updateVolIcon() end)
))

---------------------------------------------------------------------------
-- CPU
---------------------------------------------------------------------------
 
cpuicon = wibox.widget.imagebox()
cpuicon:set_image(beautiful.widget_cpu)
cpuwidget = wibox.widget.textbox()
vicious.register( cpuwidget, vicious.widgets.cpu, "<span color=\"".. beautiful.widget_yellow .."\">$1%</span>", 3)
cpuicon:buttons(awful.util.table.join(
    awful.button({ }, 1, function () awful.util.spawn("".. terminal.. " -geometry 80x18 -e saidar -c", false) end)
))

---------------------------------------------------------------------------
-- RAM
---------------------------------------------------------------------------

memicon = wibox.widget.imagebox()
memicon:set_image(beautiful.widget_mem)
memwidget = wibox.widget.textbox()
vicious.register(memwidget, vicious.widgets.mem, "<span color=\"".. beautiful.widget_magenta .."\">$2 MB</span>", 1)
memicon:buttons(awful.util.table.join(
    awful.button({ }, 1, function () awful.util.spawn("".. terminal.. " -e htop", false) end)
))

---------------------------------------------------------------------------
-- Network
---------------------------------------------------------------------------

if rcType == "box" then
	netInterface = "enp3s0"
elseif rcType == "netbook" then
	netInterface = "wlp3s0"
else
	netInterface = "enp3s0"
end

netdownicon = wibox.widget.imagebox()
netdownicon:set_image(beautiful.widget_netdown)
netupicon = wibox.widget.imagebox()
netupicon:set_image(beautiful.widget_netup)

wifidowninfo = wibox.widget.textbox()
vicious.register(wifidowninfo, vicious.widgets.net, "<span color=\"".. beautiful.widget_red .."\">${".. netInterface .." down_kb}</span>", 1)

wifiupinfo = wibox.widget.textbox()
vicious.register(wifiupinfo, vicious.widgets.net, "<span color=\"".. beautiful.widget_green .."\">${".. netInterface .." up_kb}</span>", 1)

local function dispip()
	local f, infos
	local capi = {
		mouse = mouse,
		screen = screen
	}

	f = io.popen("ext-ip")
	infos = f:read("*all")
	f:close()

	showip = naughty.notify( {
		text	= "IP:" .. infos,
		timeout	= 0,
        position = "top_right",
        margin = 10,
        height = 33,
        width = 160,
        border_color = beautiful.border_widget,
        border_width = 1,
        -- opacity = 0.95,
		screen	= capi.mouse.screen })
end

wifidowninfo:connect_signal('mouse::enter', function () dispip(path) end)
wifidowninfo:connect_signal('mouse::leave', function () naughty.destroy(showip) end)

---------------------------------------------------------------------------
-- Taglist
---------------------------------------------------------------------------

mywibox = {}
mybottomwibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )

---------------------------------------------------------------------------
-- Tasklist
---------------------------------------------------------------------------
                    
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))
                                          
---------------------------------------------------------------------------
-- Add Widgets to Screen
---------------------------------------------------------------------------                                          

for s = 1, screen.count() do

    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s, border_width = 0, height = 20 })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()    
    right_layout:add(netdownicon)
    right_layout:add(wifidowninfo)
    right_layout:add(space)
    right_layout:add(netupicon)
    right_layout:add(wifiupinfo)    
    right_layout:add(space)
    right_layout:add(space)
    right_layout:add(memicon)
    right_layout:add(memwidget)
    right_layout:add(space)
    right_layout:add(space)
    right_layout:add(cpuicon)
    right_layout:add(cpuwidget)    
    right_layout:add(space)
    right_layout:add(space)
    right_layout:add(volicon)
    right_layout:add(volumewidget)
    right_layout:add(space)
    right_layout:add(space)
    if rcType == "box" then
		right_layout:add(tempicon)
		right_layout:add(tempwidget)  
		right_layout:add(space)
		right_layout:add(space)
		right_layout:add(uptimeicon)
		right_layout:add(uptimewidget)
		right_layout:add(space)
		right_layout:add(fsicon)
		right_layout:add(fswidget)
		right_layout:add(space)
		right_layout:add(space)    
		right_layout:add(sysicon)
		right_layout:add(syswidget)
		right_layout:add(space)
		right_layout:add(space)    
    end
    right_layout:add(mytextclockicon)
    right_layout:add(mytextclock)
    if rcType == "notebook" then   
		right_layout:add(batticon)
		right_layout:add(battwidget)
		right_layout:add(space)
		right_layout:add(space)   
	end
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(space)
    right_layout:add(space)     
    right_layout:add(mylayoutbox[s])
    right_layout:add(space)

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
end

---------------------------------------------------------------------------
-- Bindings ---------------------------------------------------------------
---------------------------------------------------------------------------

---------------------------------------------------------------------------
-- Mouse Bindings
---------------------------------------------------------------------------

root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

---------------------------------------------------------------------------
-- Key Bindings (Global)
---------------------------------------------------------------------------

globalkeys = awful.util.table.join(
	-- Switch Tag
	awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
	awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
	awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

	-- Switch Client
	awful.key({ "Mod1",			  }, "Tab",
		function ()
			awful.client.focus.byidx( 1)
			if client.focus then client.focus:raise() end
		end),
	awful.key({ "Mod1", "Shift"	  }, "Tab",
		function ()
			awful.client.focus.byidx(-1)
			if client.focus then client.focus:raise() end
		end),		
    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),        
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end),

    -- Manipulate Layout
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),
    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),        

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),
    awful.key({ modkey, "Shift"   }, "n", awful.client.restore),

    -- Prompt
    --awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),
	awful.key({ modkey },            "r",     function ()
		awful.util.spawn("dmenu_run -i -b -p 'Run command:' -nb '" .. 
			beautiful.bg_normal .. "' -nf '" .. beautiful.fg_normal .. 
			"' -sb '" .. beautiful.bg_focus .. 
			"' -sf '" .. beautiful.fg_focus .. "'" 	..
			" -fn '-*-termsyn-medium-*-*-*-14-*-*-*-*-*-*-*'" ) 
		end),    

	-- Lua Code
    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
    
    -- Multimediakeys and Launchers
	awful.key({ }, "XF86AudioRaiseVolume",  function () awful.util.spawn("volume_ctl up") end),
    awful.key({ }, "XF86AudioLowerVolume",  function () awful.util.spawn("volume_ctl down") end),
    awful.key({ }, "XF86AudioMute",    		function () awful.util.spawn("volume_ctl mute") end),
    awful.key({ }, "XF86ScreenSaver",		function () awful.util.spawn("slock") end),
    awful.key({ }, "XF86WLAN",				function () awful.util.spawn("urxvt -e wicd-curses") end),
    awful.key({ }, "XF86MonBrightnessUp",	function () awful.util.spawn("brightness_ctl") end),
    awful.key({ }, "XF86MonBrightnessDown", function () awful.util.spawn("brightness_ctl") end),
    awful.key({ }, "XF86Launch1",    		function () awful.util.spawn("urxvt -e wicd-curses") end),
    awful.key({ }, "XF86PowerOff",    		function () awful.util.spawn("sudo shutdown -h now") end),
    awful.key({ modkey }, "p", 				function () awful.util.spawn("thunar") end),
    awful.key({ modkey }, "c", 				function () awful.util.spawn("urxvt -e mc") end),
    
    -- Zoom
    awful.key({ modkey }, "z",				function ()   
		local handle = io.popen("xrandr | grep '*'")
		local res = handle:read("*l")
		res = handle:read("*l")
		handle:close()
		if res then		
			for x in string.gmatch(res, "%d%d%d%dx") do
				x = string.sub(x,1,4)
				if x == "1920" then
					io.popen("xrandr --output HDMI1 --mode 1280x720 --panning 1920x1080")
				else
					io.popen("xrandr --output HDMI1 --mode 1920x1080")
				end
			end	
		else
			return
		end 
    end)
)

---------------------------------------------------------------------------
-- Key Bindings (Client)
---------------------------------------------------------------------------

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey            }, "q",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

---------------------------------------------------------------------------
-- Key Bindings (Tags)
---------------------------------------------------------------------------

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber))
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.

function viewOnlyH(i)
	local screen = mouse.screen
	if tags[screen][i] then
		awful.tag.viewonly(tags[screen][i])
	end
end

function viewToggleH(i)
	local screen = mouse.screen
	if tags[screen][i] then
	  awful.tag.viewtoggle(tags[screen][i])
	end
end

function moveToTagH(i)
	if client.focus and tags[client.focus.screen][i] then
	  awful.client.movetotag(tags[client.focus.screen][i])
	end
end

function toggleTagH(i)
	if client.focus and tags[client.focus.screen][i] then
	  awful.client.toggletag(tags[client.focus.screen][i])
	end
end

local np_map = { 87, 88, 89, 83, 84, 85, 79, 80, 81 }

for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. np_map[i], function () viewOnlyH(i) end),
        awful.key({ modkey, "Control" }, "#" .. np_map[i], function () viewToggleH(i) end),
        awful.key({ modkey, "Shift" }, "#" .. np_map[i], function () moveToTagH(i) end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. np_map[i], function () toggleTagH(i) end),
        
        awful.key({ modkey }, "#" .. i + 9, function () viewOnlyH(i) end),
        awful.key({ modkey, "Control" }, "#" .. i + 9, function () viewToggleH(i) end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9, function () moveToTagH(i) end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function () toggleTagH(i) end)        
        )
end

---------------------------------------------------------------------------
-- Mouse Bindings (Client)
---------------------------------------------------------------------------

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

---------------------------------------------------------------------------
-- Set Keys
---------------------------------------------------------------------------

root.keys(globalkeys)

---------------------------------------------------------------------------
-- Rules ------------------------------------------------------------------
---------------------------------------------------------------------------

awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "Vlc" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    { rule = { class = "Chromium" },
      properties = { tag = tags[1][2] } },    
    { rule = { class = "xbmc.bin" },
      properties = { tag = tags[1][9] } },       
    { rule = { class = "Thunar" },
      properties = { tag = tags[1][3] } },
    { rule = { name = "Editor.*" },
      properties = { tag = tags[1][5] } },
    { rule = { name = "MATLAB.*" },
      properties = { tag = tags[1][5] } },      
    { rule = { class = "MATLAB" },
      properties = { tag = tags[1][5] } },      
    { rule = { class = "URxvt", name = "^mc" },
      properties = { tag = tags[1][3] } },     
    { rule = { name = "Fortschritt der Dateioperation" },
      properties = { floating = true } },
    { rule = { class = "Exe"}, 
      properties = { floating = true } }
}

---------------------------------------------------------------------------
-- Signals ----------------------------------------------------------------
---------------------------------------------------------------------------

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local title = awful.titlebar.widget.titlewidget(c)
        title:buttons(awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                ))

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(title)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
