
set -euo pipefail
cd "$(dirname "$0")"

case "$(uname -s 2>/dev/null || echo unknown)" in
    MINGW*|MSYS*|CYGWIN*) SEP=";" ;;
    *) SEP=":" ;;
esac
rm -rf out
mkdir -p out
find src -name "*.java" > .sources.txt
javac -d out -cp "lib/*" @.sources.txt
rm -f .sources.txt
echo "Build OK -> out/  (cp separator: '$SEP')"
