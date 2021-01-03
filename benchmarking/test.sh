#!/bin/bash
export JVM_ARGS="-Dnashorn.args=--no-deprecation-warning"

if test "$#" -ne 1; then
    echo "Illegal number of parameters"
    echo "Usage: ./test.sh <users|write|read|mix>"
    exit 2
fi

date=`date "+%Y-%m-%d_%H-%M-%S_%3N"`

case $1 in 
    "users") ./apache-jmeter-5.4/bin/jmeter -n -t load_tests/create_test_users.jmx -l output/users_$date/results.csv -e -o output/users_$date/ ;;
    "write") ./apache-jmeter-5.4/bin/jmeter -n -t load_tests/load_write.jmx -l output/write_$date/results.csv -e -o output/write_$date/ ;; 
    "read") ./apache-jmeter-5.4/bin/jmeter -n -t load_tests/load_read.jmx -l output/read_$date/results.csv -e -o output/read_$date/ ;;
    "mix") ./apache-jmeter-5.4/bin/jmeter -n -t load_tests/load_mix.jmx -l output/mix_$date/results.csv -e -o output/mix_$date/ ;;
    *) echo "Wrong input profile. Specify between users|write|read|mix profiles." ;; 
esac