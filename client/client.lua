local Example = false

--// Functions \\--

local function ShowJobStage(data)
    SendNUIMessage({
        action = "ShowJobStage",
        notification = {
            job = data.job,
            stage = data.title,
            hasStatus = data.hasStatus,
            statusMessage = data.statusMessage,
            statusValue = data.statusValue,
        }
    })
end

local function UpdateJobStage(data)
    SendNUIMessage({
        action = "UpdateJobStage",
        notification = {
            job = data.job,
            stage = data.title,
            hasStatus = data.hasStatus,
            statusMessage = data.statusMessage,
            statusValue = data.statusValue,
        }
    })
end

local function HideJobStage()
    SendNUIMessage({
        action = "HideJobStage",
    })
end

exports("ShowJobStage", ShowJobStage)
exports("UpdateJobStage", UpdateJobStage)
exports("HideJobStage", HideJobStage)

--// Events \\--

RegisterNetEvent("sp-laptop:client:show-job-stage", function(data) -- Old event names for our own server, you can comment these :D
    ShowJobStage(data)
end)

RegisterNetEvent("sp-laptop:client:update-job-stage", function(data) -- Old event names for our own server, you can comment these :D
    UpdateJobStage(data)
end)

RegisterNetEvent("sp-laptop:client:hide-job-stage", function() -- Old event names for our own server, you can comment these :D
    HideJobStage()
end)

RegisterNetEvent("bd-jobstatus:client:show-job-stage", function(data)
    ShowJobStage(data)
end)

RegisterNetEvent("bd-jobstatus:client:update-job-stage", function(data)
    UpdateJobStage(data)
end)

RegisterNetEvent("bd-jobstatus:client:hide-job-stage", function()
    HideJobStage()
end)

--// Example \\--

if Example then
    RegisterCommand("jobstatus_show", function()
        exports["bd-jobstatus"]:ShowJobStage({
            job = "Ammunation Heist",
            title = "Rob the container <br/> Code: 0W0W",
            hasStatus = true,
            statusMessage = "NPC's",
            statusValue = "1/10"
        })
    end, false)

    RegisterCommand("jobstatus_update", function()
        exports["bd-jobstatus"]:UpdateJobStage({
            job = "Ammunation Heist",
            title = "Rob the loot box",
            hasStatus = false,
        })
    end, false)

    RegisterCommand("jobstatus_hide", function()
        exports["bd-jobstatus"]:HideJobStage()
    end, false)
end