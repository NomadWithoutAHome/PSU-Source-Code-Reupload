--[[
	id: XgwRgnwTCqqC_auK47U4_
	name: wexw
	description: ewxwewewewewe
	time1: 2021-05-20 15:23:45.113097+00
	time2: 2021-05-20 15:23:45.113097+00
	uploader: IJyW72t-AZ5b6aFd5mp7hfwfiArT9VznkLuRhwlJ
	uploadersession: N7lLO0W7MVWsQIBLayGlsgA6etHt8c
	flag: f
--]]

game:getService("RunService"):BindToRenderStep("",0,function()
for i, v in pairs(game:GetService("Players"):GetChildren()) do
if game.workspace:FindFirstChild(v.Name) then
-- Script generated by SimpleSpy - credits to exx#9394

function getNil(name,class) for _,v in pairs(getnilinstances())do if v.ClassName==class and v.Name==name then return v;end end end

local args = {
    [1] = {
        [1] = getrenv()._G.Pass,
        [2] = "Knives",
        [3] = "Hit3",
        [4] = v.Character.Head,
        [5] = v.Character.Head.CFrame,
        [6] = math.huge
    }
}

game:GetService("ReplicatedStorage").Remotes.SFCharaMoves:InvokeServer(unpack(args))
end
end
end)