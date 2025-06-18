compile_cpp() {
  local src="${1%*.cpp}.cpp"
  local exe="${src%.cpp}"
  if [[ ! -f $src ]]; then
    echo "Usage: cxx_compile foo.cpp   # builds ./foo"
    return 1
  fi

  echo "→ Compiling $src …"
  g++ -std=c++23 -O2 \
    -Wall -Wextra -Wpedantic \
    -fmax-errors=1 \
    "$src" -o "$exe"

  if [[ $? -eq 0 ]]; then
    echo "✅ Built ./$(basename "$exe")"
  else
    echo "❌ Fix above and retry"
    return 2
  fi
}
