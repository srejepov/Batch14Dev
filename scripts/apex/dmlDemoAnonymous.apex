DmlDemo.dmlDemoInsert_stndObj1();
DmlDemo.dmlDemoInsert_cstmObj();
DmlDemo.dmlUpdateDemo_stndObj1();
DmlDemo.dmlUpdateDemo_stndObj2();
DmlDemo.dmlInsertDemo_stndObj2();
DmlDemo.dmlDemoInsert_cstmObj2();
DmlDemo.dmlDemoMultipleInsert_right1();
DmlDemo.dmlDemoMultipleInsert_right2();
DmlDemo.dmlDemoMultipleUpdate_right1();
DmlDemo.dmlDemoMultipleUpdate_right2();

//list<account> delAccounts = [select id from account where createddate = today limit 70];
//delete delAccounts;

delete [select id from account where createddate = today limit 70];