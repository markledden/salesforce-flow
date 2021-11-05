@isTest
private class FlowAction_JSONSerializeTest {

    @isTest
    static void validateSerialize() {
        
        List<FlowMapClass> flowmap = new List<FlowMapClass>();
        FlowMapClass kv = new FlowMapClass();
        kv.key = 'name';
        kv.value = 'john';
        flowmap.add(kv);
        
        List<FlowAction_JSONSerialize.FlowInput> testinput = new List<FlowAction_JSONSerialize.FlowInput>();
        
        FlowAction_JSONSerialize.FlowInput input = new FlowAction_JSONSerialize.FlowInput();
        input.flowmap = flowmap;
        
        testinput.add(input);

        Test.startTest();

        FlowAction_JSONSerialize.serializeJSON(
            new List<FlowAction_JSONSerialize.FlowInput> (testinput)
        );

        Test.stopTest();     
                
    }
     
}