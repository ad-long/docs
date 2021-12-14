apt update
apt install pkg-config build-essential nodejs git libxml2-dev libxslt-dev
apt install ruby ruby-dev
ruby --version
gem install bundler

cd build
bundler install
bundle update
./deploy.sh

cd ..
ruby -run -e httpd . -p 8000
http://127.0.0.1:8000/docs/spot/v1/cn/
