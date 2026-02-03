#/usr/env/bin bash

set -e

utplsql_version="3.1.14"
tmp_dir="/tmp/utplsql"

echo "Downloading utPLSQLv${utplsql_version} …"
curl -L "https://github.com/utPLSQL/utPLSQL/releases/download/v${utplsql_version}/utPLSQL.zip" -o "${tmp_dir}.zip"

echo "Unzipping …"
unzip "${tmp_dir}.zip" -d $tmp_dir

echo "Installing utPLSQL as sysdba …"
sqlplus / as sysdba << EOF
@${tmp_dir}/source/install_headless_with_triggers.sql
EOF

echo "Cleaning up …"
rm -rf $tmp_dir ${tmp_dir}.zip

echo "utPLSQL installed successfully!"
