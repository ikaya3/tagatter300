# SCSS 格納先を変更（rails3.1以降に準拠）
Sass::Plugin.remove_template_location("./public/stylesheets/sass")
Sass::Plugin.add_template_location("./app/assets/stylesheets")

# 最小サイズのCSSに変換する
Sass::Plugin.options[:style] = :compressed
