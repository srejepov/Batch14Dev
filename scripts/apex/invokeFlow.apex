Account acc = [SELECT Id, Name, OwnerId, CreatedBy.Name FROM Account WHERE Name = 'Dickenson plc'];

//get the inputs map ready
Map<String,Object> inputs = new Map<String,Object>();
inputs.put('AccountId', acc.Id);
inputs.put('AccountName', acc.Name);
inputs.put('AccountOwnerId', acc.OwnerId);
inputs.put('CreatedByName', acc.CreatedBy.Name);

//invoke the flow (Account_Autolaunched_Flow)
Flow.Interview flow = new Flow.Interview.Account_Autolaunched_Flow(inputs);
Flow.start();