# ===----------------------------------------------------------------------=== #
# Copyright (c) 2024, OASCI. All rights reserved.
#
# Licensed under the Apache License v2.0:
# https://opensource.org/license/apache-2-0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ===----------------------------------------------------------------------=== #


struct NDArrayShape:
    """
    Encapsulates the shape information of an n-dimensional array (NDArray).

    This struct manages the dimensional properties of an NDArray, providing
    methods for initialization, access, and representation of the array's shape.

    Attributes:
        shape (List[Int]): Stores the size of each dimension of the NDArray.
        ndim (Int): Represents the number of dimensions in the NDArray.
        size (Int): Stores the total number of elements in the NDArray.

    Example:
        var shape3d = NDArrayShape(3, 4, 5)
        print(shape3d)  # Output: (3, 4, 5)
        print(shape3d.ndim)  # Output: 3
        print(shape3d.size)  # Output: 60
    """

    var shape: List[Int]
    """
    List storing the size of each dimension of the NDArray.
    
    For a 3x4x5 array, shape would be [3, 4, 5].
    """

    var ndim: Int
    """
    Total number of dimensions in the NDArray.
    
    For a 3x4x5 array, ndim would be 3.
    """

    var size: Int
    """
    Total number of elements in the NDArray.
    
    Calculated as the product of all dimension sizes.
    For a 3x4x5 array, size would be 3 * 4 * 5 = 60.
    """

    fn __init__(inout self, *shape: Int):
        """
        Initialize a new NDArrayShape instance.

        Args:
            *shape: Variable number of integers representing the size of each dimension.

        This constructor initializes the shape, calculates the number of dimensions (ndim),
        and computes the total number of elements (size).

        Example:
            var shape = NDArrayShape(3, 4, 5)  # Creates a 3D shape of 3x4x5
        """
        self.size = 1
        self.ndim = len(shape)
        self.shape = List[Int]()
        for i in range(self.ndim):
            self.shape[i] = shape[i]
            self.size *= shape[i]

    fn __getitem__(self, index: Int) -> Int:
        """
        Get the size of a specific dimension.

        Args:
            index: The dimension index to retrieve.

        Returns:
            The size of the dimension at the given index.

        This method allows indexing into the shape to get the size of a specific dimension.

        Example:
            var shape = NDArrayShape(3, 4, 5)
            print(shape[1])  # Output: 4
        """
        return self.shape[index]

    fn __len__(self) -> Int:
        """
        Get the number of dimensions.

        Returns:
            The number of dimensions (ndim).

        This method allows using the len() function on the NDArrayShape object.

        Example:
            var shape = NDArrayShape(3, 4, 5)
            print(len(shape))  # Output: 3
        """
        return self.ndim

    fn __str__(self) -> String:
        """
        Get a string representation of the shape.

        Returns:
            A string in the format "(dim1, dim2, ..., dimN)".

        This method provides a human-readable representation of the shape.

        Example:
            var shape = NDArrayShape(3, 4, 5)
            print(shape)  # Output: (3, 4, 5)
        """
        var result: String = "("
        for i in range(self.ndim):
            if i > 0:
                result += ", "
            result += str(self[i])
        result += ")"
        return result