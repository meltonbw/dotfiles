vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local cmp = require('cmp')
local luasnip = require('luasnip')

local select_opts = {behavior = cmp.SelectBehavior.Select}


cmp.setup({
  -- Callback function for snippets
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  -- The sources for the auto-completion list
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp', keyword_length = 3},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
  },
  -- Basic window layout
  window = {
    documentation = cmp.config.window.bordered()
  },
  -- Formating the auto-completion menu
  formatting = {
    -- Order of fields in the completion menu
    fields = {'menu', 'abbr', 'kind'},
    -- Callback function for formatting the completion menu
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
  -- Key bindings
  mapping = {
    -- Move between completion items
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

    -- Scroll text in the documentation window
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),

    -- Cancel completion
    ['<C-e>'] = cmp.mapping.abort(),

    -- Confirm selection
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Jump to the next placeholder in the snippet
    ['<C-d>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, {'i', 's'}),

    -- Jump to the previous placeholder in the snippet
    ['<C-b>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {'i', 's'}),

    -- Autocomplete with tab
    ['<Tab>'] = cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1

      -- If the completion menu is visible, move to the next item
      if cmp.visible() then
        cmp.select_next_item(select_opts)
      -- If the line is "empty", insert a Tab character
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      -- If the cursor is inside a word, trigger the completion menu
      else
        cmp.complete()
      end
    end, {'i', 's'}),

    -- If the completion menu is visible, move to the previous item
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end, {'i', 's'}),
  },
})

cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  },
})
