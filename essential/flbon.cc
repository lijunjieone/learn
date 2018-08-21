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



class LibMat {
    public:
    LibMat() {
        cout<<"LibMat::LibMat() default construct" << endl;
    }

    virtual ~LibMat() {
        cout << "~LibMat: destroy()" <<endl;
    }

    virtual void print() const {
        cout << "LibMat::print() -- I'm a LibMat object!" << endl;
    }
};

void print(const LibMat &mat) {
    cout << "in global print();" << endl;
    mat.print();
}


class Book : public LibMat {
    public :
    Book(const string &title ,const string &author):_title(title),_author(author) {
        cout << "Book::Book(" << _title << ", "<< _author << ") constructor" <<endl;
    }

    virtual ~Book() {
        cout << "Book::~Book() destory()" << endl;
    }

    virtual void print() const {
        cout << "Book::print() -- I am a Book object " << endl 
        << "title: " << _title << endl
        << "authro: " << _author << endl;
    }

    const string& title() const { return _title ; }
    const string& author() const {
        return _author;
    }

    protected:
    string _title;
    string _author;
};


void test_class2() {
    Book b("learn c++","lijunjie");
    b.print();

    LibMat x;
    x.print();
    // cout << "test" << endl;
}


