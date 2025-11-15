# http://120.46.39.251/tvbox/tvboxqq/饭太硬/api.json
# 解析出 url 路径部分并删除开头的斜杠，再去掉文件名部分，作为目录名
url="$1"
url_base=$(dirname "$url")
path_without_protocol="${url#*://}"                  # 去除协议
path_only="${path_without_protocol#*/}"               # 去除域名
dir=$(dirname "$path_only")
mkdir -p "$dir"
filename=$(basename "$url")
wget -q "$url" -O "$dir/$filename"

grep -o -E '\./.+?"' "$dir/$filename" |sort |uniq | sed 's/"//g' | sed -E 's/\;.+$//g' | while read -r line;
do
echo $line
mkdir -p "$dir/$(dirname $line)"
if [ -f "$dir/$line" ]; then
  echo "$dir/$line already exists, skipping."
  continue
fi

wget -q "$url_base/$line" -O "$dir/$line"
done