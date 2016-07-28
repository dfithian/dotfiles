#!/bin/bash

stack ghci \
  --package classy-prelude \
  --package lens \
  --package monad-control \
  --package time \
  --ghci-options -XNoImplicitPrelude \
  --ghci-options -XScopedTypeVariables
