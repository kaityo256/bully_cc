def generate(n)
  open("test.cpp","w") do |f|
    f.puts <<EOS
#include <cstdio>
int
main(void){
  int i=0;
EOS
    n.times do
      f.puts "  i++;"
    end
    f.puts <<EOS
  printf("%d\\n",i);
}
EOS
  end
end

n = 100
n = ARGV[0].to_i if ARGV.size > 0
generate(n)
