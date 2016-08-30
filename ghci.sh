#!/bin/bash

stack ghci --no-load --no-docker \
      classy-prelude lens monad-control time \
      --ghci-options -XNoImplicitPrelude \
      --ghci-options -XScopedTypeVariables
