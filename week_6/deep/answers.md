# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

A reason to adopt it is that all the data are evenly distributed on all the available servers.
A reason to not adopt it is that if we search for an observation, we need to query all the servers.

## Partitioning by Hour

A reason to adopt it is that depending on the observation we looking for, we don't always need to query all the servers.
A reason to not adopt it is that all the data will not distributed well as most of observations occur between midnight and 01:00 AM.

## Partitioning by Hash Value

A reason to adopt it is that all the data are evenly distributed on all the available servers, and when looking for a specific data, we just need to query one server.
A reason to not adopt it is that when looking for data in a range, we still need to query all the servers.
