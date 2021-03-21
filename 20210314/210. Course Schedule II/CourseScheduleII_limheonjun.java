/**
 * Runtime: 5 ms
 * Memory Usage: 39.7 MB
 */
class Solution {
    public int[] findOrder(int numCourses, int[][] prerequisites) {
        List<List<Integer>> courses = new ArrayList<>();
        List<Integer> result = new ArrayList<>();
        int precedeCount[] = new int[numCourses];

        for(int i=0; i<numCourses; i++) {
            courses.add(new ArrayList<Integer>());
        }

        int len = prerequisites.length;

        for(int i=0; i<len; i++) {
            int first = prerequisites[i][1];
            int second = prerequisites[i][0];

            courses.get(first).add(second);
            precedeCount[second]++;
        }

        Queue<Integer> q = new LinkedList<>();

        for(int i=0; i<numCourses; i++) {
            if(precedeCount[i] == 0) q.add(i);
        }

        for(int i=0; i<numCourses; i++) {
            if(q.isEmpty()) return new int[] {};
            int course = q.poll();
            result.add(course);

            for(int nextCourse : courses.get(course)) {
                precedeCount[nextCourse]--;

                if(precedeCount[nextCourse] == 0) {
                    q.add(nextCourse);
                }
            }
        }

        return result.stream().mapToInt(Integer::intValue).toArray();
    }
}