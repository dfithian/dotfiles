#!/bin/bash

stack ghci --no-load --no-docker \
      --resolver lts-10.10 \
      --package classy-prelude \
      --package aeson \
      --package lens \
      --package monad-control \
      --package time \
      --package monad-logger \
      --package syb \
      --package contravariant \
      --package profunctors \
      --package yaml \
      --ghci-options -XConstraintKinds \
      --ghci-options -XDataKinds \
      --ghci-options -XDeriveDataTypeable \
      --ghci-options -XDeriveGeneric \
      --ghci-options -XEmptyDataDecls \
      --ghci-options -XFlexibleInstances \
      --ghci-options -XGADTs \
      --ghci-options -XGeneralizedNewtypeDeriving \
      --ghci-options -XLambdaCase \
      --ghci-options -XMultiParamTypeClasses \
      --ghci-options -XMultiWayIf \
      --ghci-options -XNamedFieldPuns \
      --ghci-options -XNoImplicitPrelude \
      --ghci-options -XNoMonomorphismRestriction \
      --ghci-options -XOverloadedStrings \
      --ghci-options -XPackageImports \
      --ghci-options -XPolyKinds \
      --ghci-options -XQuasiQuotes \
      --ghci-options -XRankNTypes \
      --ghci-options -XRecordWildCards \
      --ghci-options -XScopedTypeVariables \
      --ghci-options -XStandaloneDeriving \
      --ghci-options -XTemplateHaskell \
      --ghci-options -XTupleSections \
      --ghci-options -XTypeFamilies \
      --ghci-options -XTypeOperators \
      --ghci-options -XViewPatterns
