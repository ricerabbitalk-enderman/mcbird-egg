# egg
## egg, the EasyGoing Generator ver. 1.0 for 1.21.x

This is being developed with the goal of “providing functional features at the bare minimum level required for practical use.”

Under the name **egg, the EasyGoing Generator**, we aim to make it as easy as possible for both users and developers.

We plan to implement features broadly across categories as long as they seem usable.

# Reference
### Objective

#### score #scoreholder --
-- is the objective used for the scoreholder for variables.

<pre>
    scoreboard playres set #count -- 10
    scoreboard players operation #hp -- -= #damage --
    return run scoreboard players get #result --
</pre>

### Naming Convention
&lt;function&gt; is function name to call.

#### scoreboard
+ **score** <<**x** :**Integer x** (input)
+ **score** >>**type** :**Result type** (output)
+ **return** :**Result value** (output)
<pre>
    # Set parameter.
    scoreboard playres operation #&lt;function&gt;|&lt;&lt;x --
    # Call function and get result.
    execute store result score ##result -- function &lt;function&gt;
    # Use additional result.
    execute store result entity @s ... run scoreboard players get #&lt;function&gt;|&gt;&gt;type --
</pre>

#### storage
+ **storage** <<**x** :**Integer x** (input)
+ **storage** >>**result** :**Result value** (output)
<pre>
    # Set parameter.
    data modify storage &lt;function&gt; &lt;&lt;x set from ...
    # Call function.
    function &lt;function&gt;
    # Get result.
    execute store result entity @s ... run data get storage &lt;function&gt; &gt;&gt;result
</pre>

## egg:3d
3D processing functions.

### egg:3d/motion_from_rotation

+ **storage** <<**rotation** :**Rotation NBT DataTag**
+ **storage** >>**motion** :**Motion NBT DataTag**
Get Motion from Rotation.
#### Sample
<pre>
    # Set Rotation parameter.
    data modify storage egg:3d/motion_from_rotation &lt;&lt;rotation set from entity @s Rotation
    # Call function.
    function egg:3d/motion_from_rotation
    # Get Motion result.
    data modify entity @s Motion set from storage egg:3d/motion_from_rotation &gt;&gt;motion
</pre>

### egg:3d/rotation_from_motion

+ **storage** <<**motion** :**Motion NBT DataTag**
+ **storage** >>**rotation** :**Rotation NBT DataTag**
Get Rotation from Motion.
#### Sample
<pre>
    # Set Motion parameter.
    data modify storage egg:3d/rotation_from_motion &lt;&lt;motion set from entity @s Motion
    # Call function.
    function egg:3d/rotation_from_motion
    # Get Rotation result.
    data modify entity @s Motion set from storage egg:3d/rotation_from_motion &gt;&gt;rotation
</pre>

## egg:math
Math functions.

### egg:math/abs

+ **score** <<**x** -- :**Integer x**
+ **return** : **|x|**
Get absolute integer.

#### Sample
<pre>
    # Set parameter.
    scoreboard players set #egg:math/abs|&lt;&lt;x -- -1234
    # Call function and get result.
    execute store result score #abs-x -- run function egg:math/abs
    # It will not execute. 0<=|x|
    execute unless score #abs-x -- matches 0.. run return fail
</pre>

### egg:math/sgn

+ **score** <<**x** -- :**Integer x**
+ **return** : **sgn x**
Get integer sign.

#### Sample
<pre>
    # Set parameter.
    scoreboard players set #egg:math/sgn|&lt;&lt;x -- -1234
    # Call function and get result.
    execute store result score #sgn-x -- run function egg:math/sgn
    # Use sign.
    scoreboard players operation #variable -- *= #sgn-x --
</pre>

### egg:math/scalar

+ **strage** <<**x**~double -- :**Coordinate or vectro x (double) [-128<=x<=128]**
+ **strage** <<**y**~double -- :**Coordinate or vectro y (double) [-128<=y<=128]**
+ **strage** <<**z**~double -- :**Coordinate or vectro z (double) [-128<=z<=128]**
+ **strage** >>**scalar**~double -- :**Scalar value (double)**
+ **return** : **Success or failure**
Get scalar value from coordinate or vector.

#### Sample
<pre>
    # Set parameter.
    data modify storage egg:math/scalar &lt;&lt;x~double
    data modify storage egg:math/scalar &lt;&lt;y~double
    data modify storage egg:math/scalar &lt;&lt;z~double
    # Call function.
    function egg:math/scalar
    # Use result.
    execute store result score ... run data get storage egg:math/scalar &gt;&gt;scalar~double
</pre>

### egg:math/sin_cos

+ **strage** <<**degree**~double -- :**Degrees (double) [Unlimited]**
+ **strage** >>**sin**~double -- :**Sin (double)**
+ **strage** >>**cos**~double -- :**Cos (double)**
+ **return** : **Success or failure**
Get sin and cos.

#### Sample
<pre>
    # Set parameter.
    data modify storage egg:math/sin_cos &lt;&lt;degree~double
    # Call function.
    function egg:math/sin_cos
    # Use result.
    execute store result score ... run data get storage egg:math/sin_cos &gt;&gt;sin~double
    execute store result score ... run data get storage egg:math/sin_cos &gt;&gt;cos~double
</pre>

### egg:math/sin_cos_tan

+ **strage** <<**degree**~double -- :**Degrees (double) [Unlimited]**
+ **strage** >>**sin**~double -- :**Sin (double)**
+ **strage** >>**cos**~double -- :**Cos (double)**
+ **strage** >>**tan**~double -- :**Tan (double)**
+ **return** : **Success or failure**
Get sin and cos and tan.

#### Sample
<pre>
    # Set parameter.
    data modify storage egg:math/sin_cos_tan &lt;&lt;degree~double
    # Call function.
    function egg:math/sin_cos_tan
    # Use result.
    execute store result score ... run data get storage egg:math/sin_cos_tan &gt;&gt;sin~double
    execute store result score ... run data get storage egg:math/sin_cos_tan &gt;&gt;cos~double
    execute store result score ... run data get storage egg:math/sin_cos_tan &gt;&gt;tan~double
</pre>

### egg:math/asin_acos

+ **strage** <<**x**~double -- :**Coordinate x (double) [-1<=x<=1]**
+ **strage** >>**asin**~double -- :**Arcsin (double)**
+ **strage** >>**acos**~double -- :**Arccos (double)**
+ **return** : **Success or failure**
Get arcsin and arccos.

#### Sample
<pre>
    # Set parameter.
    data modify storage egg:math/asin_acos &lt;&lt;x~double
    # Call function.
    function egg:math/asin_acos
    # Use result.
    execute store result score ... run data get storage egg:math/asin_acos &gt;&gt;asin~double
    execute store result score ... run data get storage egg:math/asin_acos &gt;&gt;acos~double
</pre>

### egg:math/atan

+ **strage** <<**m**~double -- :**Slope m (double) [Unlimited]**
+ **strage** >>**atan**~double -- :**Arctan (double)**
+ **return** : **Success or failure**
Get arctan considering the quadrant.

#### Sample
<pre>
    # Set parameter.
    data modify storage egg:math/atan &lt;&lt;m~double
    # Call function.
    function egg:math/atan
    # Use result.
    execute store result score ... run data get storage egg:math/atan &gt;&gt;atan~double
</pre>

### egg:math/atan2

+ **strage** <<**x**~double -- :**Slope x (double) [-1<=x<=1]**
+ **strage** <<**y**~double -- :**Slope y (double) [-1<=y<=1]**
+ **strage** >>**atan**~double -- :**Arctan (double)**
+ **return** : **Success or failure**
Get arctan for .

#### Sample
<pre>
    # Set parameter.
    data modify storage egg:math/atan2 &lt;&lt;m~double
    # Call function.
    function egg:math/atan2
    # Use result.
    execute store result score ... run data get storage egg:math/atan2 &gt;&gt;atan~double
</pre>

