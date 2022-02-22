@isTest
private class ChatBotModelControllerTest {
  @isTest
  static void returnsResponseOnSuccessfulInvocation() {
    // GIVEN
    FunctionsInvokeMockInner mock = new FunctionsInvokeMockInner();
    Test.setMock(functions.FunctionInvokeMock.class, mock);

    // WHEN
    Test.startTest();
    ChatBotModelController.ChatBotInvokeFunctionModel('Hello');
    Test.stopTest();

  }

  

  public class FunctionsInvokeMockInner implements functions.FunctionInvokeMock {
    public String response = 'Success!';
    public String error = 'Function returned an error!';
    public Boolean throwError = false;
    private String invocationId = '000000000000000';

    public functions.FunctionInvocation respond(
      String functionName,
      String payload
    ) {
      if (throwError) {
        return functions.MockFunctionInvocationFactory.createErrorResponse(
          invocationId,
          functions.FunctionErrorType.FUNCTION_EXCEPTION,
          error
        );
      }

      return functions.MockFunctionInvocationFactory.createSuccessResponse(
        invocationId,
        response
      );
    }
  }
}