+++
title = "Python's int(x) Rounds Towards Zero"
+++

I was surprised to learn that Python's [`int`] function rounds floats towards zero. \
Here's the relevant excerpt from the [official docs][`int`]:
> […] For floating point numbers, this truncates towards zero.

{% figure(caption="Example") %}
```python
from math import floor
assert(int(-0.8) == 0)
assert(floor(-0.8) == -1)
```
{% end %}

If you want the floored result, you need to use [`math.floor`].

[`int`]: https://docs.python.org/3/library/functions.html#int
[`math.floor`]: https://docs.python.org/3/library/math.html#math.floor
