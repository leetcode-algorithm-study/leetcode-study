//
//  Number of Provinces.c
//  Leetcode_c
//
//  Created by ELLIE on 2021/09/19.
//

#include <stdio.h>

void dfs(int** isConnected, int size, int index, bool* visited) {
    visited[index] = true;
    
    for (int i = 0; i < size; ++i) {
        if (isConnected[index][i] && !visited[i]) {
            dfs(isConnected, size, i, visited);
        }
    }
}
    
int findCircleNum(int** isConnected, int isConnectedSize, int* isConnectedColSize){
    int answer = 0;
    
    bool* visited = (bool*)calloc(isConnectedSize, sizeof(bool));
    
    for (int i = 0; i < isConnectedSize; i++) {
        if (!visited[i]) {
            answer = answer + 1;
            dfs(isConnected, isConnectedSize, i, visited);
        }
    }
    
    return answer;
}
