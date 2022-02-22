public class ChatBotModelController{

    @AuraEnabled
    public static void ChatBotInvokeFunctionModel(String ChatBotInput) {

        Long startTime = DateTime.now().getTime();
        String Jsonpayload = '{"sentence": "'+ChatBotInput+'"}';

        functions.Function myFunction = functions.Function.get('SalesforceFunctions.chatbot');
        functions.FunctionInvocation invocation = myFunction.invoke(Jsonpayload);
        String jsonResponse = invocation.getResponse();
        Long endTime = DateTime.now().getTime();
        Long milliseconds = endTime - startTime;

        Chat_Bot__c InsertChatbot = new Chat_Bot__c(Chat_Input__c = ChatBotInput, Chat_Predictions__c = jsonResponse, Response_Time__c =milliseconds );
        insert InsertChatbot; 
    }


}