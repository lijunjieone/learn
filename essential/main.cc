
#include <iostream>
#include <string>

#include "test_include.h"

using namespace std;

int test() {

    string user_name;
    cout << "your name:";
    cin >> user_name;
    cout << endl;
    cout << "Hello ";
    cout << user_name;
    return 0;

}
void test_algo1() ;
void test_map1();

void isBigEndian() {
    int a = 0x1234;
    char b = *(char *)&a;
    cout << "b:" << b << endl;
}

void test_char() {
    char *s;
    s="hello";
    printf("%s\n",s);
    printf("%p\n",s);
    printf("%p\n",&s[0]);
    printf("%c\n",s[0]);
    printf("%p\n",&s);
}

void test_char1() {
    char a[] = "hello";
    char *s = a;
    for(int i=0;i<strlen(a);i++) 
    {
        printf("%c,",s[i]);
        printf("%p,",s[i]);
        printf("%p,",&s[i]);
        printf("%c\n",&s[i]);
    }
}

void test_char2() {
    char *a[] = {"ni","hai","hao","ma"};
    for(int i=0;i<4;i++) {
        printf("%p,",a[i]);
        printf("%p,",&a[i]);
        printf("%s,",a[i]);
        printf("%d,",strlen(a[i]));
        printf("%d\n",sizeof(a[i]));
    }
    printf("%d\n",sizeof(a));
}

void test_size_t() {
    char a[] = "hello";
    size_t l=strlen(a);
    for(size_t i=0;i<l;i++) {
        printf("%c,",a[i]);
    }
}

typedef struct S {
    int i;
    struct S *next;
} B;

void test_link1() {
    B head;
    B next;
    for(int i=0;i<10;i++) {
        B x;
        x.i = i;
        if(i==0) {
            head = x;
            next = x;
        }else {
            next.next = &x;
        }
        next = x;
    }

    for(int i =0;i<9;i++) {
        B b2;
        if(i==0) {
            b2 = head;
            next = *head.next;
        }else {
            b2 = next;
            next = *b2.next;
        }
        cout<<"i:"<< b2.i << ",b:" << &b2 << ",b.n:" << b2.next << endl;
    }

}



int ss(char a, char b) {
    using namespace std;
    cout << a << b <<'c'<<endl;
    return a+b+'c';
}
void test_typedef1() {
    using namespace std;
    typedef int (*A) (char, char);
    A a;
    a=ss;
    a('a','b');
}

void test_class2();
void test_xx();
int main() {
    test_class2();
    test_xx();
    // test_link1();
    // test_typedef1();
    // test_size_t();
    // test_char2();
    // test_cout(); 
    // test_array1();
    // test_point1();
    // test_io();
    //test_fibon();
    // test_bubble();
    // test_inline();
    // test_template();
    // test_func_point_fibon();
    // test_point_math() ;
    // test_algo1();
    // test_map1();
    // isBigEndian();

    return 0;
   
}


