#include <iostream>
#include <string>
#include <vector>
#include <list>

using namespace std;

const int * find(const vector<int> &vec,int value) {

    for(int i=0;i<vec.size();i++) {
        if(value == vec[i]) {
            // vec[i];
            return &vec[i];
        }
    }
    return 0;
}


template <typename elem>
const elem * find2(const vector<elem> &vec,const elem &value) {
    for(int i=0;i<vec.size();i++) {
        if(value == vec[i]) {
            return &vec[i];
        }
    }

    return 0;
}

template <typename elem>
const elem * find3( const elem *array,int size,const elem &value) {
    if(!array || size < 1) {
        return 0;
    }
    for(int i=0;i<size;i++) {
        if(value == array[i]) {
            return &array[i];
        }
    }

    return 0;
}

template <typename elem>
const elem * find4(const elem *start,const elem *end,const elem &value) {
    if(!start || !end ) {
        return 0;
    }

    for(;start != end;++start) {
        if(value == *start) {
            return start;
        }
    }
    return end;
}

template <typename elem ,typename iter>
iter find5(iter start,iter end,const elem &value) {
    for(;start!=end;++start){
        if(value == *start) {
            return start;
        }
    }

    return end;
}


void test_find1() {
    int array[] = {1,2,3,4,5,8,10,200,3};
    vector<int> vec(array,array+9);
    cout<<"find value:"<<find(vec,200)<<endl;
    cout<<"find value:"<<find(vec,100)<<endl;
}

void test_find2_int() {
    int array[] = {1,2,3,4,5,8,10,200,3};
    vector<int> vec(array,array+9);
    cout<<"find value:"<<find2(vec,200)<<endl;
    cout<<"find value:"<<find2(vec,100)<<endl;
}

void test_find2_float() {
    float array[] = {1.0f,2.0f,3.3f,4.6f,5.7f,8.9f,10.0f,200.3f,3};
    vector<float> vec(array,array+9);
    cout<<"find value:"<<find2(vec,4.6f)<<endl;
    cout<<"find value:"<<find2(vec,100.0f)<<endl;
}

void test_find2_string() {
    string array[] = {
        "aka",
        "bkak",
        "fff"
    };
    vector<string> vec(array,array+3);
    string a="aka";
    
    cout<<"find value:"<<find2(vec,a)<<endl;
    cout<<"find value:"<<find2(vec,(string)"test")<<endl;
}


void test_find3_float() {
    float array[] = {1.0f,2.0f,3.3f,4.6f,5.7f,8.9f,10.0f,200.3f,3};
    vector<float> vec(array,array+9);
    cout<<"find value:"<<find3(array,9,4.6f)<<endl;
    cout<<"find value:"<<find3(&vec[0],9,4.6f)<<endl;
}

void test_find4_float() {
    float array[] = {1.0f,2.0f,3.3f,4.6f,5.7f,8.9f,10.0f,200.3f,3};
    vector<float> vec(array,array+9);
    list<float> ilist(array,array+9);
    cout<<"find value:"<<find4(array,array+9,4.6f)<<*find4(array,array+9,4.6f)<<endl;
    cout<<"find value:"<<find4(&vec[0],&vec[9],4.6f)<<*find4(&vec[0],&vec[9],4.6f)<<endl;
    // cout<<"find value:"<<find4(ilist.begin(),ilist.end(),4.6f)<<*find4(&vec[0],&vec[9],4.6f)<<endl;

}

void test_find5_float() {
    float array[] = {1.0f,2.0f,3.3f,4.6f,5.7f,8.9f,10.0f,200.3f,3};
    vector<float> vec(array,array+9);
    list<float> ilist(array,array+9);
    cout<<"find value:"<<&*find5(array,array+9,4.6f)<<*find5(array,array+9,4.6f)<<endl;
    cout<<"find value:"<<&*find5(vec.begin(),vec.end(),4.6f)<<*find5(&vec[0],&vec[9],4.6f)<<endl;
    cout<<"find value:"<<*find5(ilist.begin(),ilist.end(),4.6f)<<*find5(&vec[0],&vec[9],4.6f)<<endl;

}
void test_point_math() {
    // test_find2_int();
    // test_find2_float();
    // test_find2_string();
    // test_find3_float();
    // test_find1();
    test_find5_float();
}
