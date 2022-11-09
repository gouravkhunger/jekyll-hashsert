gem uninstall jekyll-hashsert
gem build jekyll-hashsert.gemspec
gem install --local jekyll-hashsert-*.gem
rm jekyll-hashsert-*.gem