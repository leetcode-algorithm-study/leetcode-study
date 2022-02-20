#[derive(PartialEq, Clone, Debug)]
enum Marking {
      NONE,
      RED,
      BLACK
}

fn dfs(graph: &Vec<Vec<i32>>, sequence: i32, marking: Marking, marker: &mut Vec<Marking>) -> bool {
        //check node
        if marker[sequence as usize] == Marking::NONE { //first visited
            marker[sequence as usize] = marking.clone();
        } else if marker[sequence as usize] != marking { //have visited
            return false;
        }

        //check node's edges
        for &edge in graph[sequence as usize].iter() {
            if marker[edge as usize] == Marking::NONE {
                let next_marking = match marking {
                    Marking::RED => Marking::BLACK,
                    Marking::BLACK => Marking::RED,
                    _ => Marking::NONE
                };

                if dfs(graph, edge, next_marking, marker) == false {
                    return false;
                }
            } else if marker[edge as usize] == marker[sequence as usize] {
                return false;
            }
        }

        true
}

impl Solution {

    fn is_bipartite(graph: Vec<Vec<i32>>) -> bool {
         if graph.is_empty() {
            return true;
        }

        let mut marker: Vec<Marking> = vec![Marking::NONE; graph.len()];

        for sequence in 0..graph.len() {
            if marker[sequence] == Marking::NONE {
                if dfs(&graph, sequence as i32, Marking::RED, &mut marker) == false {
                    return false;
                }
            }
        }

        true
    }
}