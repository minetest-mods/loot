#Loot

This is a framework for registering and generating loot. It also adds loot
chests to dungeons.

Settings
======
```loot_vaults``` - Set to ```true``` to enable loot vault generation. <br/>
```loot_dungeons``` - Set to ```true``` to enable loot generation in dungeons.

API
===
Registering
-----------
To register a piece of loot, call <br/>
```
loot.register_loot({ weights = { cat1 = x1, cat2 = x2, ... },
                     payload = { stack = <ItemStack>,
                                 min_size = <a nonnegative integer>,
                                 max_size = <a positive integer>,
                               },
})
```
<br/>
The ```weights``` table is a map from loot category names to weight values -
these are positive integers, where higher values means more likely to be
generated in that category. If the total weight of all the loot in a loot
category is t, and the weight of a particular loot is p, then the chance of
that piece of loot being generated from that category is p/t. As a consequence,
adding more pieces of loot to a category make the existing pieces of loot less
likely to be generated.
<br/>
The ```payload``` table describes what your piece of loot is. ```stack``` is an
```ItemStack``` that you want generated as loot, and min_size and max_size are
optional minimum and maximum stack sizes to be generated. If they are no
provided, ```stack``` is used unmodified.

Generating
----------
To generate ```count``` stacks of loot from category "category", call <br/>
```
loot.generate_loot("category", count)
```
<br/>
This returns a list of ```ItemStack```s with ```count``` elements. Afterwards,
you can stuff it in a chest or other container, or drop them in the world, etc.

Predefined Categories
---------------------
 - ```generic```: The dumping ground for almost all loot. Put your loot in this
   category if you want it to be available in dungeons, or other mods that
   choose to generate generic loot.
 - ```valuable```: Used for particularly valuable loot, such as precious stones
   or metals. Dungeons and loot vault chests are guaranteed to contain at least
   one of these.

<br/>
You do not need to define a category before using it; simply put it in your
loot's weights table.