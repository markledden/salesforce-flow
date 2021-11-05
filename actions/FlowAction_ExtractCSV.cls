public with sharing class FlowAction_ExtractCSV {

    public class Requests { 
        @invocableVariable(label='Attachment ID' required=true)
        public String attachmentId;
    }

    public class Results {
        @invocableVariable (label='Apex Job ID')
        public String jobId;
    }

    @invocableMethod(label='Extract CSV' description='' category='Data Manipulation')
    public static List<Results> extractCSVRows(List<Requests> requestList){
    
        Results response = new Results();
        List<Results> responseWrapper = new List<Results>();

        for (Requests req : requestList) {

            String attachmentId = req.attachmentId;

            ID apexJobId = System.enqueueJob(new CSVExtractJob(attachmentId));

            response.jobId = apexJobId;
            responseWrapper.add(response);
        }

        return responseWrapper;   
    }
}

/*

public with sharing class FlowAction_ExtractCSV {

    @invocableMethod(label='Extract CSV' description='' category='Data Manipulation')
    public static List<FlowOutput> extractCSVRows(List<FlowInput> inputs){
    
        String attachmentId = inputs.get(0).attachmentId;
        ID apexJobId = System.enqueueJob(new CSVExtractJob(attachmentId));

        List<FlowOutput> outputList = new List<FlowOutput>();
        FlowOutput output = new FlowOutput();
        output.jobId = apexJobId;
        outputList.add(output);

        return outputList;
            
    }
    public class FlowInput { 
        @invocableVariable(label='Attachment ID' required=true)
        public String attachmentId;
    }

    public class FlowOutput {
        @invocableVariable (label='Apex Job ID')
        public String jobId;
    }
}

*/