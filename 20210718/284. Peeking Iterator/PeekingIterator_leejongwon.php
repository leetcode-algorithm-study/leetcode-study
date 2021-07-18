// PHP ArrayIterator reference:
// https://www.php.net/arrayiterator

class PeekingIterator {

    private $arr;
    private $pointer;

    /**
     * @param ArrayIterator $arr
     */
    function __construct($arr) {
        $this->arr = $arr;
        $this->pointer = 0;
    }

    /**
     * @return Integer
     */
    function next() {
        return $this->arr[$this->pointer++];
    }

    /**
     * @return Integer
     */
    function peek() {
        return $this->arr[$this->pointer];
    }

    /**
     * @return Boolean
     */
    function hasNext() {
        return isset($this->arr[$this->pointer]) === true;
    }
}

/**
 * Your PeekingIterator object will be instantiated and called as such:
 * $obj = PeekingIterator($arr);
 * $ret_1 = $obj->next();
 * $ret_2 = $obj->peek();
 * $ret_3 = $obj->hasNext();
 */