//https://leetcode.com/problems/course-schedule/description/

class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        
        var adjList = Array(repeating: [Int](), count: numCourses)
        var arrival = Array(repeating: false, count: numCourses)
        var departure = Array(repeating: false, count: numCourses)

        for edge in prerequisites {
            let src = edge[0]
            let dest = edge[1]
            adjList[dest].append(src)
        }

        func isCycle(_ src: Int) -> Bool {
            arrival[src] = true
            let neighbours = adjList[src]

            for nbr in neighbours {
                if arrival[nbr] == true && departure[nbr] == false {
                    return true
                }
                if arrival[nbr] == false && isCycle(nbr) == true {
                    return true
                }
            }
            departure[src] = true
            return false
        }

        for i in 0..<numCourses {
            if arrival[i] == false {
                if isCycle(i) {
                    return false
                }
            }
        }
        return true
    }
}
