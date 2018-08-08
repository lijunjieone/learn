#include <vector>
#include <iostream>

using namespace std;

bool fibon_elem(int pos,int &elem) {
    if(pos <= 0 || pos > 1024) {
        elem = 0;
        return false;
    }

    elem = 1;
    int n_2=1,n_1 = 1;
    for(int ix=3;ix<=pos;++ix) {
        elem = n_2+n_1;
        n_2=n_1;n_1=elem;
    }

    return true;
}

void test_fibon() {
    int m = 525;
    int result = 0;
    fibon_elem(m,result);
    cout<<"pos:"<<m<<",result:"<<result<<endl;
}
