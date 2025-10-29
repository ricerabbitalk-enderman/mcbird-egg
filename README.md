# egg
## egg, the EasyGoing Generator ver. 1.1.0 for 1.21.x

This is being developed with the goal of “providing functional features at the bare minimum level required for practical use.”

Under the name **egg, the EasyGoing Generator**, we aim to make it as easy as possible for both users and developers.

We plan to implement features broadly across categories as long as they seem usable.

# Reference
### Objective

#### score #scoreholder --
**--** is the objective used for the scoreholder for variables.

<pre>
    scoreboard playres set #count -- 10
    scoreboard players operation #hp -- -= #damage --
    return run scoreboard players get #result --
</pre>

### Naming Convention
**&lt;function&gt;** is function name to call.

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

### egg:3d/scale_motion

+ **storage** <<**motion** :**Motion NBT DataTag**
+ **storage** <<**scale** :**Scale**
+ **storage** >>**motion** :**Scaled Motion NBT DataTag**
Scale Motion.
#### Sample
<pre>
    # Get Motion.
    data modify storage egg:3d/motion_from_rotation &lt;&lt;rotation set from entity @s Rotation
    function egg:3d/motion_from_rotation
    # Set parameters.
    data modify storage egg:3d/scale_motion &lt;&lt;motion set from storage egg:3d/motion_from_rotation &gt;&gt;motion
    data modify storage egg:3d/scale_motion &lt;&lt;scale set value 2.5
    function egg:3d/scale_motion
    # Get Motion result.
    data modify entity @s Motion set from storage egg:3d/scale_motion &gt;&gt;motion
</pre>

## egg:math
Math functions.

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
+ **strage** >>**asin**~double -- :**Arcsin[degree] (double)**
+ **strage** >>**acos**~double -- :**Arccos[degree] (double)**
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

### egg:math/atan2

+ **strage** <<**x**~double -- :**Coordinate x (double) [-1<=x<=1]**
+ **strage** <<**y**~double -- :**Coordinate y (double) [-1<=y<=1]**
+ **strage** >>**atan**~double -- :**Arctan[degree] (double)**
+ **return** : **Success or failure**
Get arctan.

#### Sample
<pre>
    # Set parameter.
    data modify storage egg:math/atan2 &lt;&lt;x~double
    data modify storage egg:math/atan2 &lt;&lt;y~double
    # Call function.
    function egg:math/atan2
    # Use result.
    execute store result score ... run data get storage egg:math/atan2 &gt;&gt;atan~double
</pre>

## egg:uuid
UUID handling functions.

### egg:uuid/equals
+ **storage** <<**this** :This entity's UUID
+ **storage** <<**that** :That entity's UUID
+ **return**  :This and that are equal
Compare UUIDs.

#### Sample
<pre>
    # Set this.
    data modify storage egg:uuid/equals &lt;&lt;this set from entity @s UUID
    # Set that.
    data modify storage egg:uuid/equals &lt;&lt;that set from entity @p UUID
    # If they are equals, say "it's me.".
    execute if function egg:uuid/equals run say "it's me."
</pre>

### egg:uuid/-match
+ **storage** <<**target** :Target entity's UUID
+ **return**  :This and that are equal
@s and target match by UUID.

#### Sample
<pre>
    # Set target.
    data modify storage egg:uuid/match &lt;&lt;target set from entity @s UUID
    # Find my wolf".
    execute as @e[type=wolf] if function egg:uuid/match run say "found my wolf!"
</pre>

## egg:input
Input informations functions.

### egg:input/-pressed
+ return  >>| Ticks that have not been pressed yet.
Get whether it is the first pressed tick.

#### Sample
<pre>
    # Get Information.
    execute store result score ... as @p run function egg:input/-pressed
</pre>

### egg:input/-pushed
+ return  >>| Ticks while continuously pressed.
Get whether it is currently pressed.

#### Sample
<pre>
    # Get Information.
    execute store result score ... as @p run function egg:input/-pushed
</pre>

### egg:input/-released
+ return  >>| Ticks that have been continuously pressed.
Get whether the key has been released.

#### Sample
<pre>
    # Get Information.
    execute store result score ... as @p run function egg:input/-released
</pre>
