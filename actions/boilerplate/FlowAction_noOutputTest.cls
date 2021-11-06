@isTest
private class FlowAction_noOutputTest {

    @isTest
    static void validateAction() {
        
        String myString = 'abcdefg';
        
        List<FlowAction_noOutput.Input> testInputList = new List<FlowAction_noOutput.Input>();
        FlowAction_noOutput.Input testInput = new FlowAction_noOutput.Input();
        testInput.someString = myString;
        testInputList.add(testInput);

        Test.startTest();

            FlowAction.flowAction(
                new List<FlowAction_noOutput.Input> (testInputList)
            );

        Test.stopTest();     
                
    }
     
}