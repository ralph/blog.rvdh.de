#!/usr/bin/env bash

ruby generate_tag_archive.rb
# rm _site/stylesheets/*.css
# ./bin/jammit --config assets.yml --base-url 'http://rvdh.de' -o _site/stylesheets/
rsync -rltPz --delete _site/ ralphvdh@rvdh.de:domains/rvdh.de/web/public
