# encoding: utf-8
environment = File.expand_path('../.bundle/environment.rb', __FILE__)
require environment

require 'jekyll'
options  = {}
options = Jekyll.configuration(options)
site = Jekyll::Site.new(options)
site.read_posts(".")

archives_by_tag_template =<<END
---
layout: default
title: Blog Archives by Tag
url: /blog/archives/by_tag.html
sidebar: blog
headline: Blog Archives by Tag
---

<h3>Blog Posts Archives</h3>
END

tag_section = []
site.tags.keys.sort.each do |tag|
  archives_by_tag_template << "<h4 id=\"tag_#{tag}\">Posts tagged with #{tag}:</h4>\n"
  archives_by_tag_template << "<ul class=\"posts\">\n"
  posts_html =<<END
  {% for post in site.tags.#{tag} %}
    {% include post_list_item.html %}
  {% endfor %}
END
  archives_by_tag_template << posts_html
  archives_by_tag_template << "</ul>\n\n"
end

File.open("site_source/blog/archives/by_tag.html", "w") do |f|
  f.write(archives_by_tag_template)
end



blog_sidebar_html =<<HTML
<div id="sidebar" class="column">
  <h3><a href="/blog/archives/index.html">Recent posts</a></h3>
  <ul class="posts">
  {% for post in site.posts limit:3 %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
  </ul>
  <h3><a href="/blog/archives/by_tag.html">Tags</a></h3>
  <ul>
HTML

site.tags.keys.sort.each do |tag|
  blog_sidebar_html << "    <li><a href=\"/blog/archives/by_tag.html\#tag_#{tag}\">#{tag}</a></li>\n"
end

blog_sidebar_html << "  </ul>\n</div>"
File.open("site_source/_includes/blog_sidebar.html", "w") do |f|
  f.write(blog_sidebar_html)
end
