import ballerina/http;

type Greeting record {|
    string to;
    string content;
|};

configurable int port = 9090;
configurable Greeting greeting = {
    to: "Ballerina",
    content: "Welcome to Ballerina!"
};

service http:Service / on new http:Listener(port) {
    resource function post greeting() returns string {
        string message = string `Hello ${greeting.to}! ${greeting.content}`;
        return message;
    }
}