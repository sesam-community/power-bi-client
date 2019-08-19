section Sesam;

[DataSource.Kind="Sesam", Publish="Sesam.Publish"]
shared Sesam.Feed = Value.ReplaceType(SesamImpl, type function (url as Uri.Type) as any);

SesamImpl = (url as text) =>
let
    AccessTokenHeader = "bearer " & Extension.CurrentCredential()[Key],
    // Uses the Sesam API method using the bearer token
    GetJsonQuery = Web.Contents(url,
     [
         Headers = [#"Authorization"=AccessTokenHeader]
     ]
    ),
    SesamJson = Json.Document(GetJsonQuery),
    #"Converted to Table" = Table.FromList(SesamJson, Splitter.SplitByNothing(), null, null, ExtraValues.Error)
 
 in
    #"Converted to Table";

// Data Source Kind description
Sesam = [
    Authentication = [
        Key = []
    ],
    Label = Extension.LoadString("DataSourceLabel")
];

// Data Source UI publishing description
Sesam.Publish = [
    Beta = true,
    Category = "Other",
    ButtonText = { Extension.LoadString("ButtonTitle"), Extension.LoadString("ButtonHelp") },
    LearnMoreUrl = "https://docs.sesam.io/",
    SourceImage = Sesam.Icons,
    SourceTypeImage = Sesam.Icons
];

Sesam.Icons = [
    Icon16 = { Extension.Contents("Sesam16.png"), Extension.Contents("Sesam20.png"), Extension.Contents("Sesam24.png"), Extension.Contents("Sesam32.png") },
    Icon32 = { Extension.Contents("Sesam32.png"), Extension.Contents("Sesam40.png"), Extension.Contents("Sesam48.png"), Extension.Contents("Sesam64.png") }
];
