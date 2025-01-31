local ls = require('luasnip')

return {
    ls.snippet(
        { trig = "hi" },
        { ls.text_node("Hello world") }
    ),
    ls.snippet(
        { trig = "open" },
        { ls.text_node("$\\textrm{OPEN}$") }
    ),
    ls.snippet(
        { trig = "closed" },
        { ls.text_node("$\\textrm{CLOSED}$") }
    )
}
