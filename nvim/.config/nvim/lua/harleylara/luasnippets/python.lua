local ls = require('luasnip')

return {
  ls.snippet(
    {
      trig="python",
      dscr="Python is cool",
    },
    {
      ls.text_node("Hello, world!"),
    }
  ),
}
