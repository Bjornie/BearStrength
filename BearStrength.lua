BearStrength = {
  name = "BearStrength",
  version = "1.0.0",
  svName = "BearStrengthSV",
  svVersion = 1,

  Default = {},
}

local BS = BearStrength

local function InitiateCCEvents()
  EVENT_MANAGER:RegisterForEvent(BS.name .. "Feared", EVENT_COMBAT_EVENT, Feared)
  EVENT_MANAGER:AddFilter

local function Initialise()
  BS.SavedVariables = ZO_SavedVars:NewAccountWide(BS.svName, BS.svVersion, nil, BS.Default)

  InitiateCCEvents()

  BS.BuildMenu()
end

local function OnAddonLoaded(_, addonName)
  if addonName == BS.name then
    EVENT_MANAGER:UnregisterForEvent(BS.name, EVENT_ADD_ON_LOADED)
    Initialise()
  end
end

EVENT_MANAGER:RegisterForEvent(BS.name, EVENT_ADD_ON_LOADED, OnAddonLoaded)