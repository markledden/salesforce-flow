public with sharing class FlowAction_JSONSerialize {

    static Set<Id> recordsProcessed = new Set<Id>();
    @invocableMethod(label='JSON Serialize' description='Convert Key/Value Colleciton to JSON' category='Data Manipulation')
    public static List<FlowOutput> serializeJSON(List<FlowInput> inputs){
    
        List<FlowMapClass> flowmap = inputs.get(0).flowmap;
        String json = JSON.serialize(flowmap);

        FlowOutput output = new FlowOutput();
        output.json = json;

        List<FlowOutput> outputList = new List<FlowOutput>();
        outputList.add(output);

        return outputList;

    }

    public class FlowInput { 

        @invocableVariable(label='Key Value Collection' required=true)
        public List<FlowMapClass> flowmap;

    }

    public class FlowOutput {

        @invocableVariable (label='JSON String')
        public String json;

    }
}