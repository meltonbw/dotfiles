local fmt = string.format

-- idea from https://github.com/rafamadriz/dotfiles/.config/nvim/lua/utils/init.lua
--- store all callbacks in one global table so they are able to survive re-requiring this file
_AsGlobalCallbacks = _AsGlobalCallbacks or {}
_G.as = {
    _store = _AsGlobalCallbacks
}

function as._create(f)
  table.insert(as._store, f)
  return #as._store
end

function as._execute(id, args)
  as._store[id](args)
end

-- completion
function as.common_on_attach(client, bufnr)
    documentHighlight(client, bufnr)
end

-- Object inspection
function as.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

-- Autocommands
function as.aucmd(name, commands)
  vim.cmd("aug " .. name)
  vim.cmd "au!"
  for _, c in ipairs(commands) do
    local command = c.command
    if type(command) == "function" then
      local fn_id = as._create(command)
      command = fmt("lua as._execute(%s)", fn_id)
    end
    vim.cmd(
      fmt(
        "au %s %s %s %s",
        table.concat(c.events, ","),
        table.concat(c.targets or {}, ","),
        table.concat(c.modifiers or {}, " "),
        command
      )
    )
  end
  vim.cmd "aug END"
end
