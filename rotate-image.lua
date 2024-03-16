-- https://leetcode.com/problems/rotate-image/description/
--
-- You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).
-- You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.
--
-- Example 1:
--
-- Input:
--
-- [
-- [1,2,3],
-- [4,5,6],
-- [7,8,9]
-- ]
--
-- Output:
-- [
-- [7,4,1],
-- [8,5,2],
-- [9,6,3]
-- ]
--
-- Example 2:
--
-- Input: matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
-- Output: [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]
--

local pprint = require('pprint')

function rotate_image(matrix)
  local l, r = 1, #matrix

  for i = 1, #matrix do
    pprint(matrix[i])
  end
  print()

  while l < r do
    for i = 0, r - l - 1 do
      local top, bottom = l, r
      local topLeft = matrix[top][l + i]

      matrix[top][l + i] = matrix[bottom - i][l]
      matrix[bottom - i][l] = matrix[bottom][r - i]
      matrix[bottom][r - i] = matrix[top + i][r]
      matrix[top + i][r] = topLeft

      for j = 1, #matrix do
        pprint(matrix[j])
      end

      print("")
    end
    print("")

    l = l + 1
    r = r - 1
  end
end

function test()
  local tests = {
    {
      matrix = { { 1, 2, 3 }, { 4, 5, 6 }, { 7, 8, 9 } },
      expected = {
        { 7, 4, 1 },
        { 8, 5, 2 },
        { 9, 6, 3 },
      }
    },
    {
      matrix = { { 5, 1, 9, 11 }, { 2, 4, 8, 10 }, { 13, 3, 6, 7 }, { 15, 14, 12, 16 } },
      expected = {
        { 15, 13, 2,  5 },
        { 14, 3,  4,  1 },
        { 12, 6,  8,  9 },
        { 16, 7,  10, 11 },
      }
    }
  }

  for _, test in pairs(tests) do
    rotate_image(test.matrix)
    for i, _ in pairs(test.expected) do
      for j, _ in pairs(test.expected[i]) do
        local res_v = test.matrix[i] ~= nil and test.matrix[i][j] or nil
        if (test.expected[i][j] ~= res_v) then
          print('Expected:')
          pprint(test.expected[i]);
          print('Got:')
          pprint(test.matrix[i]);
        end
        assert(test.expected[i][j] == res_v)
      end
    end
  end

  print('All tests passed')
end

test()
