#include <map>
#include <string>
#include <iostream>
#include <vector>

#include <iterator>
#include <algorithm>


using namespace std;
void display_map(map<string,int> words); 
void test_init_map1() {
    map<string,int> words;
    words["l"] = 100;
    words["j"] = 120;
    display_map(words);

    cout << "find map key: " << words.find("li")->second << endl;
    cout << "find map key: " << words.find("l")->second << endl;
    cout << "find map key: " << words.count("li") << endl;
}


void display_map(map<string,int> words) {
    map<string,int>::iterator it = words.begin();

    for(; it != words.end(); ++it) {
        cout <<"key:" <<it->first <<"  ,value:" << it->second << endl;
    }
}


void test_io2();
void test_io3() ;
void test_map1() {
    // test_init_map1();
    // test_io2();
     test_io3() ;
}

void test_io2() {
    istream_iterator<string> is(cin);
    istream_iterator<string>  eof;

    vector<string> text;
    copy(is,eof,back_inserter(text));

    sort(text.begin(),text.end());

    ostream_iterator<string> os( cout,"\n");
    copy(text.begin(),text.end(),os);
    
}

void test_io1() {
    string words;
    vector<string> text;

    while(cin >> words) {
        cout << "words:" << words << endl;
        text.push_back(words);
        if(words=="exit") {
            break;
        }

    }

    sort(text.begin(),text.end());

    for(int i=0;i<text.size();i++) {
        cout << text[i] << " " << endl;;
    }
}


class FunctionObjectType 
{
    public: 
              void operator() () {
                  cout << "Hello C++" << endl;
              }

              void operator() (int x) {
                  cout << "Hello c and " << x << endl;
              }
};

void test_io3() 
{
    FunctionObjectType val;
    val();
    val(5);
}