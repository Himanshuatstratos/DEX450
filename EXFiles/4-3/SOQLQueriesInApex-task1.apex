//--------------------------------------------------------------------------------------------
//TASK 1: Retrieve a single case.

//TODO: Write an Apex statement that: Declares a variable of type Case 
//  named aCase and assigns it the value of a SOQL query that
//         - Selects the Subject field
//         - From the Case sObject
//         - Where the value of the Id field of the Case sObject equals
//           the Id of a Case record you find in the Salesforce UI.

Case acase = [SELECT Subject FROM Case WHERE Id = '5005c000017KzcZAAS' ];
System.debug(aCase);