# Sesam PowerBI Desktop integrations

This repo contains sample code and connectors for integrating the Sesam Data Hub with Microsoft PowerBI

## 1. Powerquery / PowerBI Desktop "blank query" template
This method of connecting uses the Sesam REST API directly to retrieve JSON data, starting with a blank query in PowerBI and incorporating all the necessary coding. This hard-codes the JWT authorization key and API url endpoint into the PowerBI query.

Blank query can also be used within the Dataflows feature on the Power BI Pro portal. You can then create datasets that live on the cloud and use them from there within the PowerBI Desktop client.

## 2. PowerBI Desktop Connector

This method gives the user a dialog box to parameterise the Sesam API url endpoint and JWT authorization key.
