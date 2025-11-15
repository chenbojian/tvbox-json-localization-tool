#https://github.com/qq254950134/my_tvbox?tab=readme-ov-file

wget http://120.46.39.251/tvbox/duo.json -O tvbox/qq254950134/duo.json

grep -o -E '"http.+?json"' tvbox/qq254950134/duo.json |grep '120.46.39.251' |sort |uniq | sed 's/"//g' | while read -r line;
do
echo $line

(cd tvbox/qq254950134 && zsh ../../download.sh $line)

done

sed -i '' 's#http://120.46.39.251#https://cnb.cool/b89757/tvbox/-/git/raw/main/qq254950134#' tvbox/qq254950134/duo.json
