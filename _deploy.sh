#!/usr/bin/env bash

rsync -rltPz --delete _site/ ralphvdh@blog.rvdh.de:domains/blog.rvdh.de/web/public
