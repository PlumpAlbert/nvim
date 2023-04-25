return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          -- Add wordpress to the list of stubs
          stubs = {
            "apache",
            "bcmath",
            "bz2",
            "calendar",
            "com_dotnet",
            "Core",
            "ctype",
            "curl",
            "date",
            "dba",
            "dom",
            "enchant",
            "exif",
            "FFI",
            "fileinfo",
            "filter",
            "fpm",
            "ftp",
            "gd",
            "gettext",
            "gmp",
            "hash",
            "iconv",
            "imap",
            "intl",
            "json",
            "ldap",
            "libxml",
            "mbstring",
            "meta",
            "mysqli",
            "oci8",
            "odbc",
            "openssl",
            "pcntl",
            "pcre",
            "PDO",
            "pdo_ibm",
            "pdo_mysql",
            "pdo_pgsql",
            "pdo_sqlite",
            "pgsql",
            "Phar",
            "posix",
            "pspell",
            "readline",
            "Reflection",
            "session",
            "shmop",
            "SimpleXML",
            "snmp",
            "soap",
            "sockets",
            "sodium",
            "SPL",
            "sqlite3",
            "standard",
            "superglobals",
            "sysvmsg",
            "sysvsem",
            "sysvshm",
            "tidy",
            "tokenizer",
            "xml",
            "xmlreader",
            "xmlrpc",
            "xmlwriter",
            "xsl",
            "Zend OPcache",
            "zip",
            "zlib",
            "wordpress",
            "phpunit",
          },
          diagnostics = {
            enable = true,
          },
        },
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    ---@type MasonNullLsSettings
    opts = {
      ensure_installed = {
        "phpcs",
        "phpcbf",
      },
    },
    config = true,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local b = require("null-ls.builtins")

      opts.sources = vim.list_extend(opts.sources, {
        b.diagnostics.phpcs.with({
          prefer_local = "vendor/bin",
        }),
        b.formatting.phpcbf.with({
          prefer_local = "vendor/bin",
        }),
      })

      return opts
    end,
  },
}
