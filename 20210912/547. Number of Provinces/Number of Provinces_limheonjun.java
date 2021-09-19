class Solution {
    public int findCircleNum(int[][] isConnected) {
		int length = isConnected.length;
		int parent[] = new int[length];
		int count = length;

		for(int i = 0; i < length; i++){
			parent[i] = i;
		}

		for(int i = 0; i < length; i++){
			for(int j = 0; j < length; j++){
				if(isConnected[i][j] == 1 && i != j){
					int iParent = find(parent, i);
					int jParent = find(parent, j);
					if(iParent != jParent){
						parent[jParent] = iParent;
						count--;
					}
				}
			}
		}

		return count;
	}

	private int find(int parent[], int node){
		while(node != parent[node]){
			node = parent[node];
		}
		return node;
	}
}