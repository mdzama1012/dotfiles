compile_cpp() {
  if [ $# -ne 1 ]; then
    echo "Usage: compile_cpp <source.cpp>"
    return 1
  fi

  local src="$1"
  if [[ "$src" != *.cpp ]]; then
    echo "Error: '$src' is not a .cpp file"
    return 1
  fi

  if [ ! -f "$src" ]; then
    echo "Error: '$src' does not exist"
    return 1
  fi

  local base="${src%.cpp}"
  g++ -std=c++2b -Wall -Wextra -Wpedantic -Werror -o "$base" "$src"
}
