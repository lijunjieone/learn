
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

// void display(vector<int> vec) {
//     for(int i=0;i<vec.size(),++i) {
//         cout << vec[i] <<' ';
//     }
//     cout << endl;
// }

void swap( int val1,int val2) {
    int temp = val1;
    val1 = val2;
    val2 = temp;
}

// void bubble_sort(vector<int> vec) {
//     for(int i=0;i<vec.size();++i) {
//         for(int j=i+1;j<vec.size(); ++j) {
//             swap(vec[i],vec[j]);
//         }
//     }
// }

void test_bubble_sort() {

}