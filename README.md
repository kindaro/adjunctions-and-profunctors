[Today I understood adjunctions.][1]

An adjunction allows you to bring arrows between the left and the right side of
the picture at will. Since [arrows are profunctors][2], you can also move them
around on the left and the right separately. There is a commutative square that
is not shown on the picture — it says that `uncurry ∘ dimap h (fmap g) ↔ dimap
(first h) g ∘ uncurry` and `dimap h (fmap g) ∘ curry ↔ curry ∘ dimap (first h)
g`. This is the naturality axiom that all adjunctions abide by. The seeming
simplicity is deceiving. There are so many moving parts, I would never make it
right without extensive property checking.

[1]: https://q.uiver.app/?q=WzAsOCxbMSwxLCJYIOKGkiDOsiJdLFs0LDEsIs6yIl0sWzQsMywi4p+ozrE7IFjin6kiXSxbMSwzLCLOsSJdLFswLDQsIs6xJyJdLFswLDAsIlgg4oaSIM6yJyJdLFs1LDAsIs6yJyJdLFs1LDQsIuKfqM6xJzsgWOKfqSJdLFsyLDEsIlxcdGV4dHt1bmN1cnJ5fVxcc3BhY2UgZiJdLFszLDAsImYiLDJdLFs0LDMsImgiLDJdLFswLDUsIlxcdGV4dHtmbWFwfVxcc3BhY2UgZyIsMl0sWzEsNiwiZyJdLFs3LDIsIlxcdGV4dHtmaXJzdH1cXHNwYWNlIGgiXSxbNCw1LCJcXHRleHR7ZGltYXB9XFxzcGFjZSBoXFxzcGFjZSAoXFx0ZXh0e2ZtYXB9XFxzcGFjZSBnKVxcc3BhY2UgZiJdLFs3LDYsIj8iLDJdLFs5LDgsIiIsMCx7ImxldmVsIjoxLCJzdHlsZSI6eyJuYW1lIjoiYWRqdW5jdGlvbiJ9fV0sWzksOCwiXFx0ZXh0e3VuY3Vycnl9IiwwLHsib2Zmc2V0IjotMywic2hvcnRlbiI6eyJzb3VyY2UiOjMwLCJ0YXJnZXQiOjMwfSwibGV2ZWwiOjEsInN0eWxlIjp7ImhlYWQiOnsibmFtZSI6ImhhcnBvb24iLCJzaWRlIjoidG9wIn19fV0sWzgsOSwiXFx0ZXh0e2N1cnJ5fSIsMCx7Im9mZnNldCI6LTMsInNob3J0ZW4iOnsic291cmNlIjozMCwidGFyZ2V0IjozMH0sImxldmVsIjoxLCJzdHlsZSI6eyJoZWFkIjp7Im5hbWUiOiJoYXJwb29uIiwic2lkZSI6InRvcCJ9fX1dXQ==
[2]: https://hackage.haskell.org/package/profunctors-5.6.2/docs/src/Data.Profunctor.Unsafe.html#line-168
