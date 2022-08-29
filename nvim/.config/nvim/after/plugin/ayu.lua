local status, ayu = pcall(require, "ayu")

if (not status) then
    print("Ayu color scheme not installed")
    return
end

ayu.colorscheme()
