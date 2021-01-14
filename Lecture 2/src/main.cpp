#include <iostream>
#include <utility>
#include <math.h>

// solves the quadratic equation using a, b, and c
// returns true if a solution is found, false otherwise
std::pair<bool, std::pair<double, double>> quadratic(int a, int b, int c) {
    int discriminant = b*b - 4 * a * c;
    if (discriminant >= 0) {
        double root_1 = (-b + sqrt(discriminant)) / (2 * a);
        double root_2 = (-b - sqrt(discriminant)) / (2 * a);
        return std::make_pair(true, std::make_pair(root_1, root_2));
    } else {
        return std::make_pair(false, std::make_pair(0, 0));
    }
}

int main() {
    // NOTE: This function can be improved by utilizing structured binding
    int a, b, c;
    std::cout << "Enter in a, b, and c" << std::endl;
    std::cin >> a >> b >> c;   // this gets input
    std::pair<bool, std::pair<double, double>> result = quadratic(a, b, c);
    if (result.first) {
        std::pair<double, double> solutions = result.second;
        std::cout << "Solutions: (" << solutions.first << ", " << solutions.second << ")" << std::endl;
    } else {
        std::cout << "No real roots" << std::endl;
    }
}

