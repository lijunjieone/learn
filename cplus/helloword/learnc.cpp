#include <iostream>
#include <list>
#include <vector>
#include <string>
#include <map>
#include <algorithm>

using namespace std;


void output(int val) {
    cout << val << " ";
}

vector<int> get_default_vector() {
    vector<int> v;
    for(int i=0;i<20;i++) {
        v.push_back(i);
    }

    return v;
}

bool right5(int val) {
    return val > 5; 
}

void test_partition() {
    vector<int> v = get_default_vector();
    cout << "Vect:";
    for_each(v.begin(),v.end(),output);
    partition(v.begin(),v.end(),right5);
    cout<< endl;
    cout << "Vect:";

    for_each(v.begin(),v.end(),output);
    cout << endl;



}



void test_for_each() {
    vector<int> intVect;
    for(int i=0;i<10;i++) {
        intVect.push_back(i);
    }
    cout << "Vect:";

    for_each(intVect.begin(),intVect.end(),output);
    random_shuffle(intVect.begin(),intVect.end());
    cout << endl;
    cout << "Vect:";
    for_each(intVect.begin(),intVect.end(),output);

}

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

    // test_map();

    // test_for_each();

    test_partition();

    return 0;
}