import ballerina/http;
import ballerina/log;

service /rates on new http:Listener(9090) {
    resource function get getUsdToLkr() returns string|error {
        http:Client sampathExchangesRatesClient = check new("https://www.sampath.lk/");
        json reponse = check sampathExchangesRatesClient->get("/api/exchange-rates");
        json|error data = reponse.data;
        if (data is json) {
            Currency[] currencies = check data.cloneWithType();
            foreach var currency in currencies {
                if (currency.CurrCode == "USD") {
                    return "Sampath USD to LKR " + currency.TTBUY;
                }
            }
        }
        else {
            error err = data;
            log:printError("Error occurred: " + err.message());
            return "Error occurred fetching data from Sampath API";
        }
        return "USD not found";
    }
}

type Currency record {|
    string CurrCode;
    string CurrName;
    string ODBUY;
    string Order;
    string RateType;
    string RateWEF;
    string SplRemarks;
    string TTBUY;
    string TTSEL;
|};
