num = ARGV[0].to_i

puts <<EOS
#include<cstdio>

int func0(int a){
  return a + 1;
}

EOS

num.times do |i|
  puts "int func#{i+1}(int a){return func#{i}(a);}"
end

puts <<EOS

int main(void){
  int a = 0;
  printf("%d\\n",func#{num}(a));
}
EOS
