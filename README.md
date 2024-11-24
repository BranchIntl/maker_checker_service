# Gem Template

## Creating a new gem repo

## Setting up the new gem

Run `./bin/setup_repo`

## Keeping the new gem repo up to date

Run `./bin/update_configs` periodically to sync configuration files from the gem_template.

## Adding gem dependencies (including other private gems)
Gem dependencies are specified in two places:

1. `Gemfile`.
2. The `gemspec` (which is named after your project, like `my_gem.gemspec`).

The Gemfile has lines like 

``` ruby
gem 'some_gem', group: :development
```

while the gemspec has lines like

``` ruby
spec.add_dependency 'some_gem', '~> 1.0'
```

When you do `bundle install` within your gem project, bundle uses the Gemfile to determine what must be installed. You can specify version constraints on the dependencies in the Gemfile as well (like `gem 'some_gem', '~> 1.0'`). `bundle install` will find the gems (by looking at rubygems.org by default) and install those, storing the specific versions that it found in `Gemfile.lock`. If you run `bundle install` again, and the `Gemfile.lock` is present, it'll ensure that those exact versions are installed.

If another gem or application *uses* the gem you're working on, it'll read the gemspec to figure out which gems and which versions of those gems are required. It *does not* read the Gemfile or the Gemfile.lock: it just reads the gemspec. The purpose of the gemspec file is to accommodate *other projects* that use this gem.

Both the Gemfile and gemspec specify dependencies and optionally ranges of acceptable versions for those dependencies. Gemfile is for use in the gem/project itself, while gemspec is for use by other projects using this gem. To reduce duplication, the Gemfile can use the gemspec by adding `gemspec` into the Gemfile contents.

The Gemfile specifies not only dependencies and versions but *where to get dependencies*. This can be done using a specific git address or a gem host source. gemspec doesn't allow specifying this; it's up to the end application that's using the gem to specify where to find its gems.

Therefore, we can use this practice for gems that depend on other gems:

- Use a git address in the Gemfile for the other dependency, like this. Just use the `main` branch so it's easier to just do `bundle update` locally to get the latest versions.

    ``` ruby
    gem 'active_service', git: 'https://github.com/BranchIntl/active_service.git', branch: 'main'
    ```

- Specify the dependency and the version in the gemspec like this.

``` ruby
  spec.add_dependency 'active_service', '~> 1.0'
```

- Include the line `gemspec` in the Gemfile.

Importantly, to include your gem in an application, do this:

- Add your gem's path to the application's Gemfile like this. Note that we've used a specific tag here. This is to ensure that we are careful about which exact release we want.

    ``` ruby
    gem 'my_gem', git: 'https://github.com/BranchIntl/my_gem.git', tag: 'v1.0.0'
    ```

- If your gem depends on other private gems, you must include those gems in the application's Gemfile, otherwise `bundle install` on the application will attempt to find them from rubygems.org. For this, since we've explicitly specified which version of `my_gems_private_dependency` in `my_gem`'s gemspec, we can just use the branch main here unless there's a conflict necessitating using a tag.

    ``` ruby
    gem 'my_gems_private_dependency', git: 'https://github.com/BranchIntl/my_gems_private_dependency.git', branch: 'main'
    ```


