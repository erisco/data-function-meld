{-| Map the arguments and return value of functions. 

General use:

  - @f $* g1 $$ g2 … $$ gn *$ h = \x1 … xn -> h (f (g1 x1) (g2 x2) … (gn xn))@

Examples:

  - @on f g = f $* g $$ g *$ id@
  - @comparing f = compare $* f $$ f *$ id@
  - @f . g = f $* g *$ id@

Work based on <http://conal.net/blog/posts/semantic-editor-combinators Semantic Editor Combinators> (Conal Elliot, 2016/05/19).
-}
module Data.Function.Meld
( ($*)
, ($$)
, (*$)
) where

import Prelude (flip, (.), ($))

-- | Map a function argument.
arg :: (a' -> a) -> (a -> b) -> a' -> b
arg = flip (.)

-- | Map a function return value.
ret :: (b -> c) -> (a -> b) -> a -> c
ret = (.)

-- | Begin melding.
--
-- @f $* g1 $$ g2 … $$ gn *$ h = \x1 … xn -> h (f (g1 x1) (g2 x2) … (gn xn))@
($*) :: (b -> c) -> (a -> b) -> (c -> d) -> a -> d
($*) x f g = ret g (arg f x)
infixl 8 $*

-- | Continue melding.
--
-- @f $* g1 $$ g2 … $$ gn *$ h = \x1 … xn -> h (f (g1 x1) (g2 x2) … (gn xn))@
($$) :: (((b -> c) -> a -> d) -> e) -> (a -> b) -> (c -> d) -> e
($$) f g h = f (ret h . arg g)
infixl 7 $$

-- | Finish melding.
--
-- @f $* g1 $$ g2 … $$ gn *$ h = \x1 … xn -> h (f (g1 x1) (g2 x2) … (gn xn))@
(*$) :: (a -> b) -> a -> b
(*$) = ($)
infixl 6 *$
