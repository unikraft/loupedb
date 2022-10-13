set -euo pipefail

AAA=aaa

echo "/*--------------------------------------*/"
echo test-echo-string
echo env-AAA=$AAA
export AAA=aaa
echo env-AAA=$AAA
echo env-PATH=$PATH
echo "/*--------------------------------------*/"
echo "TEST ls /bin"
ls -al /bin
echo "/*--------------------------------------*/"
echo "TEST /usr/bin/ls /etc"
/usr/bin/ls -al /etc
echo "/*--------------------------------------*/"
echo -n 'before-and-and ' && echo -n 'after-and-and ' && echo 'OK'
if [ "$AAA" == "aaa" ]; then echo "OK if: $AAA==aaa"; fi
[[ "$AAA" == "bbb" ]] || echo "OK [[ ]]: $AAA!=bbb"
echo "/*--------------------------------------*/"
echo "before-syntax-error"
if [ true ]; then echo blah; fi
# execution stops here in bash too
echo "OK after-syntax-error"
echo "/*--------------------------------------*/"
