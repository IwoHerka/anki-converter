### Question
List and explain three methapors\* for reading Erlang code.\
\
*\*ferd.ca/on-erlang-s-syntax.html*


### Answer
Template view, English sentence and And, Or, Done.

#### Template view

In this view, Erlang code can be seen as a generic template you fill:

    head1(Args) [Guard] ->     Expression1, Expression2, ..., ExpressionN; head2(Args) [Guard] ->     Expression1, Expression2, ..., ExpressionN; headN(Args) [Guard] ->     Expression1, Expression2, ..., ExpressionN. 

#### English sentence

This one is about comparing Erlang code to English. Imagine you\'re
writing a list of things. Well, no. Don\'t imagine it, read it.

    I will need a few items on my trip:   if it's sunny, sunscreen, water, a hat;   if it's rainy, an umbrella, a raincoat;   if it's windy, a kite, a shirt. 

An Erlang translation can remain a bit similar:

    trip_items(sunny) ->     sunscreen, water, hat; trip_items(rainy) ->     umbrella, raincoat; trip_items(windy) ->     kite, shirt. 

#### And, Or, Done

Another variant of this one has been suggested to me on \#erlang. The
user simply reads , as \'and\', ; as \'or\' and . as being done. A
function declaration can then be read as a series of nested logical
statements and affirmations.


