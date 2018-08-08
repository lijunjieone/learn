#include <iostream>

using namespace std;

bool is_a(int x) {
    return x;
}

void handlex(int &x) {
    x=x+10;
}

void test_inline() {
    int x = 10;
    if(is_a(x)) {
        cout << "x1:" << x<<endl;
        handlex(x);
        cout << "x2:" << x<<endl;
    }
}