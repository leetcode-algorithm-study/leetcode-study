class Solution {
    public int lastRemaining(int n) {
        boolean left = true; //left->right / right->left 방향 설정
        int remaining = n; //남은 원소의 개수
        int step = 1; //원소들은 등차수열을 이루며, 현재 원소들간의 차이
        int head = 1; //결과값
        while (remaining > 1) {
            //left -> right인 경우 무조건 첫번째 원소가 지워지기때문에 head를 증가시켜야함
            //right -> left인 경우 남아있는 원소의 개수가 홀수면 맨 왼쪽에 있는 원소가 지워지기 때문에 head를 증가시켜야함
            if (left || remaining % 2 ==1) {
                head = head + step;
            }
            remaining = remaining / 2;
            step = step * 2;
            left = !left;
        }
        return head;
    }

}

/**
 * 시작
 * 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
 * 원소별 차이 1이고, head도 1인 상태
 * 
 * 1회전(left -> right)
 * 결과 : 2 4 6 8 10 12 14 16 18 20 22 24(총 12개)
 * 1부터 맞닿아있지 않은 원소 제거
 * 원소별 차이는 2가되고 1이 없어졌으니 이전 회차의 step만큼 head를 증가시켜서 head는 2가 됨 
 *
 * 2회전(right -> left)
 * 결과 : 2 6 10 14 18 22(총 6개)
 * 24부터 맞닿아있지 않는 원소 제거
 * 이전에 남아있던 원소의 개수가 짝수개이면 head가 없어지지 않지만, 홀수개라면 head가 없어지기때문에 head를 옮겨주어야함
 * 원소별 차이는 4가 되고, 기존 원소의 개수가 12개였기 때문에 head는 그대로 2
 * 
 * 3회전(left -> right)
 * 결과 : 6 14 22(총 3개)
 * 2부터 맞닿아있지 않는 원소 제거
 * 원소별 차이는 8이 되고 2가 없어졌으니 이전회차의 차이(4)만큼 증가시켜 head는 6이 됨
 * 
 * 4회전(right -> left)
 * 결과 : 14(총 1개)
 * 22부터 맞닿아있지 않는 원소 제거,
 * 이전에 남아있던 원소의 개수가 홀수이기때문에 head가 제거됨. 따라서 head를 옮겨주어야함
 * 원소는 1개만 남으며 기존 head는 6이었고, 이전 회차의 원소별 차이인 8을 더해 14를 만들어줌
 */