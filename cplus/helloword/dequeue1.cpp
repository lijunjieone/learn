
#include <iostream>
#include <deque>

using namespace std;

void test_qeque(){
    deque<int> intdeque;
    intdeque.push_back(2);
    intdeque.push_back(3);
    intdeque.push_back(4);
    intdeque.push_back(7);
    intdeque.push_back(9);

    cout << "Deque:old" <<endl;

    for(int i=0;i<intdeque.size();i++){
        cout <<"intdeque[" << i<<"];";
        cout << intdeque[i] << endl;

    }

    cout<<endl;


}

int main(){
    test_qeque();
    return 0;
}