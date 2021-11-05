public with sharing class FlowAction_RetriveCSVExtract {

    // Requested from the Flow
    public class Requests { 

        @invocableVariable (label='Apex Job ID' required=true)
        public String jobId;

        @invocableVariable (label='Batch Size' required=true)
        public Integer batchSize;

    }

    // Returned back to the Flow
    public class Results {
        
        @invocableVariable (label='CSV Data')
        public List<CSV_Import_Data__b> csvData;

    }

    // The action exposed to the Flow
    @invocableMethod(label='Retrieve CSV Import' description='' category='Data Manipulation')
    public static List<Results> retrieveCSVRows(List<Requests> requestList) {

        // Prepare the response back to the Flow
        Results response = new Results();
        List<Results> responseWrapper = new List<Results>();

        // Bulkify to process multiple requests 
        for (Requests req : requestList) {

            // Get input values
            String jobId = req.jobId;
            Integer batchSize = req.batchSize;

// Begin Apex processing logic 

            List<CSV_Import_Data__b> csvData = [SELECT  JobId__c, AttachmentId__c, Row__c, column01__c, column02__c, column03__c, column04__c, column05__c, column06__c, column07__c, column08__c, column09__c, column10__c, column11__c, column12__c, column13__c, column14__c, column15__c, column16__c, column17__c, column18__c, column19__c, column20__c, column21__c, column22__c, column23__c, column24__c, column25__c, column26__c, column27__c, column28__c, column29__c, column30__c, column31__c, column32__c, column33__c, column34__c, column35__c, column36__c, column37__c, column38__c, column39__c, column40__c, column41__c, column42__c, column43__c, column44__c, column45__c, column46__c, column47__c, column48__c, column49__c, column50__c, column51__c, column52__c, column53__c, column54__c, column55__c, column56__c, column57__c, column58__c, column59__c, column60__c
                                                FROM    CSV_Import_Data__b 
                                                WHERE   JobId__c = :jobId
                                                LIMIT 	:batchSize];

           /* if (csvData.size()==0) {
                CSV_Import_Job__c jobRecord = [SELECT Id, Status__c FROM CSV_Import_Job__c WHERE Name=:jobId LIMIT 1];
                jobRecord.Status__c = 'Complete';
                update jobRecord;    
            }                                               
            else if (csvData.size()>0) {
                CSV_Import_Job__c jobRecord = [SELECT Id, Status__c FROM CSV_Import_Job__c WHERE Name=:jobId LIMIT 1];
                jobRecord.Status__c = 'Processing';
                update jobRecord;    
            }
*/
// End Apex prrocessing logic 

            // Set output values
            response.csvData = csvData;
            responseWrapper.add(response);

        }


        return responseWrapper;


    }  

}


/*

public with sharing class FlowAction_RetriveCSVExtract {

    @invocableMethod(label='Retrieve CSV Import' description='' category='Data Manipulation')
    public static List<FlowOutput> retrieveCSVRows(List<FlowInput> input){

        String JobId = input.get(0).jobId;
        Integer rowLimit = input.get(0).rowLimit;


        List<CSV_Import_Data__b> csvData = [SELECT  JobId__c, AttachmentId__c, Row__c, column01__c, column02__c, column03__c, column04__c, column05__c, column06__c, column07__c, column08__c, column09__c, column10__c, column11__c, column12__c, column13__c, column14__c, column15__c, column16__c, column17__c, column18__c, column19__c, column20__c, column21__c, column22__c, column23__c, column24__c, column25__c, column26__c, column27__c, column28__c, column29__c, column30__c, column31__c, column32__c, column33__c, column34__c, column35__c, column36__c, column37__c, column38__c, column39__c, column40__c, column41__c, column42__c, column43__c, column44__c, column45__c, column46__c, column47__c, column48__c, column49__c, column50__c, column51__c, column52__c, column53__c, column54__c, column55__c, column56__c, column57__c, column58__c, column59__c, column60__c
                                            FROM    CSV_Import_Data__b 
                                            WHERE   JobId__c = :jobId
                                           	LIMIT 	:rowlimit];

        if (csvData.size()==0) {
            CSV_Import_Job__c jobRecord = [SELECT Id, Status__c FROM CSV_Import_Job__c WHERE Name=:jobId LIMIT 1];
            jobRecord.Status__c = 'Complete';
            update jobRecord;    
        }                                               
        else if (csvData.size()>0) {
            CSV_Import_Job__c jobRecord = [SELECT Id, Status__c FROM CSV_Import_Job__c WHERE Name=:jobId LIMIT 1];
            jobRecord.Status__c = 'Processing';
            update jobRecord;    
        } {
            
        }                  
                                                
        FlowOutput output = new FlowOutput();
        output.csvData = csvData;
        List<FlowOutput> outputList = new List<FlowOutput>();
        outputList.add(output);

        return outputList;

    }

    public class FlowInput { 
        @invocableVariable (label='Apex Job ID' required=true)
        public String jobId;
        @invocableVariable (label='Batch Size' required=true)
        public Integer rowLimit;

    }

    public class FlowOutput {
        @invocableVariable (label='CSV Data')
        public List<CSV_Import_Data__b> csvData;

    }


}

*/