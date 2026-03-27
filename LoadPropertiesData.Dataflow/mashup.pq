[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "InsertData_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared InsertData = let
  Source = Excel.Workbook(Web.Contents("https://mngenvmcap635694-my.sharepoint.com/personal/carlosbusinessuser_mngenvmcap635694_onmicrosoft_com/Documents/Apps/Microsoft Power Query/Uploaded Files/InsertData_Template_DummyData 1.xlsx"), null, true),
  #"Navigation 1" = Source{[Item = "InsertData", Kind = "Sheet"]}[Data],
  #"Promoted headers" = Table.PromoteHeaders(#"Navigation 1", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"Portfolio Name", type text}, {"Property ID - External", type text}, {"Property ID - Internal", type text}, {"Property Name", type text}, {"Asset Class ", type text}, {"Subasset Class ", type text}, {"Submarket", type text}, {"Year of Construction", Int64.Type}, {"Year of Modernisation ", Int64.Type}, {"Main Tenant", type text}, {"Sector (of Main Tenant)", type text}, {"Total Rental Space (sqm)", Int64.Type}, {"Vancancy Rate ", Int64.Type}, {"Date of Condition", type date}, {"WALT", Int64.Type}, {"Picture ", type text}, {"Utilisation", type text}, {"Parking Lots", Int64.Type}, {"Number of Units", Int64.Type}, {"Office Share", type number}, {"Retail Share", type number}, {"EPC Rating", type text}, {"Energy Consumption (kwH/sqm/ p.a )", Int64.Type}, {"Building Type", type text}, {"Divisibility", Int64.Type}, {"Federal State", type text}, {"Region", type text}, {"Postal Code", Int64.Type}, {"City", type text}, {"Street", type text}, {"Number", type text}, {"Compare Address ( For HQ )", type text}, {"Distance HQ", type number}, {"Distance Main Station ", type number}, {"Distance Next Public Transit", type number}, {"Distance City Center", type number}, {"Distance Airport", type number}, {"Distance High Way", type number}, {"Any Other Important Distance", Int64.Type}, {"Next Public Transit", type text}, {"Main Tenant Income ", Int64.Type}, {"Total Current Rent ( EUR p.a )", Int64.Type}, {"Average Current Rent (EUR / sqm / p.m )", type number}, {"Stabilized Total Rent (EUR / p.a )", Int64.Type}, {"Total Current Market Rent  (EUR / p.a )", Int64.Type}, {"Average Current Market Rent (EUR / sqm / per month )", Int64.Type}, {"Total Share of Income of Main Asset Class ( EUR / p.a )", Int64.Type}, {"Population Development Last 5 Years", type number}, {"Population Forecast 2035", type number}, {"Population Information Range", type text}, {"Purchasing Power", type number}, {"Centrality", Int64.Type}, {"Population Amount", Int64.Type}, {"Unemployment", type number}}),
  #"Removed columns" = Table.RemoveColumns(#"Changed column type", {"Column75", "Column76", "WALT (including options)", "WALT (excluding options)"}),
  #"Replaced value" = Table.ReplaceValue(#"Removed columns", null, "", Replacer.ReplaceValue, {"Leasehold"}),
  #"Replaced value 1" = Table.ReplaceValue(#"Replaced value", null, "", Replacer.ReplaceValue, {"Remaining Leasehold Term "}),
  #"Replaced value 2" = Table.ReplaceValue(#"Replaced value 1", null, 0, Replacer.ReplaceValue, {"Residential Share", "Hotel Share", "Leisure Share", "Industrial Share ", "Logistics Share", "Gastronomy Share", "Parking Share", "Health Care Share", "Commercial Park Share", "Mixed-Use Share", "Serviced Apartments Share", "Others Share", "Development Site Share"}),
  #"Removed columns 1" = Table.RemoveColumns(#"Replaced value 2", {"Range Asking Rent"}),
  #"Changed column type 1" = Table.TransformColumnTypes(#"Removed columns 1", {{"Office Share", Percentage.Type}, {"Development Site Share", Percentage.Type}, {"Others Share", Percentage.Type}, {"Serviced Apartments Share", Percentage.Type}, {"Mixed-Use Share", Percentage.Type}, {"Commercial Park Share", Percentage.Type}, {"Health Care Share", Percentage.Type}, {"Parking Share", Percentage.Type}, {"Gastronomy Share", Percentage.Type}, {"Logistics Share", Percentage.Type}, {"Industrial Share ", Percentage.Type}, {"Leisure Share", Percentage.Type}, {"Hotel Share", Percentage.Type}, {"Residential Share", Percentage.Type}, {"Latitude", type number}, {"Longitude", type number}}),
  #"Replaced value 3" = Table.ReplaceValue(#"Changed column type 1", null, null, Replacer.ReplaceValue, {"Latitude", "Longitude"}),
  #"Replaced value 4" = Table.ReplaceValue(#"Replaced value 3", null, 0, Replacer.ReplaceValue, {"Latitude", "Longitude"})
in
  #"Replaced value 4";
shared InsertData_DataDestination = let
  Pattern = FabricSql.Contents([CreateNavigationProperties = false, HierarchicalNavigation = null]),
  Navigation_1 = Pattern{[workspaceId = "39666ea9-91d3-404a-be22-7b02087fd7bb"]}[Data],
  Navigation_2 = Navigation_1{[sqlId = "cd02dd2f-cfa9-494a-85f9-61c23d169f67"]}[Data],
  TableNavigation = Navigation_2{[Item = "Properties", Schema = "dbo"]}?[Data]?
in
  TableNavigation;
