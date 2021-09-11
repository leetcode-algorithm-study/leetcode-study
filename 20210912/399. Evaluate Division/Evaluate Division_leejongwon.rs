use std::collections::{HashMap, HashSet};

type Graph = HashMap<String, HashMap<String, f64>>;

pub fn calc_equation(equations: Vec<Vec<String>>, values: Vec<f64>, queries: Vec<Vec<String>>) -> Vec<f64> {
    let graph = make_graph(equations, values);
    println!("built graph: {:?}", graph);
    println!();

    queries
        .into_iter()
        .map(|query| {
            println!("query: {:?}", query);
            traverse(
                &graph,
                &mut HashSet::new(),
                query,
                None
            ).map_or(-1.0, |v| v)
        }).collect()
}

fn make_graph(equations: Vec<Vec<String>>, values: Vec<f64>) -> Graph { // [["a","b"],["b","c"]] / [2.0, 3.0]
    equations.into_iter() // [["a","b"],["b","c"]]
        .zip(values.into_iter()) // [["a","b"] => 2.0, ["b","c"] => 3.0]
        .fold(HashMap::new(), |mut acc, (eq, val)| { // (["a", "b"], 2.0)
            let entry = acc.entry(eq[0].clone()).or_default();
            entry.insert(eq[1].clone(), val); // entry["a"]["b"] = 2.0

            // for (key, value) in entry {
            //     println!("{}: {}", key, value);
            // }

            let entry = acc.entry(eq[1].clone()).or_default();
            entry.insert(eq[0].clone(), 1.0 / val); // entry["b"]["a"] = 0.5

            // for (key, value) in entry {
            //     println!("{}: {}", key, value);
            // }

            acc
        }) //{"a": {"b": 2.0}, "b": {"c": 3.0, "a": 0.5}, "c": {"b": 0.3333333333333333}}
}

fn traverse(
    graph: &Graph,
    visited: &mut HashSet<String>,
    query: Vec<String>,
    acc: Option<f64>,
) -> Option<f64> {
    visited.insert(query[0].clone());
    println!("visited: {:?}", visited);

    let entry = graph.get(&query[0])?;

    if query[0] == query[1] {
        return Some(1.0);
    }

    if let Some(last_weight) = entry.get(&query[1]) {
        println!("find destination: {}", last_weight);
        return match acc {
            Some(acc_val) => Some(acc_val * (*last_weight)),
            None => Some(*last_weight)
        }
    };

    for path in entry.keys() {
        println!("path: {}", path);
        if visited.contains(path) == false {
            if let Some(weight) = entry.get(path) {
                println!("edge weight: {}", weight);
                let result = traverse(
                    graph,
                    visited,
                    vec![path.clone(), query[1].clone()],
                    match acc {
                        Some(acc_val) => Some(acc_val * (*weight)),
                        None => Some(*weight)
                    }
                );
                if result.is_some() {
                    println!("traversed answer: {:?}", result);
                    return result;
                }
            }
        }
    }

    None
}