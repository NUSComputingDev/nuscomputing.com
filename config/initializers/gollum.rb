require 'gollum/app'
class App < Precious::App
  before { assign_author }
  helpers do
    def assign_author
      session["gollum.author"].symbolize_keys!
    end
  end
end

# wiki_options = {}
# wiki_options[:css] = true # Equivalent to --css
# wiki_options[:js] = true # Equivalent to --js
# wiki_options[:template_dir] = path # Equivalent to --template-dir
# wiki_options[:page_file_dir] = path # Equivalent to --page-file-dir
# wiki_options[:gollum_path] = path # Equivalent to --gollum-path
# wiki_options[:ref] = ref ## Equivalent to --ref
# wiki_options[:repo_is_bare] = true # Equivalent to --bare
# wiki_options[:allow_editing] = false # # Equivalent to --no-edit
# wiki_options[:live_preview] = true # Equivalent to --live-preview
# wiki_options[:allow_uploads] = true # Equivalent to --allow-uploads
# wiki_options[:per_page_uploads] = true # When :allow_uploads is set, store uploads under a directory named after the page, as when using --allow-uploads page
# wiki_options[:mathjax] = true # Equivalent to --mathjax
# wiki_options[:mathjax_config] = source # Equivalent to --mathjax-config
# wiki_options[:user_icons] = source # Equivalent to --user-icons
# wiki_options[:show_all] = true # Equivalent to --show-all
# wiki_options[:collapse_tree] = true # Equivalent to --collapse-tree
# wiki_options[:h1_title] = true # Equivalent to --h1-title

template_dir = Rails.root.join('app', 'views', 'gollum', 'templates').to_s
wiki_options = {universal_toc: false, live_preview: false, allow_uploads: true, per_page_uploads: true, show_all: true, template_dir: template_dir}
App.set(:gollum_path, Rails.root.join('wiki').to_s)
App.set(:default_markup, :markdown) 
App.set(:wiki_options, wiki_options)


