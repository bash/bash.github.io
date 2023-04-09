+++
title = "Python doctest"
authors = ["Ruben"]
+++

I've recently picked up Python again, and a neat feature that I ran across by chance is
the `doctest` module. \
It tests if the example in your docstrings actually do what you claim! [^1]

Let's say we have this neat `is_leap_year` function with a few examples. \
Note that the examples are all prefixed with `>>> ` (That's from the interactive prompt.)

```python
def _is_leap_year(year: int) -> bool:
    """Determines if a year is a leap year.
    >>> _is_leap_year(2020)
    True
    >>> _is_leap_year(2100)
    False
    >>> _is_leap_year(2000)
    True
    """
    return divides(400, year) or (divides(4, year) and not divides(100, year))

if __name__ == '__main__':
    import doctest
    doctest.testmod()
```

Calling `doctest.testmod` looks at all the examples in this module, runs the code and compares the result.


[^1]: This reminds me of the documentation tests feature in Rust ([`cargo test`](https://doc.rust-lang.org/cargo/commands/cargo-test.html)).
