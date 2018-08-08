
#include <vector>
#include <string>
#include <iostream>

using namespace std;

const vector<int> * fibon_seq12(int size) {
    int a[]={1,2,3,4};
    static vector<int> b(a,a+4);

    return &b;
}


const vector<int> * fibon_seq13(int size) {
    int a[]={2,3,4,5};
    static vector<int> b(a,a+4);
    return &b;
}


void display_fibon2(const vector<int> * (*seq_ptr)(int)) {
   const vector<int>  *seq2=seq_ptr(30);
    for(int i=0;i<(*seq2).size();i++) {
        cout<<"t:"<<(*seq2)[i]<<endl;
    } 
}

void display_fibon(){
    const vector<int>  *seq2=fibon_seq13(30);
    for(int i=0;i<(*seq2).size();i++) {
        cout<<"t:"<<(*seq2)[i]<<endl;
    }
}


enum ns_type {
    ns_f12,ns_f13
};
void test_func_array() {
    const vector<int>* (*seq_array[])(int)={
        fibon_seq12,fibon_seq13
    };

    const vector<int>* (*seq_ptr)(int) = seq_array[ns_f13];

    

}


void test_func_point_fibon() {
    // display_fibon();
    display_fibon2(fibon_seq12);
    display_fibon2(fibon_seq13);
}
