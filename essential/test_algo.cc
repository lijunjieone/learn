#include <algorithm>
#include <vector>
#include <iostream>


using namespace std;

void display3(vector<int> vec) {
    for(int i=0;i<vec.size();i++) {
        cout << vec[i] << ",";
    }
    cout<<endl;
}

void swap3(int &val1,int &val2) {
    int temp = val2;
    val2=val1;
    val1=temp;
}


void bubble(vector<int> &vec) {
    for(int i=0;i<vec.size();i++) {
        for(int j=i;j<vec.size();j++) {
            if(vec[i]>vec[j]) {
                swap3(vec[i],vec[j]);
            }

        }
    }
}

bool is_elem3(vector<int> &vec,int elem) {
    display3(vec);
    bubble(vec);
    display3(vec);
    return binary_search(vec.begin(),vec.end(),elem);
}


vector<int> filter(vector<int> vec,int value,bool (*handler)(int,int)) {
    vector<int> result;
    for(int i=0;i<vec.size();i++) {
        if(handler(vec[i],value)) {
            result.push_back(vec[i]);
        }
    }
    return result;
}


// template <typename InputIter,typename OutputIter,typename Elem,typename Comp>
// OutputIter filter1(InputIter first,InputIter end,OutputIter at,Elem value, Comp pred) {
//     for(;first!=end;) {
//         if(bind2nd(pred,value)) {
//             // cont<<"i"<<first<<endl;
//             // at.push_back(frist);
//             *at++=*first++;

//         }else {
//             first++;
//         }
//     }
//     return at;

// }

bool less_than(int val1,int val2) {
    bool f = val1 < val2;
    cout << "result:"<< f<< ",src1:"<<val1 << ",src2:" << val2 << endl;
    return f;
}

bool gather_than(int val1,int val2) {
    return val1 > val2;
}

void test_filter() {
    int arr1[]={2,3,4,5,20,8,40,60,1,90};
    vector<int> vec1(arr1,arr1+10);
    vector<int> result=filter(vec1,80,gather_than);
    display3(result);
}

void test_filter2() {
    int arr1[]={2,3,4,5,20,8,40,60,1,90};
    vector<int> vec1(arr1,arr1+10);
    int res[10];
    // filter1(vec1.begin(),vec1.end(),res,10,less<int>());


}

void test_algo1() {
    // int arr1[]={2,3,4,5,20,8,40,60,1,90};
    // vector<int> vec1(arr1,arr1+10);
    // cout<<"is_elem:"<<is_elem3(vec1,60)<<endl;

    // test_filter2();

}