#include <vector>
#include <iostream>


void test_init_arrays() {
    const int seq_size= 5;
    int pell_seq[seq_size];
    pell_seq[0]=1;
    pell_seq[1]=1;
    pell_seq[2]=1;
    pell_seq[3]=1;
    pell_seq[4]=1;

    for(int i=0;i<seq_size;i++) {
        std::cout<<"pos:"<<i<<",value:"<<pell_seq[i]<<std::endl;
    }
}


void test_init_vector() {
    std::cout<<"test vector"<<std::endl;
    const int seq_size= 5;
    int pell_seq[seq_size];
    pell_seq[0]=1;
    pell_seq[1]=1;
    pell_seq[2]=1;
    pell_seq[3]=3;
    pell_seq[4]=1;

    std::vector<int> vec(pell_seq,pell_seq+seq_size);

    for(int i=0;i<vec.size();i++) {
        std::cout<<"pos:"<<i<<",value:"<<vec[i]<<std::endl;
    }
}

void test_array1() {
    test_init_arrays();
    test_init_vector();
}

// void print_array(int[] array1,int size) {
//     for(int i=0;i<size;i++)  {
//         std::cout<<"pos"<<i<<"value:"<<array1[i]<<std::endl;
//     }
// }