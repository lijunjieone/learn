#include <iostream>
#include <string>

void test_cout() {
    std::string val = "this is string test";
    std::cout << "this is a test" <<std::endl;
    std::cout << val <<std::endl;
    std::cout << "please input some word:"<< std::endl;
    std::cin>>val;
    std::cout << "this is your input " << val << std::endl;

}