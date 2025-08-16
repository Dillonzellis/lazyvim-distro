return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node
      local f = ls.function_node

      -- Common web development snippets
      local web_snippets = {
        s("cl", { t("console.log('"), i(1), t(":', "), i(1), t(")"), i(0) }),
        s("af", { t("const "), i(1), t(" = ("), i(2), t(") => {"), t({ "", "\t" }), i(3), t({ "", "}" }), i(0) }),
        s("imp", { t("import "), i(1), t(" from '"), i(2), t("'"), i(0) }),
        s("exp", { t("export "), i(1, "default"), t(" "), i(2), i(0) }),
      }

      -- React-specific snippets (for JSX/TSX files)
      local react_snippets = {
        -- s("rfc", {
        --   t("const "),
        --   i(1, "Component"),
        --   t(" = () => {"),
        --   t({ "", "\treturn (" }),
        --   t({ "", "\t\t<div>" }),
        --   t({ "", "\t\t\t" }),
        --   i(2),
        --   t({ "", "\t\t</div>" }),
        --   t({ "", "\t)" }),
        --   t({ "", "}" }),
        --   t({ "", "", "export default " }),
        --   i(1),
        --   i(0),
        -- }),
        s("useState", {
          t("const ["),
          i(1, "state"),
          t(", set"),
          f(function(args)
            return args[1][1]:gsub("^%l", string.upper)
          end, { 1 }),
          t("] = useState("),
          i(2),
          t(")"),
          i(0),
        }),
        s("useEffect", {
          t("useEffect(() => {"),
          t({ "", "\t" }),
          i(1),
          t({ "", "}, [" }),
          i(2),
          t("])"),
          i(0),
        }),
      }

      -- Apply web snippets to all JS/TS variants
      local js_filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }
      for _, ft in ipairs(js_filetypes) do
        ls.add_snippets(ft, web_snippets)
      end

      -- Apply React snippets only to JSX/TSX files
      ls.add_snippets("javascriptreact", react_snippets)
      ls.add_snippets("typescriptreact", react_snippets)
    end,
  },
}
