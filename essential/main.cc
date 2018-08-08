
#include <iostream>
#include <string>

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

bool fibon_elem(int,int&);
void test_cout();
int main() {
    test_cout(); 
    return 0;
   
}