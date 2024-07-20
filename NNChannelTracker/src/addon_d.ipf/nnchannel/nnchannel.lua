
-- Copyright (C) 2016 ScorpicSavior
--
-- This file is part of NNChannelTracker.
--
-- NNChannelTracker is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- NNChannelTracker is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with NNChannelTracker.  If not, see <http://www.gnu.org/licenses/>.

if not _G["NNCHANNEL"] then
  _G["NNCHANNEL"] = {};
end

local Version = "v0.1.2";

function NNCHANNEL_ON_TIME_UPDATE(frame, msg, argStr, argNum)
  if _G["NNCHANNEL"]["lastTime"] == argNum then return end

  local mapName = session.GetMapName();
  if mapName == nil then return end

	local mapCls = GetClass("Map", mapName);
  if mapCls == nil then return end

  _G["NNCHANNEL"]["lastTime"] = argNum;

  if argNum % 2 == 0 then
    app.RequestChannelTraffics(mapCls.ClassID);
    _G["NNCHANNEL"]["requesting"] = true;
  end
end

function NNCHANNEL_ON_ZONE_TRAFFICS(frame, msg, argStr, argNum)
  if not _G["NNCHANNEL"]["requesting"] then return end
  _G["NNCHANNEL"]["requesting"] = false;

  local mapName = session.GetMapName();
  if mapName == nil then return end

  local mapCls = GetClass("Map", mapName);
  if mapCls == nil then return end

  local ts = os.date("%Y-%m-%dT%H:%M:%SZ", os.time(os.date("!*t", os.time())));
  local time = _G["NNCHANNEL"]["lastTime"];
  local maxPopulation = session.serverState.GetMaxPCCount();
  local zoneInsts = session.serverState.GetMap(mapCls.ClassID);
  local channels = zoneInsts:GetZoneInstCount();
  local logStr = string.format("\"%s\";\"%02d:%02d\";\"%s\"", ts, time / 100, time % 100, mapName);
  for channel = 0, channels - 1 do
    local zoneInst = zoneInsts:GetZoneInstByIndex(channel);
    local population = zoneInst.pcCount;
    if population == -1 then population = maxPopulation end
    logStr = logStr .. string.format(";%d", population);
  end

  file, err = io.open("../addons/nnchannel/population_log.csv", "a")
	if err then return end
	file:write(logStr .. "\n");
	file:close();
end

local isLoaded = false;
function NNCHANNEL_ON_INIT(addon, frame)
  addon:RegisterMsg("REAL_TIME_UPDATE", "NNCHANNEL_ON_TIME_UPDATE");
  addon:RegisterMsg("ZONE_TRAFFICS", "NNCHANNEL_ON_ZONE_TRAFFICS");

  if not isLoaded then
    ui.SysMsg(string.format("Nin-Nin Channel Tracker %s ready!", Version));
  end
  isLoaded = true;
end
