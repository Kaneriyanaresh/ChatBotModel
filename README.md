# Sentiments Functions Model

## Introduction

The model is the [TensorFlow.js Sentiment Analysis](https://github.com/tensorflow/tfjs-examples/tree/master/sentiment#tensorflowjs-example-sentiment-analysis) model which is used as the basis for a simple product feedback page.

## Configure Your Trial Org

Follow the [directions in the Functions documentation](http://sfdc.co/functions-org-config) to configure your trial org for use with Functions and as a Developer Hub.

Sing up function trial Org - [Sing Up link](https://functions-trials-manager-prod.herokuapp.com/signups)

Be sure that you flipped the toggle switch to "Enable Production Space".

A note about Permission Sets: you will find that your default system administrator user has already been granted the "FunctionsAccess" and "FunctionsProdAccess" permission sets, so you can skip that section of the documentation initially, but any new users you choose to add to your trial org will need these permissions in order to access the Functions CLI.

## Install Prerequisite Tools

Please refer to the section in our documentation called [Set Up Your Development Environment](https://sfdc.co/functions-install-guide) and install all of the required tools on your computer before proceeding to the next step.

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


