#!/bin/bash

testContent="テストの中身"

function test_Pass(){
    echo "${testContent} Pass"
}

function test_Fail(){
    echo "${testContent} Fail"
    exit 1
}

testContent="テスト1: 10と20"
./18745124_kadai3.sh 10 20 && test_Pass || test_Fail

testContent="テスト2: 450と900"
./18745124_kadai3.sh 450 900 && test_Pass || test_Fail

testContent="テスト3: 1024と4096"
./18745124_kadai3.sh 1024 4096 && test_Pass || test_Fail

testContent="テスト4: 10と060"
./18745124_kadai3.sh 10 060 && test_Pass || test_Fail

testContent="テスト5: 60と0 -> 失敗したのがテスト成功 "
./18745124_kadai3.sh 60 0 && test_Fail || test_Pass

testContent="テスト6: 9と0.99 -> 失敗したのがテスト成功 "
./18745124_kadai3.sh 9 0.99 && test_Fail || test_Pass

testContent="テスト7: 40と0k -> 失敗したのがテスト成功 "
./18745124_kadai3.sh 40 0k && test_Fail || test_Pass

testContent="テスト8: 40と-20 -> 失敗したのがテスト成功 "
./18745124_kadai3.sh 40 -20 && test_Fail || test_Pass

exit 0
