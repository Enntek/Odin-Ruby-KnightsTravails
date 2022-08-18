// C++ program to find the shortest path between two vertexes

#include<bits/stdc++.h>

using namespace std;

// Function to finding minimum number of edges

int shortest_path(vector <int> edges[], int u, int v, int n)

{

// Keep track of visited nodes

vector<bool> visited(n, 0);

// Initialize initial distances as 0 for all nodes

vector<int> distance(n, 0);

queue <int> queue1;

distance[u] = 0;

queue1.push(u);

visited[u] = true;

while (!queue1.empty())

{

int x = queue1.front();

queue1.pop();

for (int i=0; i<edges[x].size(); i++)

{

if (visited[edges[x][i]])

continue;

// Update the distances

distance[edges[x][i]] = distance[x] + 1;

queue1.push(edges[x][i]);

visited[edges[x][i]] = 1;

}

}

return distance[v];

}

// Function to add the given edges of the graph

void add_edge_graph(vector <int> edges[], int u, int v)

{

edges[u].push_back(v);

edges[v].push_back(u);

}

int main() 

{

char ch;

int n = 9;

vector <int> edges[9];

int a, b;

cout << “nEnter the connections of the graph n”;

do

{

cin >> a >> b;

cin >> ch;

add_edge_graph(edges, a, b);

}while(ch == ‘y’ || ch == ‘Y’);

add_edge_graph(edges, 0, 1);

int u = 0;

int v = 5;

cout << “nMinimum number of edges : ” << shortest_path(edges, u, v, n) << endl;

return 0;

}

