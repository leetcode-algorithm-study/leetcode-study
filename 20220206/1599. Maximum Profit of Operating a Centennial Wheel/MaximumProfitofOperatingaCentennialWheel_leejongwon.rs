impl Solution {
    pub fn min_operations_max_profit(customers: Vec<i32>, boarding_cost: i32, running_cost: i32) -> i32 {
        //네개 곤돌라, 4명까지
        //반시계방향
        let mut run = 0;
        let mut max_run = 0;
        let mut profit = 0;
        let mut max_profit = 0;
        let mut remains = customers.iter().sum();
        
        //required
        let mut cursor = 0;
        
        while remains > 0 {
            let board = if remains > 4 { 4 } else { remains };
            profit += (board * boarding_cost) - running_cost;
            
            remains -= board;
            run += 1;
            
            if profit > max_profit {
                max_profit = profit;
                max_run = run;
            }
        }
        
        if max_profit > 0 {
            max_run
        } else {
            -1
        }
    }
}