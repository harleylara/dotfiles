local ls = require('luasnip')

return {
    -- Example: text and insert nodes quickly become hard to read.
    ls.snippet(
        {
            trig="eq", 
            dscr="A LaTeX equation environment"},
        {
            ls.text_node({ -- using a table of strings for multiline text
                "\\begin{equation}",
                "    "
            }),
            ls.insert_node(1),
            ls.text_node({
                "",
                "\\end{equation}"
            }),
        }
    ),
}
