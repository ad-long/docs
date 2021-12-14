#!/usr/bin/env bash

build() {
  products=(spot dm coin_margined_swap usdt_swap option)
  for product in ${products[@]}
    do
    langs=(cn en)
    for lang in ${langs[@]}
      do
      cp -f ../md/$product/v1/$lang/index.html.md source/index.html.md
      bundle exec middleman build --clean --build-dir ../docs/$product/v1/$lang/
      done
    done
}

build


