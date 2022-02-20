impl Solution {
    pub fn all_paths_source_target(graph: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
        let mut result: Vec<Vec<i32>> = vec![];
        let mut path: Vec<i32> = vec![];
        Self::dfs(&graph, &mut path, &mut result, 0);

        result
    }

    fn dfs(graph: &Vec<Vec<i32>>, path: &mut Vec<i32>, result: &mut Vec<Vec<i32>>, node_number: usize) {
        path.push(node_number as i32);

        if node_number == graph.len() -1 {
            result.push(path.to_vec());
        } else {
            for &i in graph[node_number].iter() {  //0..graph[node_number].len()
                Self::dfs(graph, path, result, i as usize);
            }
        }

        path.pop(); //avoiding duplicated path
    }
}