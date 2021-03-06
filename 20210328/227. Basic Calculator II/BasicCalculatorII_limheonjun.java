class Solution {
    public int calculate(String s) {
        s = s.replaceAll(" ", "");
        if(s == null || s.isEmpty()) return 0;

        Stack<Character> stack = new Stack<>();
        int result = 0;
        int temp = 0;
        int first = 0;
        int second = 0;

        int len = s.length();
        boolean isContinuous = false;

        StringBuffer sb = new StringBuffer();

        for(int i=0; i<len; i++) {
            if('0' <= s.charAt(i) && s.charAt(i) <= '9') {
                stack.push(s.charAt(i));
            } else if(s.charAt(i) == '*' || s.charAt(i) == '/') {

                if(isContinuous) {
                    first = temp;
                    temp = 0;
                } else {
                    first = numFromStack(stack);
                }

                int j = i+1;
                while(j < len && ('0' <= s.charAt(j) && s.charAt(j) <= '9')) {
                    sb.append(s.charAt(j++));
                }

                second = Integer.parseInt(sb.toString());
                sb.delete(0, sb.length());

                if(s.charAt(i) == '*') temp += first * second;
                else temp += first / second;

                i = j-1;
                isContinuous = true;
            } else {
                stack.push(s.charAt(i));
                isContinuous = false;
                result += temp;
                temp = 0;
            }
        }

        result += temp;

        while(!stack.isEmpty()) {
            result += numFromStack(stack);
        }

        return result;

    }

    private int numFromStack(Stack<Character> stack) {
        StringBuffer sb = new StringBuffer();
        int num = 0;

        while(!stack.isEmpty() && ('0' <= stack.peek() && stack.peek() <= '9')) {
            sb.append(stack.pop());
        }

        String str = sb.reverse().toString();
        if(str.length() != 0) num = Integer.parseInt(str);

        if(!stack.isEmpty() && stack.peek() == '-') {
            num = -num;
            stack.pop();
            if(!stack.isEmpty()) stack.push('+');
        }

        if(!stack.isEmpty() && stack.peek() == '+') {
            stack.pop();
        }

        return num;
    }
}