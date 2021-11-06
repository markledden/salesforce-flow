public with sharing class FlowAction_withOutput {

    // Inputs from the Flow
    public class Input { 

        @invocableVariable (label='Some String from the Flow' required=true)
        public String someString;
    }

    // Outputs to the Flow
    public class Output {
        
        @invocableVariable (label='Return a Number')
        public Integer someNumber;
    }

    // Expose the Action to the Flow
    @invocableMethod(label='My Flow Action' description='' category='')
    public static List<Output> flowAction(List<Input> inputList) {

        // Prepare the output back to the Flow
        Output output = new Output();
        List<Output> outputWrapper = new List<Output>();

        // Bulkify to process multiple Inputs 
        for (Input i : inputList) {

            // Get input values
            String someString = i.someString;

            ////////////////////////////////////////////////
            ///////////// Do Some Stuff Here ///////////////
            ////////////////////////////////////////////////

            // Set output values
            output.someNumber = 9;
            outputWrapper.add(output);

        }

        return outputWrapper;
    }  
}
