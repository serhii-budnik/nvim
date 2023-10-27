local ls = require 'luasnip'

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require('luasnip.extras').rep

ls.add_snippets('ruby', {
  s(
    'rlog',
    {
      t('Rails.logger.info("'),
      i(1),
      t('>>>>>>> #{'),
      rep(1),
      t('.inspect}")'),
      t({''})
    }
  ),
  s(
    'rlogp',
    {
      t('Rails.logger.info("'),
      i(1),
      t('>>>>>>>")'),
      t({''})
    }
  ),
  s(
    'fro',
    {
      t('# frozen_string_literal: true'),
      t({'', ''}),
    }
  )
})
