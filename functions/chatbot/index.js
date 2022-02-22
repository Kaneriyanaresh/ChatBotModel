/**
 * Describe Chatbot here.
 *
 * The exported method is the entry point for your code when the function is invoked. 
 *
 * Following parameters are pre-configured and provided to your function on execution: 
 * @param event: represents the data associated with the occurrence of an event, and  
 *                 supporting metadata about the source of that occurrence.
 * @param context: represents the connection to Functions and your Salesforce org.
 * @param logger: logging handler used to capture application logs and trace specifically
 *                 to a given execution of a function.
 */

import buddhi from 'buddhi-nlp';

const model_dir = 'model';
const dataUrl = model_dir + '/model_metadata.json'
console.log(dataUrl);
const modelUrl = 'http://54.183.167.171/models/buddhi-nlp/model.json'
console.log(modelUrl);
buddhi.loadModel(modelUrl, dataUrl, callbackFunction);

function callbackFunction() {
    console.log("model loaded!");
}

export default async function(event, context, logger) {

    logger.info(`Invoking Chatbot with payload ${JSON.stringify(event.data || {})}`);
    const { sentence } = event.data;
    console.log('sentence ' + sentence);
    let answer = buddhi.classify(sentence);
    console.log('answer  ' + answer);
    return answer[0];

}