# FlashX #
  * Core - 10%
  * Math - 40%
  * Graphics - 15%
  * Network - 0%
  * Input - 5%
  * Content - 5%
  * GUI - 0%


FlashX is an advanced API for Adobe Flash written in ActionScript (currently AS3).

Unlike other Flash graphics libraries, FlashX is easy to use, and easy to improve. FlashX's structure is well thought out to be powerful, scalable, extensible, and compact, while maintaining readability. FlashX provides a lot of shortcuts and shorthand. FlashX tries not to rely on certain parts of the standard Flash API. The standard API vectors, matrices, keys, transformations, colors, etc. are all limited and drawing API rectangles, triangles, circles, lines, curves, etc. are all quite slow. Due to this, FlashX structure and syntax does not conform to the same conventions as most ActionScript code. This has the advantage of easily porting FlashX applications to new versions of ActionScript, as well as being similar to most OpenGL/DirectX graphics libraries. FlashX is grouped according to the Flash Player version, not the ActionScript version. Many features are only available and/or change based on the player version, not the language version. The player version automatically implies the language version since that itself is a feature.

FlashX is designed similar to XNA, DirectX, OpenGL, and OGRE. The syntax, concepts, and terminology are minor, making FlashX very easy to learn.

Created by Eric Muyser.

---



---

## Changelog ##
  * 08.11.11 - Perspective math accuracy fixed (cube tested). Started adding events.
  * 08.11.10 - Improvements to matrices. Started keyboard input. Fixing drawing perspective.
  * 08.11.09 - Improvements to vectors. Working on drawing. Added custom errors.
  * 08.11.07 - Finished base structure.

---

## Todo ##
  * Drop lost frames to improve input responsiveness. Add to statistics.
  * Fix up quaternions.
  * Add lighting, shading, blending.
  * Add physics, collision detection, particle system, animations.
  * Improve primitive drawing.
  * Add mouse input.
  * Add event callbacks.
  * Add raycasting/hittest, targeting/focus and camera switching functionality.
  * Improve viewport to allow multiple instances.
  * Track polygon mouse is over, and it's belonging model. On right (or left temporarily) mouse down, rotate camera. On left mouse up, select model, activate model (allow specific input - movement - camera switching).
  * BitmapData for each model, render to bitmapdata on change, cache on non change, remove cache on change.
  * Statistics for focused model (such as updates/sec).

---

## Features ##
  * Automatically adjust optimization based on idle time and focus.
  * Automatically adjust quality based on frames per second.
  * Statistics for frames per second, memory consumed, time to update (ms), time to draw (ms).
  * Events for all major procedures (eg. update and draw).
  * Methods for all major vector (2 and 3), matrix (3x3 and 4x4), and quaternion calculations.
  * Static helper classes MathHelper, VectorHelper, MatrixHelper, and QuaternionHelper. Optimized to use object methods.
  * Heavy use of interfaces for sub-classing (eg. IVector -> Vector2 or Vector3, IMatrix -> Matrix3 or Matrix4).


---


## FlashX Team ##

**Lead Developer:** Eric Muyser

**Lead Programmer:** _Open_

**Lead Designer:** _Open_

**Developer:** _Open_

**Programmer:** _Open_

**Designer:** _Open_