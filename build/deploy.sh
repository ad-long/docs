#!/usr/bin/env bash

build() {
  products=(coin_margined_swap dm option spot usdt_swap)
  for product in ${products[@]}
    do
    langs=(cn en)
    for lang in ${langs[@]}
      do
      cp -f ../md/$product/v1/$lang/index.html.md source/index.html.md
      bundle exec middleman build --clean --build-dir ../docs/$product/v1/$lang/
      done
    done
  cp -rf ../docs/usdt_swap/v1/cn/* ../docs/
}

build


