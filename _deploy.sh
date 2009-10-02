#!/usr/bin/env bash

ruby _generate_tag_archive.rb
rsync -rltPz --delete _site/ ralphvdh@blog.rvdh.de:domains/blog.rvdh.de/web/public
