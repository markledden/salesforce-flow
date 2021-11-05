public with sharing class FlowAction_JSONDeserialize {

    static Set<Id> recordsProcessed = new Set<Id>();
    @invocableMethod(label='JSON Deserialize' description='Convert JSON to Key/Value Colleciton' category='Data Manipulation')
    public static List<FlowOutput> deserializeJSON(List<FlowInput> inputs){
    
        List<FlowMapClass> flowmap = (List<FlowMapClass>)JSON.deserialize(inputs.get(0).json, List<FlowMapClass>.class);

        FlowOutput output = new FlowOutput();
        output.flowmap = flowmap;

        List<FlowOutput> outputList = new List<FlowOutput>();
        outputList.add(output);

        return outputList;

    }

    public class FlowInput { 

        @invocableVariable(label='JSON String' required=true)
        public String json;

    }

    public class FlowOutput {

        @invocableVariable (label='Key Value Collection')
        public List<FlowMapClass> flowmap;


    }
}