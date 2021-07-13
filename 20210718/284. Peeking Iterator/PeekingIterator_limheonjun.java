// Java Iterator interface reference:
// https://docs.oracle.com/javase/8/docs/api/java/util/Iterator.html

/**
 * Runtime: 4 ms, faster than 96.45% of Java online submissions for Peeking Iterator.
 * Memory Usage: 39.2 MB, less than 39.09% of Java online submissions for Peeking Iterator.
 */

class PeekingIterator implements Iterator<Integer> {
    private List<Integer> list = new ArrayList<>();
    private int position;

    public PeekingIterator(Iterator<Integer> iterator) {
        iterator.forEachRemaining(list::add);
    }

    public Integer peek() {
        return list.get(position);
    }

    @Override
    public Integer next() {
        return list.get(position++);
    }

    @Override
    public boolean hasNext() {
        return position < list.size() ? true : false;
    }
}