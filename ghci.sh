#!/bin/bash

stack ghci --no-load --no-docker \
      --package classy-prelude \
      --package aeson \
      --package lens \
      --package monad-control \
      --package time \
      --ghci-options -XDataKinds \
      --ghci-options -XEmptyDataDecls \
      --ghci-options -XFlexibleContexts \
      --ghci-options -XFlexibleInstances \
      --ghci-options -XGADTs \
      --ghci-options -XGeneralizedNewtypeDeriving \
      --ghci-options -XLambdaCase \
      --ghci-options -XMultiWayIf \
      --ghci-options -XNamedFieldPuns \
      --ghci-options -XNoImplicitPrelude \
      --ghci-options -XNoMonomorphismRestriction \
      --ghci-options -XOverloadedStrings \
      --ghci-options -XQuasiQuotes \
      --ghci-options -XRecordWildCards \
      --ghci-options -XScopedTypeVariables \
      --ghci-options -XStandaloneDeriving \
      --ghci-options -XTemplateHaskell \
      --ghci-options -XTupleSections \
      --ghci-options -XTypeFamilies \
      --ghci-options -XViewPatterns
