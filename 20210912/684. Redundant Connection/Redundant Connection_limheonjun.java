class Solution {
    public int[] findRedundantConnection(int[][] edges) {
        int length = edges.length;
        int parent[] = new int[length];
        int result[] = new int[2];

        for (int i = 0; i < length; i++) {
            parent[i] = i;
        }

        for (int i = 0; i < length; i++) {
            int iParent = find(parent, edges[i][0]-1);
            int jParent = find(parent, edges[i][1]-1);
            if (iParent != jParent) {
                parent[Math.max(iParent, jParent)] = Math.min(iParent, jParent);
            } else {
                result = edges[i];
            }
        }

        return result;
    }

    private int find(int parent[], int node) {
        while (node != parent[node]) {
            node = parent[node];
        }
        return node;
    }
}