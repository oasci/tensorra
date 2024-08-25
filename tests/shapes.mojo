import tensorra as ts

from testing import assert_equal

def test_shape_init():
    var shape = ts.NDArrayShape(1, 1, 1)
    assert_equal(shape.__str__(), "(1, 1, 1)")

def main():
    test_shape_init()
