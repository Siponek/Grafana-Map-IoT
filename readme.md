# Introduction

## Openstreetmap query for sample data

Query for getting corsa italia in openstreetmap with overpass-turbo.eu

```overpass
[out:json][timeout:25];
(
  way
    ["name"="Corso Italia"]
    ["surface"="asphalt"]
    ["oneway"="yes"]
  	
    (around:1000,44.39278831127266,8.961510399318177);
);
out body;
>;
out skel qt;
```

## Querying for specific points

```
[out:json];
(
    node(7029416827);
    node(524074284);
    node(524074298);
    node(524074302);
    node(524074306);
    node(59453518);
    node(47115329);
    node(7029416692);
    node(7029416693);
    node(47115332);
    node(7154630947);
    node(294577380);
    node(47115334);
    node(266629838);
    node(7029416686);
    node(47115337);
    node(7029416685);
    node(47115339);
    node(925357919);
    node(47115340);
    node(10573345211);
    node(47115342);
    node(925237776);
    node(47115345);
    node(59452509);
    node(47115346);
    node(560597293);
    node(560597295);
    node(47115348);
    node(47115350);
    node(524074446);
    node(524074444);
    node(296242514);
    node(266629897);
    node(524074471);
    node(524074469);
    node(47115362);
    node(47115364);
    node(937151394);
    node(47115366);
    node(266629365);
    node(948817795);
    node(47115385);
    node(925237877);
    node(266629358);
    node(47115386);
    node(297560647);
    node(1219355007);
    node(47115388);
    node(925237773);
    node(266629327);
    node(948817698);
    node(47115390);
    node(47115392);
  
);
out;
```

This uses grafana Route layer to display the route on the map. It is still in beta and not yet released. 