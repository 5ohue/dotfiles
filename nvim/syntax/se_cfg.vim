syntax case ignore

syntax region Identifier start=+^\s*\w+  skip=+\\"+  end=+\W+
syntax region String     start=+"+        skip=+\\"+  end=+"+
syntax region Comment    start=+\/\/+           end=+$+
syntax region Comment    start=+\/\*+           end=+\*\/+
syntax match  Delimiter  +[(){},]+
syntax match  Number     +[0-9\.]+
syntax match  Operator   +[+-]+
