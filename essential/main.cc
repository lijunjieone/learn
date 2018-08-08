
#include <iostream>
#include <string>

#include "test_include.h"

using namespace std;

int test() {

    string user_name;
    cout << "your name:";
    cin >> user_name;
    cout << endl;
    cout << "Hello ";
    cout << user_name;
    return 0;

}


int main() {
    // test_cout(); 
    // test_array1();
    // test_point1();
    // test_io();
    //test_fibon();
    // test_bubble();
    test_inline();
    // test_template();
    // test_func_point_fibon();
    return 0;
   
}