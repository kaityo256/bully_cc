# frozen_string_literal: true

def generate(n)
  open("test.cpp", "w") do |f|
    f.puts <<~EOS
      #include <stdio.h>
      int
      main(void){
        int i=0;
    EOS
    n.times do
      f.puts "  i++;"
    end
    f.puts <<~EOS
        printf("%d\\n",i);
      }
    EOS
  end
end

def search
  s = 100000
  e = 500000
  while e != s && e != s+1
    n = (e+s)/2
    generate(n)
    if system("g++-9 test.cpp 2> /dev/null")
      puts "#{n} OK"
      s = n
    else
      puts "#{n} NG"
      e = n
    end
  end
end

search
