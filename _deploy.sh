#!/usr/bin/env bash

ruby _generate_tag_archive.rb
rsync -rltPz --delete _site/ ralphvdh@rvdh.de:domains/rvdh.de/web/public
