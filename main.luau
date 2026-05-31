local LocalPlayer = game:GetService("Players").LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

local AnimationFile = Instance.new("Animation")
AnimationFile.AnimationId = "rbxassetid://72042024"

local Track = nil

if Character.Parent then
    Track = Character:FindFirstChildWhichIsA("Humanoid"):FindFirstChildWhichIsA("Animator"):LoadAnimation(AnimationFile)
    Track.Looped = true
    Track.Priority = Enum.AnimationPriority.Action
end

local Enabled = false

local function Heil()
    if Character.Parent and Track then
        if Enabled then
            Enabled = false
            Track:Stop()
            return
        end
        
        Track:Play()
        Track.TimePosition = 0.03
        Track:AdjustSpeed(0)
        
        Enabled = true
    end
end

local RBXAnimationTool = Instance.new("Tool")
RBXAnimationTool.Parent = Character
RBXAnimationTool.Name = "Heil"
RBXAnimationTool.RequiresHandle = false
RBXAnimationTool.Activated:Connect(Heil)