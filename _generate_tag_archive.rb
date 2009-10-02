# encoding: utf-8
require 'jekyll'
options  = {}
options = Jekyll.configuration(options)
site = Jekyll::Site.new(options)
site.read_posts(".")

archives_by_tag_template =<<END
---
layout: default
title: Ralph’s Blog Archives by Tag
url: /archives/by_tag.html
sidebar: blog
headline: Ralph’s Blog Archives by Tag
---

<h3>Blog Posts Archives</h3>
END

tag_section = []
site.tags.each do |tag, posts|
  archives_by_tag_template << "<h4 id=\"tag_#{tag}\">Posts tagged with #{tag}:</h4>\n"
  archives_by_tag_template << "<ul class=\"posts\">\n"
  posts_html =<<END
    {% for post in site.tags.#{tag} %}
      <li>
        <span class="less_emphasis small">{{ post.date | date_to_string }} »</span>
        <a href="{{ post.url }}">{{ post.title }}</a>
      </li>
    {% endfor %}
END
  archives_by_tag_template << posts_html
  archives_by_tag_template << "</ul>\n\n"
end

File.open("archives/by_tag.html", "w") do |f|
  f.write(archives_by_tag_template)
end
