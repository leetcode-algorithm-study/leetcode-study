use std::collections::HashSet;

pub fn find_redundant_connection(edges: Vec<Vec<i32>>) -> Vec<i32> {
    let mut graph: Vec<Vec<i32>> = vec![Vec::new(); edges.len() + 1];
    let mut res = vec![0; 2];

    for (i, pair) in edges.iter().enumerate() { // [[1,2],[2,3],[3,4],[1,4],[1,5]]
        println!();
        println!("edges: {:?}", edges[i]);

        let mut visited = HashSet::new();
        if is_connect(&graph, &mut visited, pair[0], pair[1]) == true {
            res = pair.clone();
            println!("extra edge: {:?}", res);
        }

        graph[pair[0] as usize].push( pair[1]);
        graph[pair[1] as usize].push( pair[0]);
        println!("graph: {:?}", graph);
    }

    return res;
}

fn is_connect(graph: &Vec<Vec<i32>>, mut visited: &mut HashSet<i32>, src: i32, dst: i32 ) -> bool {
    if visited.contains( &src) == false {
        visited.insert(src);
        println!("visited: {}", src);

        if src == dst {
            return true;
        }

        for connected_node in graph[src as usize].iter() {
            if is_connect(&graph, &mut visited, *connected_node, dst) == true {
                return true;
            }
        }
    }

    return false;
}