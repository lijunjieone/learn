#include <iostream>
#include <list>
#include <vector>
#include <string>
#include <map>

using namespace std;

void test_map(){
    map<int,string> cMap;
    cMap[1] = "abc";
    cMap[2] = "cde";

    map<int,string>::iterator it;
    for(it = cMap.begin();it!=cMap.end();it++){
        cout <<(*it).first << "->";
        cout <<(*it).second << endl;
    }


}

void test_list() {
    int array[10] = {1,3,5,8,7,10,9,22,11,4};
    
    list<int> list1(array,array+10);

    list1.sort();

    for(list<int>::iterator it=list1.begin();it!=list1.end();it++) {
        
        cout << " " << *it;

    }

    cout << endl;


}

int main() {
    // test_list();

    test_map();

    return 0;
}