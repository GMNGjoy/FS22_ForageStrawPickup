ForageStrawPickup = {}
local modDir = g_currentModDirectory

--- Register custom fillTypes.
function ForageStrawPickup.registerFillTypes(self, superFunc)
    superFunc(self)

    local xml = loadXMLFile("mod_fillTypes", modDir .. "xml/maps_fillTypes.xml")
    g_fillTypeManager:loadFillTypes(xml, modDir, false, "FS22_ForageStrawPickup")
    delete(xml)
end

--- Register custom fruitTypes.
function ForageStrawPickup.registerFruitTypes(self, superFunc)
    superFunc(self)

    local xml = loadXMLFile("mod_fruitTypes", modDir .. "xml/maps_fruitTypes.xml")
    g_fruitTypeManager:loadFruitTypes(xml, nil, false)
    delete(xml)
end

FillTypeManager.loadDefaultTypes = Utils.overwrittenFunction(FillTypeManager.loadDefaultTypes, ForageStrawPickup.registerFillTypes)
FruitTypeManager.loadDefaultTypes = Utils.overwrittenFunction(FruitTypeManager.loadDefaultTypes, ForageStrawPickup.registerFruitTypes)
