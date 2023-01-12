local status, noirbuddy = pcall(require, "noirbuddy")

if (not status) then
    print("Noirbuddy is not installed")
    return
end

--noirbuddy.setup({
--    colors = {
--        primary = '#0078D4',
--        background = '#101010',
--    },
--})
