local ls = require('luasnip')

local date = function() return {os.date('%Y-%m-%d')} end

return {
    ls.snippet({
        trig = "date",
        namr = "Date",
        dscr = "Date in the form of YYYY-MM-DD",
    },{ ls.function_node(date, {}) }),
    ls.snippet(
        { trig = "hi" },
        { ls.text_node("Hello world") }
    )
}
