This project involves the implementation of a solution for a task with limited time for completion, focusing on several key areas.
The core task is:
Find the shortest path from a start point to an end point on a graph with obstacles.
I used BFS algorithm as main core part for solution.

Other tasks are:
1. Model Creation: Implement models with JSON converters.
2. API Service Development: Develop an API service to interact with a specific endpoint that returns test data:
[
    {
        "id": "7d785c38-cd54-4a98-ab57-44e50ae646c1",
        "field": [".X.", ".X.", "..."],
        "start": {"x": 2, "y": 1},
        "end": {"x": 0, "y": 2}
    },
    {
        "id": "88746d24-bf68-4dea-a6b6-4a8fefb47eb9",
        "field": ["XXX.", "X..X", "X..X", ".XXX"],
        "start": {"x": 0, "y": 3},
        "end": {"x": 3, "y": 0}
    }
]
3. Domain Data Conversion: Implement a converter within the domain layer.
4. URL Validation: Implementing URL validation.
5. Presentation: Manage 4 routes:
5.1 HomeScreen - Data fetching and validation.
5.2 ProcessScreen - Data processing.
5.3 ResultsScreen - Display the shortest paths for each graph.
5.4 PreviewScreen - Display the graph with special color highlights:
Start Point: #64FFDA
Shortest Path: #4CAF50
End Point: #009688
Obstacles: #000000
Empty Node: #FFFFFF

<h3>Home Screen</h3>
<img src="https://github.com/user-attachments/assets/f316e778-9568-4a02-a045-139e8b010681" alt="Simulator Screenshot" width="294.75px" height="639px">
<img src="https://github.com/user-attachments/assets/c4432020-37bc-41c5-9225-e2222b7a382e" alt="Simulator Screenshot" width="294.75px" height="639px">

<h3>Process Screen</h3>
<img src="https://github.com/user-attachments/assets/e85b46e9-6ee0-4715-acb1-c101a973b277" alt="Simulator Screenshot" width="294.75px" height="639px">
<img src="https://github.com/user-attachments/assets/18b2e77c-700b-406e-810f-7d65c7a3a017" alt="Simulator Screenshot" width="294.75px" height="639px">

<h3>Results Screen</h3>
<img src="https://github.com/user-attachments/assets/3034242b-ec29-4dd4-b561-42ec24c18fc1" alt="Simulator Screenshot" width="294.75px" height="639px">

<h3>Preview Screen</h3>
<img src="https://github.com/user-attachments/assets/a76de797-4e95-4796-9f24-25d13128d177" alt="Simulator Screenshot" width="294.75px" height="639px">
<img src="https://github.com/user-attachments/assets/0246b8e2-0b62-40cf-86fa-66902b654ae5" alt="Simulator Screenshot" width="294.75px" height="639px">
