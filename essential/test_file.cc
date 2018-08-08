#include <fstream>
#include <iostream>

void test_output() {
    std::ofstream ofile("/tmp/my/aaaa.txt",std::ios_base::app);
    if(!ofile) {
        std::cout<<"open file err"<<std::endl;
    }else {
        ofile<<"this is a file append by ios"<<std::endl;
    }
}


void test_input() {
    std::ifstream infile("/tmp/my/aaaa.txt");
    if(!infile) {
        std::cout << "open file err."<<std::endl;
    }else {
        std::string name;
        while(infile>>name) {
            std::cout << "file_content:"<<name<<std::endl;
        }
    }
}

void test_io() {
    test_output();
    test_input();
}