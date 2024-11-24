const { execSync } = require("child_process")
const gemPath = execSync(
  `bundle exec ruby -e "require 'rubygems'; puts Gem.loaded_specs['branch_rubocop'].full_gem_path"`,
)
  .toString()
  .trim()
const config = require(`${gemPath}/cspell.config.js`)

config.merge({
  words: [],
  ignorePaths: [
    "/CHANGELOG.md", // changelog is auto generated
  ],
  overrides: [
    {
      filename: "/README.md",
      words: ["iikadg", "Inputable"],
    },
    {
      filename: "filter_parameter_logging.rb",
      words: ["passw"],
    },
  ],
})

module.exports = config
