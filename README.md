# Data.Function.Meld
Map the arguments and return value of functions.

General use:

  - `f $* g1 $$ g2 … $$ gn *$ h = \x1 … xn -> h (f (g1 x1) (g2 x2) … (gn xn))`

Examples:

  - `on f g = f $* g $$ g *$ id`
  - `comparing f = compare $* f $$ f *$ id`
  - `f . g = f $* g *$ id`

Work based on [Semantic Editor Combinators](http://conal.net/blog/posts/semantic-editor-combinators) (Conal Elliot, 2016/05/19).
