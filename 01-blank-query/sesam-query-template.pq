// Sesam PowerBI query template: blank query to retrieve a dataset from Sesam Data Hub for use in PowerBI
// Invokes Sesam REST API directly

let

 AccessTokenHeader = "bearer " & "<Sesam JWT>",
 // Uses the Sesam API method using the bearer token
 GetJsonQuery = Web.Contents("https://<instance>.sesam.cloud/api/datasets/<dataset_name>/entities",
     [
         Headers = [#"Authorization"=AccessTokenHeader]
     ]
 ),
 SesamJson = Json.Document(GetJsonQuery),
    #"Converted to Table" = Table.FromList(SesamJson, Splitter.SplitByNothing(), null, null, ExtraValues.Error)
 
 in
    #"Converted to Table"