public with sharing class FlowAction_noOutput {

    // Inputs from the Flow
    public class Input { 

        @invocableVariable (label='Some String from the Flow' required=true)
        public String someString;
    }

    // Expose the Action to the Flow
    @invocableMethod(label='My Flow Action' description='' category='')
    public static void flowAction(List<Input> inputList) {

        // Bulkify to process multiple Inputs 
        for (Input i : inputList) {

            // Get input values
            String someString = i.someString;

            ////////////////////////////////////////////////
            ///////////// Do Some Stuff Here ///////////////
            ////////////////////////////////////////////////

        }

    }  
}
