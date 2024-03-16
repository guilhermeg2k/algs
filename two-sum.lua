-- Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
--
-- You may assume that each input would have exactly one solution, and you may not use the same element twice.
--
-- You can return the answer in any order.
--
--
--
-- Example 1:
--
-- Input: nums = [2,7,11,15], target = 9
-- Output: [0,1]
-- Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
-- Example 2:
--
-- Input: nums = [3,2,4], target = 6
-- Output: [1,2]
-- Example 3:
--
-- Input: nums = [3,3], target = 6
-- Output: [0,1]
--
--
function two_sum(arr, target)
  local p1 = 1
  local p2 = #arr

  for _ = 1, #arr do
    local sum = arr[p1] + arr[p2]

    if (sum == target) then
      return { arr[p1], arr[p2] }
    end

    if (sum > target) then
      p2 = p2 - 1
    else
      p1 = p1 + 1
    end
  end
end

function test()
  local arr = { 1, 10, 30, 32, 33, 54, 55, 90, 100, 110, 140, 1000 }

  local tests = {
    {
      target = 110,
      expected = { 10, 100 }
    }, {
    target = 122,
    expected = { 32, 90 }
  }, {
    target = 109,
    expected = { 54, 55 }
  }
  };

  for _, v in pairs(tests) do
    local res = two_sum(arr, v.target)
    assert(res[1] == v.expected[1])
    assert(res[2] == v.expected[2])
  end

  print('All tests passed')
end

test()
