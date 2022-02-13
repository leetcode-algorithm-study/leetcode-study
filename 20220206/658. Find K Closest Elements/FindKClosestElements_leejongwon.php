class Solution {

/**
* @param Integer[] $arr
* @param Integer $k
* @param Integer $x
* @return Integer[]
*/
function findClosestElements($arr, $k, $x) {
//given
// $arr = [1,2,3,4,5];
// $k = 4;
// $x = 3;

//when
$arr2 = array_map(function ($k, $v) use ($x) {
return abs($v - $x); //distance
}, array_keys($arr), array_values($arr));
asort($arr2);

//then
$result = [];
$arr3 = array_keys(array_slice($arr2, 0, $k, true));
foreach ($arr3 as $key)
{
$result[] = $arr[$key];
}

sort($result);
return $result;
}
}