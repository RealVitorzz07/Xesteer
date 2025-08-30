-- translations.lua
-- Translation system for XesteerHub (Roblox Lua)
-- Usage:
-- local Trans = loadfile("path/to/translations.lua")() or require if packaged
-- Trans.SetLanguage("pt") -- "en","pt","vi","id","it"
-- local t = Trans.Translate("Information")

-- Global translation counter required by user request
getgenv().TranslationCounter = nil

local M = {}

-- Default language (can be changed at runtime)
if not getgenv().Language then
    getgenv().Language = "en" -- en, pt, vi, id, it
end

-- Translations table. Add new keys / languages here.
local Translations = {
    en = {
        -- Window / Tabs
        ["Xesteer Hub "] = "Xesteer Hub ",
        ["Information"] = "Information",
        ["Info Section"] = "Info Section",
        ["Tab Farming"] = "Tab Farming",
        ["Main Section"] = "Main Section",
        ["Tab Others"] = "Tab Others",
        ["Farming Section"] = "Farming Section",
        ["Tab Items"] = "Tab Items",
        ["Items Section"] = "Items Section",
        ["Tab Settings"] = "Tab Settings",
        ["Settings Section"] = "Settings Section",
        ["Tab Player"] = "Tab Player",
        ["Local Player Section"] = "Local Player Section",
        ["Tab Stats"] = "Tab Stats",
        ["Stats Section"] = "Stats Section",
        ["Tab Sea Event"] = "Tab Sea Event",
        ["Sea Event Section"] = "Sea Event Section",
        ["Tab Sea Stack"] = "Tab Sea Stack",
        ["Sea Stack Section"] = "Sea Stack Section",
        ["Tab Sea Settings"] = "Tab Sea Settings",
        ["Sea Settings Section"] = "Sea Settings Section",
        ["Tab Dragon Dojo"] = "Tab Dragon Dojo",
        ["Dragon Dojo Section"] = "Dragon Dojo Section",
        ["Tab Race V4"] = "Tab Race V4",
        ["Race Section"] = "Race Section",
        ["Tab Combat"] = "Tab Combat",
        ["Combat Section"] = "Combat Section",
        ["Tab Raid"] = "Tab Raid",
        ["Raid Section"] = "Raid Section",
        ["Tab Esp"] = "Tab Esp",
        ["Esp Section"] = "Esp Section",
        ["Tab Teleport"] = "Tab Teleport",
        ["Teleport Section"] = "Teleport Section",
        ["Tab Shop"] = "Tab Shop",
        ["Shop Section"] = "Shop Section",
        ["Tab Fruit"] = "Tab Fruit",
        ["Fruit Section"] = "Fruit Section",
        ["Tab Misc"] = "Tab Misc",
        ["Misc Section"] = "Misc Section",
        ["Tab Server"] = "Tab Server",
        ["Server Section"] = "Server Section",

        -- Common UI / settings labels
        ["Auto Farm"] = "Auto Farm",
        ["Auto Fast Farm"] = "Auto Fast Farm",
        ["Select Weapon"] = "Select Weapon",
        ["Farm Level Method"] = "Farm Level Method",
        ["Mastery Method"] = "Mastery Method",

        -- Elite Hunter example
        ["Elite Hunter"] = "Elite Hunter",
        ["Elite Hunter Status"] = "Elite Hunter Status",
        ["Spawn!"] = "Spawn!",
        ["Not Spawn"] = "Not Spawn",
        ["Elite Hunter Progress"] = "Elite Hunter Progress",
        ["Function Sea 3 Only"] = "Function Sea 3 Only",

        -- Misc controls
        ["Auto Train"] = "Auto Train",
        ["Auto Race V2"] = "Auto Race V2",
        ["Auto Race V3"] = "Auto Race V3",
        ["Auto Observation"] = "Auto Observation",
        ["Auto Haki"] = "Auto Haki",

        -- Fallback generic
        ["Save"] = "Save",
        ["Loaded!"] = "Loaded!",
        ["Status : Undetected Executor"] = "Status : Undetected Executor"
    },

    pt = {
        ["Xesteer Hub "] = "Xesteer Hub ",
        ["Information"] = "Informações",
        ["Info Section"] = "Seção de Informações",
        ["Tab Farming"] = "Abas Farm",
        ["Main Section"] = "Seção Principal",
        ["Tab Others"] = "Aba Outros",
        ["Farming Section"] = "Seção de Farm",
        ["Tab Items"] = "Aba Itens",
        ["Items Section"] = "Seção de Itens",
        ["Tab Settings"] = "Aba Configurações",
        ["Settings Section"] = "Seção de Configurações",
        ["Tab Player"] = "Aba Jogador",
        ["Local Player Section"] = "Seção Jogador Local",
        ["Tab Stats"] = "Aba Estatísticas",
        ["Stats Section"] = "Seção de Estatísticas",
        ["Tab Sea Event"] = "Aba Eventos do Mar",
        ["Sea Event Section"] = "Seção de Eventos do Mar",
        ["Tab Sea Stack"] = "Aba Sea Stack",
        ["Sea Stack Section"] = "Seção Sea Stack",
        ["Tab Sea Settings"] = "Aba Config. do Mar",
        ["Sea Settings Section"] = "Seção de Configurações do Mar",
        ["Tab Dragon Dojo"] = "Aba Dojo do Dragão",
        ["Dragon Dojo Section"] = "Seção Dojo do Dragão",
        ["Tab Race V4"] = "Aba Corrida V4",
        ["Race Section"] = "Seção Corrida",
        ["Tab Combat"] = "Aba Combate",
        ["Combat Section"] = "Seção Combate",
        ["Tab Raid"] = "Aba Raid",
        ["Raid Section"] = "Seção Raid",
        ["Tab Esp"] = "Aba ESP",
        ["Esp Section"] = "Seção ESP",
        ["Tab Teleport"] = "Aba Teleporte",
        ["Teleport Section"] = "Seção Teleporte",
        ["Tab Shop"] = "Aba Loja",
        ["Shop Section"] = "Seção Loja",
        ["Tab Fruit"] = "Aba Frutas",
        ["Fruit Section"] = "Seção Frutas",
        ["Tab Misc"] = "Aba Diversos",
        ["Misc Section"] = "Seção Diversos",
        ["Tab Server"] = "Aba Servidor",
        ["Server Section"] = "Seção Servidor",

        ["Auto Farm"] = "Farm Automático",
        ["Auto Fast Farm"] = "Farm Rápido Automático",
        ["Select Weapon"] = "Selecionar Arma",
        ["Farm Level Method"] = "Método de Up",
        ["Mastery Method"] = "Método de Maestria",

        ["Elite Hunter"] = "Caçador Elite",
        ["Elite Hunter Status"] = "Status do Caçador Elite",
        ["Spawn!"] = "Spawn!",
        ["Not Spawn"] = "Não Spawnou",
        ["Elite Hunter Progress"] = "Progresso do Caçador Elite",
        ["Function Sea 3 Only"] = "Funciona somente no Sea 3",

        ["Auto Train"] = "Treinar Auto",
        ["Auto Race V2"] = "Corrida Auto V2",
        ["Auto Race V3"] = "Corrida Auto V3",
        ["Auto Observation"] = "Observação Auto",
        ["Auto Haki"] = "Haki Auto",

        ["Save"] = "Salvar",
        ["Loaded!"] = "Carregado!",
        ["Status : Undetected Executor"] = "Status : Executor Indetectável"
    },

    vi = {
        ["Xesteer Hub "] = "Xesteer Hub ",
        ["Information"] = "Thông tin",
        ["Info Section"] = "Phần thông tin",
        ["Tab Farming"] = "Tab Cày cấp",
        ["Main Section"] = "Phần chính",
        ["Tab Others"] = "Tab Khác",
        ["Farming Section"] = "Phần cày",
        ["Tab Items"] = "Tab Vật phẩm",
        ["Items Section"] = "Phần vật phẩm",
        ["Tab Settings"] = "Tab Cài đặt",
        ["Settings Section"] = "Phần cài đặt",
        ["Tab Player"] = "Tab Người chơi",
        ["Local Player Section"] = "Phần người chơi cục bộ",
        ["Tab Stats"] = "Tab Thống kê",
        ["Stats Section"] = "Phần thống kê",
        ["Tab Sea Event"] = "Tab Sự kiện biển",
        ["Sea Event Section"] = "Phần sự kiện biển",
        ["Tab Sea Stack"] = "Tab Sea Stack",
        ["Sea Stack Section"] = "Phần Sea Stack",
        ["Tab Sea Settings"] = "Tab Cài đặt biển",
        ["Sea Settings Section"] = "Phần cài đặt biển",
        ["Tab Dragon Dojo"] = "Tab Dojo Rồng",
        ["Dragon Dojo Section"] = "Phần Dojo Rồng",
        ["Tab Race V4"] = "Tab Đua V4",
        ["Race Section"] = "Phần đua",
        ["Tab Combat"] = "Tab Chiến đấu",
        ["Combat Section"] = "Phần chiến đấu",
        ["Tab Raid"] = "Tab Raid",
        ["Raid Section"] = "Phần Raid",
        ["Tab Esp"] = "Tab ESP",
        ["Esp Section"] = "Phần ESP",
        ["Tab Teleport"] = "Tab Dịch chuyển",
        ["Teleport Section"] = "Phần dịch chuyển",
        ["Tab Shop"] = "Tab Cửa hàng",
        ["Shop Section"] = "Phần cửa hàng",
        ["Tab Fruit"] = "Tab Trái cây",
        ["Fruit Section"] = "Phần trái cây",
        ["Tab Misc"] = "Tab Khác",
        ["Misc Section"] = "Phần khác",
        ["Tab Server"] = "Tab Máy chủ",
        ["Server Section"] = "Phần máy chủ",

        ["Auto Farm"] = "Tự động farm",
        ["Auto Fast Farm"] = "Tự động farm nhanh",
        ["Select Weapon"] = "Chọn vũ khí",
        ["Farm Level Method"] = "Phương pháp farm level",
        ["Mastery Method"] = "Phương pháp mastery",

        ["Elite Hunter"] = "Thợ săn tinh anh",
        ["Elite Hunter Status"] = "Trạng thái Thợ săn tinh anh",
        ["Spawn!"] = "Xuất hiện!",
        ["Not Spawn"] = "Không xuất hiện",
        ["Elite Hunter Progress"] = "Tiến trình Thợ săn",
        ["Function Sea 3 Only"] = "Chỉ hoạt động ở Sea 3",

        ["Auto Train"] = "Tự động luyện tập",
        ["Auto Race V2"] = "Tự động đua V2",
        ["Auto Race V3"] = "Tự động đua V3",
        ["Auto Observation"] = "Tự động quan sát",
        ["Auto Haki"] = "Tự động Haki",

        ["Save"] = "Lưu",
        ["Loaded!"] = "Đã tải!",
        ["Status : Undetected Executor"] = "Trạng thái: Trình thực thi không phát hiện"
    },

    id = {
        ["Xesteer Hub "] = "Xesteer Hub ",
        ["Information"] = "Informasi",
        ["Info Section"] = "Bagian Informasi",
        ["Tab Farming"] = "Tab Farming",
        ["Main Section"] = "Bagian Utama",
        ["Tab Others"] = "Tab Lainnya",
        ["Farming Section"] = "Bagian Farming",
        ["Tab Items"] = "Tab Item",
        ["Items Section"] = "Bagian Item",
        ["Tab Settings"] = "Tab Pengaturan",
        ["Settings Section"] = "Bagian Pengaturan",
        ["Tab Player"] = "Tab Pemain",
        ["Local Player Section"] = "Bagian Pemain Lokal",
        ["Tab Stats"] = "Tab Statistik",
        ["Stats Section"] = "Bagian Statistik",
        ["Tab Sea Event"] = "Tab Event Laut",
        ["Sea Event Section"] = "Bagian Event Laut",
        ["Tab Sea Stack"] = "Tab Sea Stack",
        ["Sea Stack Section"] = "Bagian Sea Stack",
        ["Tab Sea Settings"] = "Tab Pengaturan Laut",
        ["Sea Settings Section"] = "Bagian Pengaturan Laut",
        ["Tab Dragon Dojo"] = "Tab Dragon Dojo",
        ["Dragon Dojo Section"] = "Bagian Dragon Dojo",
        ["Tab Race V4"] = "Tab Race V4",
        ["Race Section"] = "Bagian Race",
        ["Tab Combat"] = "Tab Combat",
        ["Combat Section"] = "Bagian Combat",
        ["Tab Raid"] = "Tab Raid",
        ["Raid Section"] = "Bagian Raid",
        ["Tab Esp"] = "Tab ESP",
        ["Esp Section"] = "Bagian ESP",
        ["Tab Teleport"] = "Tab Teleport",
        ["Teleport Section"] = "Bagian Teleport",
        ["Tab Shop"] = "Tab Shop",
        ["Shop Section"] = "Bagian Shop",
        ["Tab Fruit"] = "Tab Buah",
        ["Fruit Section"] = "Bagian Buah",
        ["Tab Misc"] = "Tab Misc",
        ["Misc Section"] = "Bagian Misc",
        ["Tab Server"] = "Tab Server",
        ["Server Section"] = "Bagian Server",

        ["Auto Farm"] = "Auto Farm",
        ["Auto Fast Farm"] = "Auto Fast Farm",
        ["Select Weapon"] = "Pilih Senjata",
        ["Farm Level Method"] = "Metode Level Farm",
        ["Mastery Method"] = "Metode Mastery",

        ["Elite Hunter"] = "Elite Hunter",
        ["Elite Hunter Status"] = "Status Elite Hunter",
        ["Spawn!"] = "Spawn!",
        ["Not Spawn"] = "Tidak Spawn",
        ["Elite Hunter Progress"] = "Progres Elite Hunter",
        ["Function Sea 3 Only"] = "Berfungsi hanya di Sea 3",

        ["Auto Train"] = "Auto Train",
        ["Auto Race V2"] = "Auto Race V2",
        ["Auto Race V3"] = "Auto Race V3",
        ["Auto Observation"] = "Auto Observation",
        ["Auto Haki"] = "Auto Haki",

        ["Save"] = "Simpan",
        ["Loaded!"] = "Dimuat!",
        ["Status : Undetected Executor"] = "Status : Executor Tidak Terdeteksi"
    },

    it = {
        ["Xesteer Hub "] = "Xesteer Hub ",
        ["Information"] = "Informazioni",
        ["Info Section"] = "Sezione Informazioni",
        ["Tab Farming"] = "Scheda Farming",
        ["Main Section"] = "Sezione Principale",
        ["Tab Others"] = "Scheda Altro",
        ["Farming Section"] = "Sezione Farming",
        ["Tab Items"] = "Scheda Oggetti",
        ["Items Section"] = "Sezione Oggetti",
        ["Tab Settings"] = "Scheda Impostazioni",
        ["Settings Section"] = "Sezione Impostazioni",
        ["Tab Player"] = "Scheda Giocatore",
        ["Local Player Section"] = "Sezione Giocatore Locale",
        ["Tab Stats"] = "Scheda Statistiche",
        ["Stats Section"] = "Sezione Statistiche",
        ["Tab Sea Event"] = "Scheda Evento Mare",
        ["Sea Event Section"] = "Sezione Evento Mare",
        ["Tab Sea Stack"] = "Scheda Sea Stack",
        ["Sea Stack Section"] = "Sezione Sea Stack",
        ["Tab Sea Settings"] = "Scheda Impostazioni Mare",
        ["Sea Settings Section"] = "Sezione Impostazioni Mare",
        ["Tab Dragon Dojo"] = "Scheda Dragon Dojo",
        ["Dragon Dojo Section"] = "Sezione Dragon Dojo",
        ["Tab Race V4"] = "Scheda Gara V4",
        ["Race Section"] = "Sezione Gara",
        ["Tab Combat"] = "Scheda Combattimento",
        ["Combat Section"] = "Sezione Combattimento",
        ["Tab Raid"] = "Scheda Raid",
        ["Raid Section"] = "Sezione Raid",
        ["Tab Esp"] = "Scheda ESP",
        ["Esp Section"] = "Sezione ESP",
        ["Tab Teleport"] = "Scheda Teletrasporto",
        ["Teleport Section"] = "Sezione Teletrasporto",
        ["Tab Shop"] = "Scheda Negozio",
        ["Shop Section"] = "Sezione Negozio",
        ["Tab Fruit"] = "Scheda Frutta",
        ["Fruit Section"] = "Sezione Frutta",
        ["Tab Misc"] = "Scheda Varie",
        ["Misc Section"] = "Sezione Varie",
        ["Tab Server"] = "Scheda Server",
        ["Server Section"] = "Sezione Server",

        ["Auto Farm"] = "Auto Farm",
        ["Auto Fast Farm"] = "Auto Farm Veloce",
        ["Select Weapon"] = "Seleziona Arma",
        ["Farm Level Method"] = "Metodo Livellamento",
        ["Mastery Method"] = "Metodo Maestria",

        ["Elite Hunter"] = "Elite Hunter",
        ["Elite Hunter Status"] = "Stato Elite Hunter",
        ["Spawn!"] = "Spawn!",
        ["Not Spawn"] = "Non Spawnato",
        ["Elite Hunter Progress"] = "Progresso Elite Hunter",
        ["Function Sea 3 Only"] = "Funziona solo su Sea 3",

        ["Auto Train"] = "Allenamento Auto",
        ["Auto Race V2"] = "Auto Gara V2",
        ["Auto Race V3"] = "Auto Gara V3",
        ["Auto Observation"] = "Osservazione Auto",
        ["Auto Haki"] = "Haki Auto",

        ["Save"] = "Salva",
        ["Loaded!"] = "Caricato!",
        ["Status : Undetected Executor"] = "Stato : Executor non rilevato"
    }
}

-- Simple cache for translated entries (speeds up repeated lookups)
local Cache = {}

-- Set language at runtime
function M.SetLanguage(lang)
    if type(lang) == "string" and Translations[lang] then
        getgenv().Language = lang
        -- clear cache for new language
        Cache = {}
        return true
    end
    return false
end

-- Translate function: receives an English string and returns translated string.
-- Falls back to English original if translation not found.
function M.Translate(str)
    if not str then return str end
    local lang = getgenv().Language or "en"
    local cacheKey = lang .. "::" .. tostring(str)
    if Cache[cacheKey] then return Cache[cacheKey] end

    local langTable = Translations[lang]
    if langTable and langTable[str] then
        Cache[cacheKey] = langTable[str]
        return Cache[cacheKey]
    end

    -- fallback to English table
    if Translations.en and Translations.en[str] then
        Cache[cacheKey] = Translations.en[str]
        return Cache[cacheKey]
    end

    -- fallback to the original string (best effort)
    Cache[cacheKey] = str
    return str
end

-- Helper: translate fields in a tab definition table before passing to Window:Tab
-- Example usage (replace the tab definition when creating the UI):
-- local tabDef = { Title = Trans.Translate("Information"), Icon = "info", Desc = Trans.Translate("Info Section") }
-- local InfoTab = Window:Tab(tabDef)
function M.TranslateTabDef(def)
    if type(def) ~= "table" then return def end
    local out = {}
    for k, v in pairs(def) do
        if (k == "Title" or k == "Desc") and type(v) == "string" then
            out[k] = M.Translate(v)
        else
            out[k] = v
        end
    end
    return out
end

-- Small convenience alias
M.T = M.Translate

return M
