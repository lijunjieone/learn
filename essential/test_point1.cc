
#include <iostream>
#include <vector>

#include <cstdlib>


void test_base() {
       int ival = 1024;
    int *pi = &ival;
    std::cout<<"ival:"<<ival<<",ival.address:"<<&ival<<",pi:"<<pi<<",pi.value:"<<(*pi)<<"xx:"<<*pi<<std::endl;
    std::cout<<"ival2:"<<*(&ival)<<",ival3:"<<*(&(*pi))<<std::endl;

    int m =2;

    int *pii = 0;
    int *pd = 0;
    int *ps = 0;

    std::cout<<"m"<<m<<",value:"<<&m<<std::endl;
    std::cout<<"pii"<<(pii==0?-1:0)<<",value:"<<(pii==0?-1:*pii)<<std::endl;
    pii = &m;
    int *px = &m;
    std::cout<<"pii2"<<(pii==0?-1:0)<<",value:"<<(pii==0?-1:*pii)<<std::endl;
    std::cout<<"pii2"<<(pii==0?-1:0)<<",value:"<<(pii==0?-1:*pii)<<std::endl;


    
}



void test_point_vector1() {
    std::cout<<"test vector"<<std::endl;
    const int seq_size= 5;
    int pell_seq[seq_size];
    pell_seq[0]=1;
    pell_seq[1]=1;
    pell_seq[2]=1;
    pell_seq[3]=3;
    pell_seq[4]=1;

    std::vector<int> vec(pell_seq,pell_seq+seq_size);


    int pell_seq2[seq_size];
    pell_seq2[0]=1;
    pell_seq2[1]=1;
    pell_seq2[2]=2;
    pell_seq2[3]=3;
    pell_seq2[4]=1;

    std::vector<int> vec2(pell_seq2,pell_seq2+seq_size);


    int pell_seq3[seq_size];
    pell_seq3[0]=1;
    pell_seq3[1]=3;
    pell_seq3[2]=1;
    pell_seq3[3]=3;
    pell_seq3[4]=1;

    std::vector<int> vec3(pell_seq3,pell_seq3+seq_size);
    const int s_size=3;

    std::vector<int> * vex[s_size] = {&vec,&vec2,&vec3};

    srand(s_size*100);
    int seq_index=rand();
    seq_index = seq_index%s_size;
    
    std::cout<<"index:"<<seq_index<<std::endl;
    std::vector<int>* current_vec = vex[seq_index];



    for(int i=0;i<(*current_vec).size();i++) {
        std::cout<<"index:"<<seq_index<<",pos:"<<i<<",value:"<<(*current_vec)[i]<<std::endl;
    }
}


void test_point1() {
 test_point_vector1();

}