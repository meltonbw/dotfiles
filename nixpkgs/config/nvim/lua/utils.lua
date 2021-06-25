local utils = {}

-- completion
function utils.common_on_attach(client, bufnr)
    documentHighlight(client, bufnr)
end

return utils
