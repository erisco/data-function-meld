# Data.Function.Meld
Map the arguments and return value of functions.

General use:

  - `f $* g1 $$ g2 … $$ gn *$ h = \x1 … xn -> h (f (g1 x1) (g2 x2) … (gn xn))`

Examples:

  - `on f g = f $* g $$ g *$ id`
  - `comparing f = compare $* f $$ f *$ id`
  - `f . g = f $* g *$ id`

Related work:

  - [Semantic Editor Combinators](http://conal.net/blog/posts/semantic-editor-combinators) 
    (Conal Elliott, 2008/11/24). Introduces composable editors for 
    function arguments and return values.
  - [Pointless Fun](http://matt.immute.net/content/pointless-fun) (Matt 
    Hellige, 2008/12/03). Derives a similar operator named `~>`. This
    operator composes an editor which can then be applied to the subject
    to edit. This better agrees with Conal's concept of Semantic Editor 
    Combinators. In contrast, `$*` includes the subject as part of the 
    editor, though you can write `($* g1 $$ g2 … $$ gn *$ h)` for an 
    editor independent of the subject. Also, `~>` is right-associative 
    whereas `$*` and `$$` are left-associative.
  - [TypeCompose version 0.9.11](http://hackage.haskell.org/package/TypeCompose-0.9.11/docs/Control-Compose.html)
    (Conal Elliott, 2016/01/15). Package including an implementation of
    `~>`.

