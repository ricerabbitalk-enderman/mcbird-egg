# mcbird-egg

## egg, the EasyGoing Generator ver. 1.5.0 for 1.21.11

[English](README.md) / [日本語](README-jp.md)

This is being developed with the goal of “providing functional features at the bare minimum level required for practical use.”

Under the name **egg, the EasyGoing Generator**, we aim to make it as easy as possible for both users and developers.

We plan to implement features broadly across categories as long as they seem usable.

# Reference

## Objective

### score #var_name --

**--** is the objective used for variables.

```mcfunction
  # Count.
  scoreboard playres set #count -- 10-
  # Damage calculation.
  scoreboard players operation #hp -- -= #damage --
  # Return result.
  return run scoreboard players get #result --

  # NG! do not use on actual entities.
  scoreboard players set @s -- 1234
```

## Naming Convention

**(function)** is the name of function.

### scoreboard

|Notation|Meaning|
|:-|:-|
|**score** #(function)\|<<**argument**|input/argument|
|**score** #(function)\|>>**result**|output/result|

To avoid name collisions in the scoreboard, the specification requires that function names be prefixed.

This allows the function's inputs and outputs to be clearly distinguished by the function name.

```mcfunction
  ## Example: input/argument
  # Set arguments.
  execute store result score #xxx:heal|<<hp -- run data get entity @s Health
  scoreboard players set #xxx:heal|<<amount -- 10
  scoreboard players set #xxx:heal|<<percent -- 20
  # Call function.
  function xxx:heal

  ## Example: output/result + input/argument
  # Get rotation.
  function xxx:get_rotation
  # Get result and change rotation.
  scoreboard players add #xxx:get_rotation|>>yaw -- 20
  scoreboard players add #xxx:get_rotation|>>pitch -- 30
  # Set argument.
  scoreboard players operation #xxx:rotate|<<yaw -- = #xxx:get_rotation|>>yaw
  scoreboard players operation #xxx:rotate|<<pitch -- = #xxx:get_rotation|>>pitch
  # Rotate.
  function xxx:rotate
```

### storage

|Notation|Meaning|
|:-|:-|
|**storage** (function) <<**argument**|input/argument|
|**storage** (function) >>**result**|output/result|

Like the score, the namespace is the function name.

```mcfunction
  ## Example: input/argument + output/result (function xxx:tan)
  # Set argument.
  data modify storage xxx:sin_cos <<degree set from storage xxx:tan <<degree
  # Get sin and cos.
  function xxx:sin_cos
  # Get result.
  execute store result score #xxx:tan|sin run data get storage xxx:sin_cos >>sin
  execute store result score #xxx:tan|cos run data get storage xxx:sin_cos >>cos
  # Calculate tan.
  scoreboard players operation #xxx:tan|result -- = #xxx:tan|sin --
  scoreboard players operation #xxx:tan|result -- /= #xxx:tan|cos --
  # Return tan.
  return run scoreboard players get #xxx:tan|result
```

## egg:3d

**This module consolidates processing related to the game's 3D space.**

Calculations for 3D positional relationships, orientation, and momentum are performed.

The primary targets for reference and manipulation are the Pos, Motion, and Rotation fields within NBT data tags.

### `function egg:3d/motion_from_rotation`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:3d/motion_from_rotation <<rotation`|in|Rotation data|
|`storage egg:3d/motion_from_rotation >>motion`|out|Motion data|
|`return`|out|Succeeded function or not|

**Get Motion from Rotation.**

Rotation data and Motion data correspond to the Rotation and Motion NBT data tags.

The Motion data obtained is a unit vector (1 tick movement equals 1 block).

Use the function egg:nog/scale_motion to adjust the movement amount.

### `function egg:3d/rotation_from_motion`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:3d/rotation_from_motion <<motion`|in|Motion data|
|`storage egg:3d/rotation_from_motion >>rotation`|out|Rotation data|
|`return`|out|Succeeded function or not|

**Get Rotation from Motion.**

Rotation data and Motion data correspond to the Rotation and Motion NBT data tags.

Since internal calculations use fixed-point arithmetic, precision varies depending on the values.

For high-precision results, other methods are recommended.

## egg:math

**This is a module for mathematical calculations such as trigonometric functions.**

In this module, input and output parameters are suffixed with ~double, declaring that they accept double inputs and produce double outputs.

However, note that internal calculations are performed using fixed-point arithmetic, so precision may vary depending on the conditions.

### `function egg:math/sin_cos`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:math/sin_cos <<degree~double`|in|Unlimited degrees|
|`storage egg:math/sin_cos >>sin~double`|out|Sin value|
|`storage egg:math/sin_cos >>cos~double`|out|Cos value|
|`return`|out|Succeeded function or not|

**Simultaneously obtains the values of sin and cos for a given angle in degrees.**

For processing efficiency, sin and cos are calculated as a set.

### `function egg:math/sin_cos_tan`

@function egg:math/sin_cos_tan
|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:math/sin_cos_tan <<degree~double`|in|Unlimited degrees|
|`storage egg:math/sin_cos_tan >>sin~double`|out|Sin value|
|`storage egg:math/sin_cos_tan >>cos~double`|out|Cos value|
|`storage egg:math/sin_cos_tan >>tan~double`|out|Tan value|
|`return`|out|Succeeded function or not|

**Calculates the values of sin, cos, and tan simultaneously for a given angle in degrees.**

Since calculating tan from sin/cos yields higher precision than direct tan calculation, all trigonometric values are computed.

Fixed-point arithmetic is used, resulting in reduced precision for large values near 90 degrees.

### `function egg:math/asin_acos`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:math/asin_acos <<x~double`|in|Trigonometric value x (-1 <= x <= 1)|
|`storage egg:math/asin_acos >>asin~double`|out|Arcsin value|
|`storage egg:math/asin_acos >>acos~double`|out|Arccos value|
|`return`|out|Succeeded function or not|

**Get arcsin and arccos.**

To optimize processing efficiency, arcsin and arccos are calculated as a set.
Arguments outside the range of -1 to 1 are adjusted to fall within this range.

If you require strict verification, check beforehand.

### `function egg:math/atan2`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:math/atan2 <<x~double`|in|Coordinate x|
|`storage egg:math/atan2 <<y~double`|in|Coordinate y|
|`storage egg:math/atan2 >>atan~double`|out|Arctan value|
|`return`|out|Succeeded function or not|

**Calculate the slope from (x, y) and get the arctan value.**

Fixed-point calculations are acceptable when moderate precision suffices, but consider alternative methods when high precision is required.

Fixed-point systems particularly struggle with extremely large or small numbers, leading to significant precision errors.

Exercise caution when numerical differences between x and y are extreme, such as (10000, 0.0001).

## egg:input

**This feature detects right-clicks on items within the data component 

`minecraft:custom_data` that contain `{“egg”:{‘type’:“device”}}`.**
As a prerequisite, the target `@s` must be holding an item with the data component `minecraft:block_attacks`.

If you wish to bypass the actual shield functionality, add the data component to the item as shown below.
```json
{
  "components": {
    "minecraft:blocks_attacks": {
      "damage_reductions": [{"base": 0,"factor": 0}]
    },
    "minecraft:custom_data": {"egg": {"type": "device"}}
  }
}
```
Data components are usable in recipes, root tables, etc.
Hereafter, items possessing this data component will be denoted as `egg:device`.
This feature is automatically granted to all players.

### `function egg:input/-pushed`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|Number of ticks input continuously|

**Determine whether player `@s` is right-clicking on `egg:device`. Both hands are considered.**

This returns true = “number of ticks input is held” continuously while right-clicked.

To detect a single press for one-time activation, use `function egg:input/-triggered`.

### `function egg:input/-released`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|Ticks that have been continuously pressed|

**Detects whether the player `@s` has stopped right-clicking on `egg:device`. This applies to both hands.**

This returns true only for the first tick that was no longer right-clicked, representing the number of ticks that were continuously input.

### `function egg:input/-triggered`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|Number of ticks without input|

**Determine whether player `@s` is right-clicking on `egg:device`. Both hands are considered.**

This returns true only for the first tick right-clicked, representing the “number of ticks in non-input state”.

To detect sustained presses like burst fire or full-auto fire, use `function egg:input/-pushed`.

## egg:alignment

**This module expresses the relationships between mobs based on the player.**

Mob alignment will now be properly maintained in egg.alignment during the `minecraft:tick` update process immediately after spawning.

Note that alignment can change at any time due to neutral mobs becoming hostile or being tamed.

It can take the following values:

|-1|0|1|
|:-:|:-:|:-:|
|Hostile to player|Neutral to player|Friendly to player|

Furthermore, this alignment solely represents the relationship between the player and all other players as a single allied faction.

It does not represent player-versus-player relationships between players themselves, nor does it represent hostile relationships unaffected by the player (such as wild wolves attacking skeletons).

### `function egg:alignment/conflict`

|Parameter|Type|Description|
|:-|:-|:-|
|`score #egg:alignment/conflict\|<<this --`|in|This alignment|
|`score #egg:alignment/conflict\|<<that --`|in|That alignment|
|`return`|out|Whether they are in conflict|

**Checks whether it is in conflict with the target.**

### `function egg:alignment/friendly`

|Parameter|Type|Description|
|:-|:-|:-|
|`score #egg:alignment/friendly\|<<this --`|in|This alignment|
|`score #egg:alignment/friendly\|<<that --`|in|That alignment|
|`return`|out|Whether they are friendly or not.|

**Checks whether they are friendly or not.**

## egg:pointer

**type** : `minecraft:snowball`

**tag** : `egg.pointer`

**This is a snowball pointer feature that references entities.**

Using the snowball's NBT data tag “Owner”, you can switch the command executor `@s` to the referenced entity directly via `execute on origin`.

Snowballs that become pointers become invisible, weightless entities that cannot be destroyed by collisions.

If no longer needed, explicitly delete them using the kill command.

### `function egg:pointer/-enable`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|Succeeded or not.|

**Begin using snowball `@s` as a pointer entity.**

Pointer entities can directly specify the referenced entity using the `on origin` subcommand.

## egg:shock

**This module handles damage and knockback.**

It inflicts damage and knockback within a range from the command execution point.

Functions are split based on the presence of the attacking entity causing the damage and the relationship (alignment) between the attacking and target entities.

While it has many arguments, most have default values, so it functions with just the minimum specifications of .distance and .amount. Default values for arguments are shown below.

|Argument|Default Value|
|:-|:-|
|<<.distance|Required|
|<<.amount|Required|
|<<.source|Optional|
|<<.namespace|“minecraft”|
|<<.type|“generic”|
|<<.scale|1.0|
|<<.xv|0.0|
|<<.yv|0.0|
|<<.zv|0.0|

Damage type is expressed by <<.namespace and <<.type, defaulting to `minecraft:generic`.

Knockback is applied to entities within the effect radius, increasing in magnitude toward the source and decreasing with distance.

Furthermore, the knockback momentum can be scaled using <<.scale and adjusted using <<.xv, <<.yv, <<.zv.

Depending on implementation, upward knockback generally does not occur by default. Therefore, you must either use <<.yv to simulate upward knockback or position the effect source slightly below ground level.

### `function egg:shock/give_by_no_one`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:shock/give_by_no_one <<.distance`|in|Damage range|
|`storage egg:shock/give_by_no_one <<.amount`|in|Damage amount|
|`storage egg:shock/give_by_no_one <<.namespace`|in|Damage type (namespace)|
|`storage egg:shock/give_by_no_one <<.type`|in|Damage type (type)|
|`storage egg:shock/give_by_no_one <<.scale`|in|Knockback multiplier (scale > 0)|
|`storage egg:shock/give_by_no_one <<.xv`|in|Knockback initial velocity x|
|`storage egg:shock/give_by_no_one <<.yv`|in|Knockback initial velocity y|
|`storage egg:shock/give_by_no_one <<.zv`|in|Knockback initial velocity z|
|`return`|out|Succeeded or not.|

**Inflicts damage and knockback on all entities within a radius of distance centered on the command position.**

This damage processing involves no malicious intent on the part of the attacker, and the damaged entity accepts it as mere misfortune.

### `function egg:shock/give_to_anyone`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:shock/give_to_anyone <<.distance`|in|Damage range|
|`storage egg:shock/give_to_anyone <<.amount`|in|Damage amount|
|`storage egg:shock/give_to_anyone <<.source`|in|UUID of attacker entity|
|`storage egg:shock/give_to_anyone <<.namespace`|in|Damage type (namespace)|
|`storage egg:shock/give_to_anyone <<.type`|in|Damage type (type)|
|`storage egg:shock/give_to_anyone <<.scale`|in|Knockback multiplier (scale > 0)|
|`storage egg:shock/give_to_anyone <<.xv`|in|Knockback initial velocity x|
|`storage egg:shock/give_to_anyone <<.yv`|in|Knockback initial velocity y|
|`storage egg:shock/give_to_anyone <<.zv`|in|Knockback initial velocity z|
|`return`|out|Succeeded or not.|

**Inflicts damage and knockback on all entities within a radius of distance centered on the command position.**

This damage processing involves no malicious intent on the part of the attacker, and the damaged entity accepts it as mere misfortune.

### `function egg:shock/give_to_oppositions`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:shock/give_to_oppositions <<.distance`|in|Damage range|
|`storage egg:shock/give_to_oppositions <<.amount`|in|Damage amount|
|`storage egg:shock/give_to_oppositions <<.source`|in|UUID of attacker entity|
|`storage egg:shock/give_to_oppositions <<.namespace`|in|Damage type (namespace)|
|`storage egg:shock/give_to_oppositions <<.type`|in|Damage type (type)|
|`storage egg:shock/give_to_oppositions <<.scale`|in|Knockback multiplier (scale > 0)|
|`storage egg:shock/give_to_oppositions <<.xv`|in|Knockback initial velocity x|
|`storage egg:shock/give_to_oppositions <<.yv`|in|Knockback initial velocity y|
|`storage egg:shock/give_to_oppositions <<.zv`|in|Knockback initial velocity z|
|`return`|out|Succeeded or not.|

**Inflicts damage and knockback on entities hostile to the attacker within a radius of distance centered on the command position.**

This damage processing involves no malicious intent on the part of the attacker, and the damaged entity accepts it as mere misfortune.

### `function egg:shock/give_to_others`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:shock/give_to_others <<.distance`|in|Damage range|
|`storage egg:shock/give_to_others <<.amount`|in|Damage amount|
|`storage egg:shock/give_to_others <<.source`|in|UUID of attacker entity|
|`storage egg:shock/give_to_others <<.namespace`|in|Damage type (namespace)|
|`storage egg:shock/give_to_others <<.type`|in|Damage type (type)|
|`storage egg:shock/give_to_others <<.scale`|in|Knockback multiplier (scale > 0)|
|`storage egg:shock/give_to_others <<.xv`|in|Knockback initial velocity x|
|`storage egg:shock/give_to_others <<.yv`|in|Knockback initial velocity y|
|`storage egg:shock/give_to_others <<.zv`|in|Knockback initial velocity z|
|`return`|out|Succeeded or not.|

**Inflicts damage and knockback on attackers within range and entities that are not friendly.**

This damage processing involves no malicious intent on the part of the attacker, and the damaged entity accepts it as mere misfortune.

## egg:model

**type** : `minecraft:block_display`

**tag** : `egg.model`

**This feature handles models created by BDEngine.**

It targets data converted by mcbird/bde2egg.js from data packs containing model and animation information output by BDEngine.

You can manipulate model entities generated by the `function #egg:bdengine/[model name (project name)]`.

### `function egg:model/-enable`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|Succeeded or not|

**Enable the `egg:model` feature.**

The block display entity for the target `@s` is enabled as egg.model,
making all egg:model/-xxx features available.

### `function egg:model/-delete`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|Succeeded or not|

**Delete the `egg:model` entity.**

Since `egg:model` consists of multiple part entities,
it cannot be completely deleted with a single /kill command.

Always use this function to delete it.

### `function egg:model/-rotate`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|Succeeded or not|

**Rotate the `egg:model` entity.**

Since `egg:model` consists of multiple part entities,
a single /rotate command cannot rotate it correctly.

Always use this function to rotate it.

### `function egg:model/-set_pose`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:model/-set_pose <<pose`|in|Pose data|
|`return`|out|Succeeded or not|

**Set pose for the `egg:model` entity.**

This data was generated using the animation features of BDEngine
and converted for use in egg datapack via mcbird/bde2egg.js.

### `function egg:model/-transform_with_interpolation`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|Succeeded or not|

**Performs linear interpolation on the `egg:model` entity.**

Linear interpolation compliant with BDEngine's animation features is applied.

### `function egg:model/-transform_without_interpolation`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|Succeeded or not|

**Prevents linear interpolation from being applied to the `egg:model` entity.**

Specify to immediately reflect the pose without linear interpolation for initial pose setting.

## egg:animatioin

**type** : `minecraft:block_display`

**tag** : ``egg:animation``

**This feature handles animation created by BDEngine.**

It targets data converted by mcbird/bde2egg.js from data packs containing model and animation information output by BDEngine.

You can manipulate model entities generated by the `function #egg:bdengine/[model name (project name)]`.

### `function egg:animation/-enable`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|Succeeded or not|

**Enable the `egg:animation` feature.**

The block display entity for the target `@s` is enabled as `egg:animation`,
making all features of `function egg:animation/-xxx available`.

### `function egg:animation/-finished`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|Whether playback has finished|

**Checks whether animation playback has finished.**

Checks whether the animation of a target `@s` with a repeat count set to anything other than -1 (infinite loop) has finished playing.

To determine if it is currently playing due to controls like `function egg:animation/-play`, `function egg:animation/-stop`, or `function egg:animation/-pause`,
check whether it has the `egg:animation.playing` tag.

### `function egg:animation/-pause`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|Succeeded or not|

**Pause `egg:animation`.**

Pauses the animation of the target `@s`.

You can resume playback with `function egg:animation/-play`.

### `function egg:animation/-play`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|Succeeded or not|

**Play `egg:animation`.**

Plays the animation for the target `@s`.

### `function egg:animation/-set`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:animation/-set <<.repeat`|in|Repeat count (-1:infinity)|
|`storage egg:animation/-set <<.path`|in|Path of animation data|
|`return`|out|Succeeded or not|

**Set the animation data to `egg:animation`.**

Set the animation data for the target `@s`.

This refers to data generated by BDEngine's animation feature
and converted for egg format using mcbird/bde2egg.js.

The path name is formed by concatenating the model name (project name) set in BDEngine
and the animation data name with a hyphen, resulting in a string like [model name]-[animation data name].

### `function egg:animation/-stop`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|Succeeded or not|

**Stop `egg:animation`.**

Stop the animation of the target `@s`.

## egg:pack

**This module targets NBT data tags with specific data structures.**

It handles `egg:pack` packages configured in the following two ways:

**[Name-based]**

```mcfunction
data modify storage <namespace> <path> set value {name:“xxx:aaa/bbb/ccc”,data:{...}}
data modify entity @s data.<path> set value {name:“xxx:aaa/bbb/ccc”,data:{...}}
```

**[Alias Specification]**

```mcfunction
data modify storage <namespace? <path> set value {namespace:xxx,alias:aaa_bbb_ccc,data:{...}}
data modify entity @s data.<path> set value {namespace:xxx,alias:aaa_bbb_ccc,data:{...}}
```

This assumes the function tag `function #xxx:alias/aaa_bbb_ccc` is defined.

```json
{
  “replace”: true,
  “values”: [“xxx:aaa/bbb/ccc”]
}
```

Name specification is limited to 7 levels.

data:{...} is generic information set to `storage egg:pack/call <<` when called by `function egg:pack/call`.

This enables managing state and procedures as a set within data.

It can be stored anywhere in NBT data tags and executed as follows.

```mcfunction
data modify storage egg:pack/call <<pack set from entity @s data.<path>
function egg:pack/call

data modify storage egg:pack/call <<pack set from storage <namespace>.<path>
function egg:pack/call
```

### `function egg:pack/call`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:pack/call <<pack`|in|`egg.pack` package|
|`return`|out|Succeeded or not|

**Executes the `egg.pack` package.**

Calls a function registered in the `egg:pack` package while storing generic information about `data` in `storage egg:pack/call <<`.

### `function egg:pack/preload`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:pack/preload <<name`|in|Function name|
|`return`|out|Succeeded or not|

**Pre-registers the function name.**

The `egg:pack` package requires significant parsing when aliases aren't specified, often causing heavy initial load.

Pre-registering with this function performs parsing in the background.

## egg:nog

**utilitys for easier handling of egg data packs.**

Since egg data pack specifications are unique, this utility provides a simplified interface for more general handling, along with a collection of handy, miscellaneous, simple functions.

### `function egg:nog/macro/new_animation`

|Parameter|Type|Description|
|:-|:-|:-|
|`with repeat`|in|Number of repeats (-1: infinite loop)|
|`with model`|in|Model name|
|`with anime`|in|Animation name|
|`return`|out|Succeeded or not|

**Generates a model and plays the animation.**

The generated model has the `__uninitialized` tag set, so please use it during initialization.

After initialization completes, the `__uninitialized` tag must be removed.

### `function egg:nog/macro/new_model`

|Parameter|Type|Description|
|:-|:-|:-|
|`with model`|in|model_name|
|`return`|out|Succeeded or not|

**Creates a model.**

The generated model has the `__uninitialized` tag set; use this during initialization.

After initialization completes, you must remove the `__uninitialized` tag.

### `function egg:nog/macro/play_animation`

|Parameter|Type|Description|
|:-|:-|:-|
|`with repeat`|in|Number of repeats (-1: infinite loop)|
|`with model`|in|Model name|
|`with anime`|in|Animation name|
|`return`|out|Succeeded or not|

**Plays an animation.**

Plays the animation for the target `@s` model.

### `function egg:nog/compare_uuid`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:nog/compare_uuid <<this`|in|This entity's UUID|
|`storage egg:nog/compare_uuid <<that`|in|That entity's UUID|
|`return`|out|UUIDs are Equals|

**Compares whether two UUIDs are equal.**

### `function egg:nog/match_uuid`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:nog/match_uuid <<target`|in|Target entity's UUID.|
|`return`|out|UUIDs are matched.|

**Checks UUID whether `@s` matches target.**

### `function egg:nog/origin`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|Whether it has `on origin`|

**Retrieves whether it has `on origin`.**

### `function egg:nog/passengers`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|Number of passengers|

**Returns the number of passengers.**

### `function egg:nog/scale_motion`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:nog/scale_motion <<motion`|in|Motion data|
|`storage egg:nog/scale_motion <<scale`|in|Scale|
|`storage egg:nog/scale_motion >>motion`|out|Scaled Motion data|
|`return`|out|Succeeded function or not|

**Scale Motion.**

Motion data correspond to the Rotation and Motion NBT data tags.

### `function egg:nog/target`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|Whether it has on target|

**Retrieves whether it has on target.**

### `function egg:nog/vehicle`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|Whether it has on vehicle|

**Retrieves whether it has on vehicle.**

### `function egg:nog/ride`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:nog/ride <<uuid`|in|UUID of the entity to mount onto `@s`|
|`return`|out|Success or failure of the operation|

**Mounts the entity specified by `<<uuid` onto `@s`.**
