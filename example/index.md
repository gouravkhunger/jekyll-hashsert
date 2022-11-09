---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
---

# Jekyll::Hashsert

A jekyll plugin that inserts random hashes of custom length into strings.

## Installation

Add this line to your project's Gemfile inside the `jekyll_plugins` group:

```ruby
group :jekyll_plugins do
    # other gems
    gem "jekyll-hashsert"
end
```

Then, enable the plugin by adding it to the `plugins` section in the `_config.yml` file:

```yaml
plugins:
    # - other plugins
    - jekyll-hashsert
```

And then execute:

```shell
bundle install
```

## Usage

This plugin is essentially a liquid filter. You can pass any string to the filter:

```liquid
{% raw %}{% assign hash = "$" | hashsert %}
{{ hash }}

The $ symbol will be replaced with a random alphanumeric string of length 64{% endraw %}
```

The output for `{% raw %}{{ hash }}{% endraw %}` in this case will look something similar to this:

```
{% assign hash = "$" | hashsert %}{{ hash }}
```

> **Note**: By default, the plugin replaces all the `$` symbols in the input string with alphanumeric string hashes of length `64`. Each `$` will be replaced with a different hash.

### Custom symbol

To use a custom replacement symbol instead of the default `$`, please pass it as a parameter to the filter:

```liquid
{% raw %}{% assign hash = "o_o" | hashsert: "_" %}
{{ hash }}

The _ symbol will be replaced while the surrounding text will be preserved.
Output will look like: o<hash>o.{% endraw %}
```

The output for `{% raw %}{{ hash }}{% endraw %}` in this case will look something similar to this:

```
{% assign hash = "o_o" | hashsert: "_" %}{{ hash }}
```

> **Note**: The symbol should only be one character long and should **not** be alphnumeric.

### Custom length

To set a custom length for the generated hash, pass the required number as a 2nd argument, after the symbol:

```liquid
{% raw %}{% assign hash = "o_o" | hashsert: "_", 5 %}
{{ hash }}

The _ symbol will be replaced with a string of length 5 while the surrounding text will be preserved.
Output will look like: o<alphanumeric string of length 5>o.{% endraw %}
```

The output for `{% raw %}{{ hash }}{% endraw %}` in this case will look something similar to this:

```
{% assign hash = "o_o" | hashsert: "_", 5 %}{{ hash }}
```

> **Note**: The 2nd argument should only be an integer. If you intend to set a custom length then you must also set a symbol. You may still pass `$` if you wish to retain the default behavior.

## Use case

The most prominent use case for this plugin is to insert random alphanumeric characters into strings. For example, GitHub requires hashes to serve versions of open graph images for repositories. To use the latest versions you need a new random hash:

```
https://opengraph.githubassets.com/<any_hash_number>/<owner>/<repo>
```

You can use this plugin to generate such urls:

```liquid
{% raw %}{% assign image = "https://opengraph.githubassets.com/$/gouravkhunger/jekyll-hashsert" | hashsert %}

<img src="{{ image }}" alt="Open graph image for gouravkhunger/jekyll-hashsert GitHub repository" />{% endraw %}
```

The output for `{% raw %}{{ image }}{% endraw %}` in this case will look something similar to this:

```
{% assign image = "https://opengraph.githubassets.com/$/gouravkhunger/jekyll-hashsert" | hashsert %}{{ image }}
```

## License

The gem is available as open source under the terms of the [MIT License](https://github.com/gouravkhunger/jekyll-hashsert/blob/main/LICENSE).
