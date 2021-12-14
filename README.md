apt update
apt-get install zlib1g-dev build-essential ruby-full libffi-dev
apt-get install nodejs npm
npm i -g bower
ruby --version
gem install bundler

cd build
bundler install
./deploy.sh

cd ..
ruby -run -e httpd . -p 8000
http://127.0.0.1:8000/docs/spot/v1/cn/
