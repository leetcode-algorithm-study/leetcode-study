class LRUCache {
public:
    LRUCache(int capacity) {
        m_capacity = capacity;
    }
    
    int get(int key) {
        auto iter = m_pool.find( key );
        if( std::end( m_pool ) != iter ) {
            m_priorities.remove( key );
            m_priorities.push_front( key );
            return iter->second;    
        }
        return -1;
    }
    
    void put(int key, int value) {
        m_pool.erase( key );
        if( m_capacity <= m_pool.size() )
        {
            m_pool.erase( m_priorities.back() );
            m_priorities.pop_back();
        }
        m_pool.emplace( key, value );
        m_priorities.remove( key );
        m_priorities.push_front( key );
    }
    
private:
    int m_capacity;
    list<int> m_priorities;
    unordered_map<int, int> m_pool;
};

/**
 * Your LRUCache object will be instantiated and called as such:
 * LRUCache* obj = new LRUCache(capacity);
 * int param_1 = obj->get(key);
 * obj->put(key,value);
 */

// Runtime: 776 ms, faster than 5.07% of C++ online submissions for LRU Cache.
// Memory Usage: 43.1 MB, less than 20.33% of C++ online submissions for LRU Cache.