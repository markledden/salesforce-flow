@isTest
private class FlowAction_JSONDeserializeTest {

    @isTest
    static void validateDeserialize() {
        
        String json = '[{"value":"mark","key":"name"},{"value":"manchester","key":"city"},{"value":"blue","key":"colour"}]';
        
        List<FlowAction_JSONDeserialize.FlowInput> testinput = new List<FlowAction_JSONDeserialize.FlowInput>();
        
        FlowAction_JSONDeserialize.FlowInput input = new FlowAction_JSONDeserialize.FlowInput();
        input.json = json;
        
        testinput.add(input);

        Test.startTest();

        FlowAction_JSONDeserialize.deserializeJSON(
            new List<FlowAction_JSONDeserialize.FlowInput> (testinput)
        );

        Test.stopTest();     
                
    }
     
}