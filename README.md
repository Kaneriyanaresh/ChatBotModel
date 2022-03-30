# Salesforce TDX Functions Demo

### Salesforce Functions Executing a Tensorflow Sentiment Analysis Model

This demo is an example of running a compute heavy workload in a function. The workload is an open source, pre-trained sentiment analysis model written in JavaScript and using the [Tensorflow.js](https://www.tensorflow.org/js/) library. The model is the TensorFlow.js [Sentiment Analysis](https://github.com/tensorflow/tfjs-examples/tree/master/sentiment#tensorflowjs-example-sentiment-analysis) example which was trained on a set of 25,000 movie reviews from IMDB, labelled as having positive or negative sentiment. 

This Project is a Salesforce Communities Site for customers of Acme Audio, a manufacturer of speakers, headphones and other audio products. The site has product pages with customer reviews. A `Product Review` Custom Object is created and populated with sample data from the [Amazon Product Review Dataset](https://s3.amazonaws.com/amazon-reviews-pds/readme.html). Five `Customer Product` Custom Objects are created for Acme Audio and 100 Product Reviews are imported for each product.

A Product Managers Dashboard app is included that tracks sentiment score over time by month, with drill down details for product and customer demographics.

The imported product review data includes a 'star rating' from 1-5 that is mapped to a simple sentiment of 'Positive' (4 or 5 stars), 'Neutral' (3 stars) or 'Negative' (1 or 2 stars) and is added to the review Object as the 'Actual Sentiment'. 

When reviews are imported, the sentiment analysis is scored and this score is mapped to a 'Predicted Sentiment' and also inserted into the review Object for display and trend analysis. A Precicted Sentiment of 0.0 to 0.4 score is a Negative review, 0.40-0.60 is a Neutral review and greater than 0.60 is a Positive review.

When a new review is submitted via the Communities site, the text is analyzed by running the sentiment anlysis model and the dashboard is updated with the new results.

The demo does not include any of the necessary AI/ML workflows for training, or other deployment and model lifecycle operations. Note that since the model was not trained on product review data, the sentiment predictions will not be very accurate. A comparison of the 'Actual Sentiment' to the 'Precicted Sentiment' will show where the model diverges from the true sentiment.

## Configure Your Trial Org

Follow the [directions in the Functions documentation](http://sfdc.co/functions-org-config) to configure your trial org for use with Functions and as a Developer Hub.

Be sure that you flipped the toggle switch to "Enable Production Space".

A note about Permission Sets: you will find that your default system administrator user has already been granted the "FunctionsAccess" and "FunctionsProdAccess" permission sets, so you can skip that section of the documentation initially, but any new users you choose to add to your trial org will need these permissions in order to access the Functions CLI.

## Salesforce Org Setup and Deployment
For more information about how to configure your organization for Salesforce Functions, please refer to the [documentation](http://sfdc.co/functions-org-config)

**Prerequisite: Functions Enabled Org**

 1. If you haven't already sing up for function enable Org, you can sign up [Function Enable Sing Up](https://functions-trials-manager-prod.herokuapp.com/signups)
 
 2. Clone the Sentiments repository:
     ```
     git clone https://github.com/LastMileOps/LMO-TDX-Demo.git
     ```

## Salesforce Functions Deployment

1. Login to your Salesforce Functions account:

    ```
    sf login functions
    ```

2. Create a **Compute Environment** to deploy the functions and connected it to your org:

    ```sh
    sf env create compute --connected-org=functions_recipes --alias=recipes_env
    ```
 
3. Deploy the functions

    ```sh
    sf deploy functions --connected-org=functions_recipes
    ```

4. Push source app to the org:

    ```sh
    sfdx force:source:push -f
    ```


