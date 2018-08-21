rm -rf out
mkdir -pv out
cd out 
cmake .. -DCMAKE_BUILD_TYPE=Debug 
make
./demo
