local dbDriver = os.getenv "SQLS_DRIVER"
local dbDSN = os.getenv "SQLS_DSN"

return {
  cmd = { "sqls" },
  settings = {
    sqls = {
      connections = {
        {
          driver = dbDriver,
          dataSourceName = dbDSN,
        },
      },
    },
  },
}
