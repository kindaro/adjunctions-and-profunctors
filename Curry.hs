{- cabal:
build-depends:
  , base
  , tasty, tasty-quickcheck
  , profunctors
default-extensions: UnicodeSyntax, BlockArguments, TupleSections,
  TypeApplications, PartialTypeSignatures, PatternSynonyms ,
  LiberalTypeSynonyms, StandaloneDeriving , DeriveFunctor, DeriveFoldable,
  DeriveTraversable, DeriveGeneric , FlexibleInstances, FlexibleContexts,
  MultiParamTypeClasses, FunctionalDependencies , RankNTypes, DataKinds,
  PolyKinds, GADTs, ConstraintKinds, PolyKinds, KindSignatures, TypeOperators,
  TypeFamilies, TypeFamilyDependencies, NoMonomorphismRestriction,
  ScopedTypeVariables, UndecidableInstances
ghc-options: -Wpartial-type-signatures -fdefer-typed-holes -Wunused-packages
-}

module Main where

import Data.Profunctor
import Test.Tasty
import Test.Tasty.QuickCheck
import Data.Bifunctor

infixl 8 ∘
(∘) ∷ (b → c) → (a → b) → a → c
(∘) = (.)

main ∷ IO ( )
main = defaultMain do
  testGroup "naturality"
    [ testProperty "leftwards"
      \ (Fn (h ∷ Float → String)) (Fn (g ∷ Int → Char))
      → dimap h (fmap g) ∘ curry ↔ curry @_ @(Maybe Word) ∘ dimap (first h) g
    , testProperty "rightwards"
      \ (Fn (h ∷ Float → String)) (Fn (g ∷ Int → Char))
      → uncurry @_ @(Maybe Word) ∘ dimap h (fmap g) ↔ dimap (first h) g ∘ uncurry
    ]

class ExtensionalEquality α where
  isExtensionallyEqual ∷ α → α → Property

instance {-# overlappable #-} (Eq α, Show α, Arbitrary α) ⇒ ExtensionalEquality α where
  isExtensionallyEqual x y = property $ x === y

instance (ExtensionalEquality β, Show α, Arbitrary α) ⇒ ExtensionalEquality (α → β) where
  isExtensionallyEqual f g = property \ x → f x ↔ g x

instance (ExtensionalEquality β, Show α, Arbitrary α) ⇒ ExtensionalEquality (Fun α β) where
  isExtensionallyEqual (Fn f) (Fn g) = property \ x → f x ↔ g x

instance Show (String → Maybe Word → Int) where
  show _ = "…"

instance Show ((String, Maybe Word) → Int) where
  show _ = "…"

infix 4 ↔
(↔) ∷ ExtensionalEquality α ⇒ α → α → Property
(↔) = isExtensionallyEqual
