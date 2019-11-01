def check(n)
  s = "*"*n
  f = open("test.cpp","w")
  f.puts <<EOS
#include <cstdio>
int main(){
(#{s}printf)("Hello World\\n");
}
EOS
  f.close()
  return system("clang++ test.cpp 2> /dev/null")
end

def binary_search
  s = 1
  e = 10000
  while s!=e and s+1!=e
    m = (s+e)/2
    if check(m)
      puts "#{m} OK"
      s = m
    else
      puts "#{m} NG"
      e = m
    end
  end
end

binary_search
