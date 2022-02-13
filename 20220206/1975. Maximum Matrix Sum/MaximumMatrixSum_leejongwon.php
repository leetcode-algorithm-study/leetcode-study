class Solution {

/**
* @param Integer[][] $matrix
* @return Integer
*/
function maxMatrixSum($matrix) {
//인접. +1,-1,+col,-col && >=0.  근데 -는 중복이므로 skip 가능
//위 두개를 쭉 돌렸을때 합이 가장 작은게 답.
//원본에서 sum 한 후에, 위에 *2 절대값 더해주면 답.

//sliding window 같네.
//(i,j), (i,J+1) / (i,j), (i+1,j) 두 필터를 쭉 돌리면 됨.
//flatten 시키고, 인덱스들 적절히 처리
$result = 0;
$min = pow(10, 5);
$negativeCount = 0;

$n = count($matrix);

for($i=0; $i<$n; $i++){
for($j=0; $j<$n; $j++){
if($matrix[$i][$j]<0){
$negativeCount++;
}
if ($min > abs($matrix[$i][$j]))
{
$min = abs($matrix[$i][$j]);
}
$result += abs($matrix[$i][$j]);
}

}

if($negativeCount % 2 != 0){
return $result - ($min * 2);
}

return $result;
}
}