#include <string>
#include <iostream>
#include <vector>

using namespace std;

void display_message(const string &str,const vector<int> &vec) {
    cout<<"s:"<<str<<",vec:"<<vec.size();
}

void display_message(const string &str,const vector<string> &vec) {
    cout<<"s:"<<str<<",vec:"<<vec.size();
}


void test_vect_int() {
    const string s="this is a test";
    vector<int> vec1(13);
    vec1[0]=10;
    vec1[1]=20;
    display_message(s,vec1);
}

void test_vector_str() {
    const string s="this is a test";
    vector<string> vec1(10);
    vec1[0]="test";
    vec1[1]="test2";
    display_message(s,vec1);
}






template <typename elem>
void display_message2(const string &str,vector<elem> &elems) {
    cout<<"s:"<<str<<",vec:"<<elems.size();
}


void test_vect_int1() {
    const string s="this is a test";
    vector<int> vec1(13);
    vec1[0]=10;
    vec1[1]=20;
    display_message2(s,vec1);
}

void test_vector_str1() {
    const string s="this is a test";
    vector<string> vec1(10);
    vec1[0]="test";
    vec1[1]="test2";
    display_message2(s,vec1);
}


void test_vector_float() {
    const string s="this is a test";
    vector<float> vec1(9);
    vec1[0]=1.1f;
    vec1[1]=2.1f;
    display_message2(s,vec1);
}

void test_template() {
    test_vect_int1();
    test_vector_str1();
    test_vector_float();
}


