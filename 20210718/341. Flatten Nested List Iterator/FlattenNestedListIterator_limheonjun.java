/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * public interface NestedInteger {
 *
 *     // @return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public boolean isInteger();
 *
 *     // @return the single integer that this NestedInteger holds, if it holds a single integer
 *     // Return null if this NestedInteger holds a nested list
 *     public Integer getInteger();
 *
 *     // @return the nested list that this NestedInteger holds, if it holds a nested list
 *     // Return empty list if this NestedInteger holds a single integer
 *     public List<NestedInteger> getList();
 * }
 */

/**
 * Runtime: 2 ms, faster than 97.89% of Java online submissions for Flatten Nested List Iterator.
 * Memory Usage: 41.6 MB, less than 33.53% of Java online submissions for Flatten Nested List Iterator.
 */

public class NestedIterator implements Iterator<Integer> {

    private List<Integer> flattenList = new ArrayList<>();
    private int position;

    public NestedIterator(List<NestedInteger> nestedList) {
        for(NestedInteger nestedInteger : nestedList){
            flattenList(nestedInteger);
        }
    }

    @Override
    public Integer next() {
        return flattenList.get(position++);
    }

    @Override
    public boolean hasNext() {
        return position < flattenList.size();
    }

    private void flattenList(NestedInteger nestedInteger) {
        if(nestedInteger.isInteger()){
            flattenList.add(nestedInteger.getInteger());
            return;
        }

        for(NestedInteger nestedInteger1 : nestedInteger.getList()){
            flattenList(nestedInteger1);
        }
    }
}

/**
 * Your NestedIterator object will be instantiated and called as such:
 * NestedIterator i = new NestedIterator(nestedList);
 * while (i.hasNext()) v[f()] = i.next();
 */