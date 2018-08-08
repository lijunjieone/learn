
#include <vector>
#include <iostream>

using namespace std;

void display(vector<int> vec) {
    for(int i=0;i<vec.size();i++) {
        cout << vec[i] << ",";
    }
    cout<<endl;
}


void swap (int &val1,int  &val2) {
    int temp = val1;
    val1 = val2;
    val2 = temp;
}

void swap2 (int* val1,int*  val2) {
    int temp = *val1;
    *val1 = *val2;
    *val2 = temp;
}

void bubble_sort(vector<int> &vec) {
    for(int i=0;i<vec.size();i++) {
        for(int j=i;j<vec.size();j++) {
            if(vec[j]>vec[i]) {
                swap2(&vec[j],&vec[i]);
                //swap(vec[j],vec[i]);
            }
        }
    }
}
void test_fibon_seq() ;


void test_bubble() {
    int x[]={1,4,20,3,4,5,8,10,31,40,2,7};
    vector<int> c(x,x+11);
    display(c);
    bubble_sort(c);
    display(c);

    test_fibon_seq();
}


vector<int>* fibon_seq(int size) {
   static vector<int> elems(size);
    for(int i=0;i<size;i++) {
        if(i==0 || i==1) {
            elems[i]=1;
        }else {
            elems[i]=elems[i-1]+elems[i-2];
        }

    }

    return &elems;
}

vector<int> fibon_seq2(vector<int> &elems,int size) {
    for(int i=0;i<size;i++) {
        if(i==0 || i==1) {
            elems[i]=1;
        }else {
            elems[i]=elems[i-1]+elems[i-2];
        }

    }

    return elems;
}

void test_fibon_seq() {
    const int s=30;
    vector<int> vec(s);
    // display(fibon_seq2(vec,s));
    display(*fibon_seq(s));
}