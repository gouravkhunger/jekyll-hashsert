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
{% assign hash = "$" | hashsert %}
{{ hash }}
```

The `$` symbol will be replaced with a random alphanumeric string of length 64

> **Note**: By default, the plugin replaces all the `$` symbols in the input string with alphanumeric string hashes of length `64`. Each `$` will be replaced with a different hash.

### Custom symbol

To use a custom replacement symbol instead of the default `$`, please pass it as a parameter to the filter:

```liquid
{% assign hash = "o_o" | hashsert: "_" %}
{{ hash }}
```

The `_` symbol will be replaced while the surrounding text will be preserved.
Output will look like: `o<hash>o`.

> **Note**: The symbol should only be one character long and should **not** be alphnumeric.

### Custom length

To set a custom length for the generated hash, pass the required number as a 2nd argument, after the symbol:

```liquid
{% assign hash = "o_o" | hashsert: "_", 5 %}
{{ hash }}
```

The `_` symbol will be replaced with a string of length 5 while the surrounding text will be preserved.
Output will look like: `o<alphanumeric string of length 5>o`.

> **Note**: The 2nd argument should only be an integer. If you intend to set a custom length then you must also set a symbol. You may still pass `$` if you wish to retain the default behavior.

## Use case

The most prominent use case for this plugin is to insert random alphanumeric characters into strings. For example, GitHub requires hashes to serve versions of open graph images for repositories. To use the latest versions you need a new random hash:

```
https://opengraph.githubassets.com/<any_hash_number>/<owner>/<repo>
```

You can use this plugin to generate such urls:

```liquid
{% assign image = "https://opengraph.githubassets.com/$/gouravkhunger/jekyll-hashsert" | hashsert %}

<img src="{{ image }}" alt="Open graph image for gouravkhunger/jekyll-hashsert GitHub repository" />
```

## License

The gem is available as open source under the terms of the [MIT License](https://github.com/gouravkhunger/jekyll-hashsert/blob/main/LICENSE).

```
MIT License

Copyright (c) 2022 Gourav Khunger

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
