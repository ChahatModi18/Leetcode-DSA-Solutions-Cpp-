class Solution {
public:

    // DFS (Depth First Search)
    // Flood Fill Algorithm
    // Used to visit all connected land cells ('1') of one island.
    void dfs(vector<vector<char>> &grid, int r, int c)
    {
        // Stop if row goes above the first row
        if (r < 0 ||

            // Stop if column goes before the first column
            c < 0 ||

            // Stop if row goes beyond the last row
            r >= grid.size() ||

            // Stop if column goes beyond the last column
            c >= grid[0].size() ||

            // Stop if current cell is water ('0')
            // or already visited (visited land is also marked as '0')
            grid[r][c] == '0')
        {
            return;
        }

        // Mark the current land cell as visited
        // by converting it into water.
        grid[r][c] = '0';

        // Explore the cell above (UP)
        dfs(grid, r - 1, c);

        // Explore the cell below (DOWN)
        dfs(grid, r + 1, c);

        // Explore the cell on the left (LEFT)
        dfs(grid, r, c - 1);

        // Explore the cell on the right (RIGHT)
        dfs(grid, r, c + 1);
    }

    int numIslands(vector<vector<char>>& grid)
    {
        int ans = 0;   // Stores the number of islands

        // Traverse every cell of the grid
        for (int r = 0; r < grid.size(); r++)
        {
            for (int c = 0; c < grid[0].size(); c++)
            {
                // If a land cell is found,
                // it means we have discovered a new island.
                if (grid[r][c] == '1')
                {
                    ans++;              // Count this island

                    // Visit and mark the entire connected island
                    dfs(grid, r, c);
                }
            }
        }

        // Return the total number of islands
        return ans;
    }
};