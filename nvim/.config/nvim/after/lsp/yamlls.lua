return {
  settings = {
    yaml = {
      validate = true,
      completion = true,
      hover = true,
      schemastore = { enable = false, url = "" },
      schemas = require("schemastore").yaml.schemas(),
    },
  },
}
