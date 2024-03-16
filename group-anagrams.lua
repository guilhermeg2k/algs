-- https://leetcode.com/problems/group-anagrams/description/
--
-- Given an array of strings strs, group the anagrams together. You can return the answer in any order.
--
-- An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
--
-- Example 1:
--
-- Input: strs = ["eat","tea","tan","ate","nat","bat"]
-- Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
-- Example 2:
--
-- Input: strs = [""]
-- Output: [[""]]
-- Example 3:
--
-- Input: strs = ["a"]
-- Output: [["a"]]
--
local pprint = require('pprint')

function sortString(str)
  local chars = string.sub(str, 1, string.len(str))
  local charTable = {}

  for i = 1, #chars do
    charTable[#charTable + 1] = string.sub(chars, i, i)
  end

  table.sort(charTable)
  return table.concat(charTable)
end

function groupAnagram(strs)
  local map = {}
  local res = {}

  for _, str in pairs(strs) do
    local strSortted = sortString(str)

    if map[strSortted] == nil then
      map[strSortted] = { str }
      goto continue
    end

    table.insert(map[strSortted], str)

    ::continue::
  end

  for _, groups in pairs(map) do
    table.insert(res, groups)
  end

  return res
end

function test()
  local tests = {
    {
      strs = { "eat", "tea", "tan", "ate", "nat", "bat" },
      expected = { { 'tan', 'nat' }, { 'bat' }, { 'eat', 'tea', 'ate' } }
    },
    {
      strs = { "a" },
      expected = { { "a" } }
    },
    {
      strs = { "" },
      expected = { { '' } }
    },
  };


  for i, currTest in pairs(tests) do
    print("Test " .. i)
    local res = groupAnagram(currTest.strs)
    print('Result')
    pprint(res)
    print('Expected')
    pprint(currTest.expected)
    print()
  end
end

test()
