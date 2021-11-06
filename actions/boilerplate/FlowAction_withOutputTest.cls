@isTest
private class FlowAction_withOutputTest {

    @isTest
    static void validateAction() {
        
        String myString = 'abcdefg';
        
        List<FlowAction_withOutput.Input> testInputList = new List<FlowAction_withOutput.Input>();
        FlowAction_withOutput.Input testInput = new FlowAction_withOutput.Input();
        testInput.someString = myString;
        testInputList.add(testInput);

        Test.startTest();

            FlowAction_withOutput.flowAction(
                new List<FlowAction_withOutput.Input> (testInputList)
            );

        Test.stopTest();     
                
    }
     
}