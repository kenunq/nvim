local ls = require("luasnip")
local s = ls.snippet
local sn = ls.sn
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep -- повтор переменной
local fmt = require("luasnip.extras.fmt").fmt
local c = ls.choice_node
local f = ls.function_node
local d = ls.dynamic_node

vim.keymap.set({ "i", "s" }, "<C-b>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

local generate_args = function(index)
  return f(function(arg)
    local result = {}
    local list_args = vim.split(arg[1][1], ",")
    if list_args[1] ~= "init_args" then
      for i = 1, #list_args do
        local value = string.gsub(list_args[i], "%s+", "")
        if i == 1 then
          table.insert(result, "self." .. value .. " = " .. value)
        else
          table.insert(result, "\t\tself." .. value .. " = " .. value)
        end
      end
    end
    return result
  end, { index })
end

local function ser_extra_kwargs(index, first)
  return d(index, function()
    local query = '"{}": {},\n\t\t\t{}'
    if first then
      query = '"{}": {},\n\t\t\t{} '
    end

    local number = 2
    if first then
      number = 1
    else
      number = 2
    end

    return sn(nil, {
      (first and nil or i(1)),
      c(number, {
        fmt(query, {
          i(1),
          c(2, {
            t('{"read_only": True}'),
            t('{"read_only": False}'),
            t('{"required": True}'),
            t('{"required": False}'),
          }),
          c(3, { t(""), ser_extra_kwargs(1, false) }),
        }),
      }),
    })
  end, {})
end

ls.add_snippets("python", {
  s("class", {
    t("class "),
    i(1, "class_name"),
    t("("),
    i(2, "parent_class"),
    t("):"),
    t({ "", "\t" }),
    t("def __init__(self, "),
    i(3, "init_args"),
    t("):"),
    t({ "", "\t\t" }),
    c(4, { i(1), generate_args(3) }),
  }),
  s(
    "char",
    fmt([[models.CharField("{}", max_length={}{} )]], {
      i(1),
      i(2),
      c(3, { t(""), t(", blank=True, null=True"), fmt([[{}, choices={} ]], { i(1), i(2) }) }),
    })
  ),
  s(
    "foreign",
    fmt([[models.ForeignKey({}, models.{}, related_name="{}", verbose_name="{}"{} )]], {
      i(1, "model"),
      c(2, { t("CASCADE"), t("SET_NULL"), t("PROTECT"), t("SET_DEFAULT") }),
      i(3),
      i(4),
      c(5, { t(""), t(", blank=True, null=True") }),
    })
  ),
  s("create_at", { t("create_at = models.DateTimeField(auto_now_add=True)") }),
  s("update_at", { t("update_at = models.DateTimeField(auto_now=True)") }),
  s(
    "meta",
    fmt(
      [[
      class Meta:
          verbose_name = "{}"
          verbose_name_plural = "{}{}"
          {}

      def __str__(self):
          return {}
  ]],
      {
        i(1),
        rep(1),
        i(2),
        c(3, { t(""), fmt('ordering = ["{}"]', { i(1) }), fmt('unique_together = ["{}"]', { i(1) }) }),
        i(4),
      }
    )
  ),
  s(
    "ser",
    fmt(
      [[
        class {}({}):
            class Meta:
                model = {}
                {}
                {}


  ]],
      {
        i(1),
        c(2, { t("serializers.ModelSerializer"), t("serializers.Serializer") }),
        i(3),
        c(4, { fmt([[{}fields = {}]], { i(1), c(2, { t('"__all__"'), t('[""]') }) }), t('exclude = [""]') }),
        c(5, {
          t(""),
          fmt(
            [[{}extra_kwargs = {{
            {}
        }}
        ]],
            { i(1), ser_extra_kwargs(2, true) }
          ),
        }),
      }
    )
  ),
})
