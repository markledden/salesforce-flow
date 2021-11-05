public with sharing class FlowAction_DeleteCSVData {

    // Requested from the flow 
    public class Requests {

        @invocableVariable (label='Row Count' required=true)
        public Integer batchSize;

        @invocableVariable (label='Apex Job ID' required=true)
        public String jobId;

    }

    // The action exposed to the Flow
    @invocableMethod(label='Delete CSV Data' description='' category='Data Manipulation')
    public static void deleteCSVData(List<Requests> requestList) {

        // Bulkify to process multiple requests 
        for (Requests req : requestList) {

            // Get input values
            String jobId = req.jobId;
            Integer batchSize = req.batchSize;

// Begin Apex processing logic 

            ID apexJobId = System.enqueueJob(new CSVDeleteJob(batchSize,jobId));

// End Apex prrocessing logic 


        }    

    }


}

