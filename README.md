[![Build Status](https://travis-ci.org/ontohub/indexer.svg?branch=master)](https://travis-ci.org/ontohub/indexer)
[![Coverage Status](https://coveralls.io/repos/github/ontohub/indexer/badge.svg?branch=master)](https://coveralls.io/github/ontohub/indexer?branch=master)
[![Code Climate](https://codeclimate.com/github/ontohub/indexer/badges/gpa.svg)](https://codeclimate.com/github/ontohub/indexer)
[![Dependency Status](https://gemnasium.com/badges/github.com/ontohub/indexer.svg)](https://gemnasium.com/github.com/ontohub/indexer)
[![GitHub issues](https://img.shields.io/github/issues/ontohub/indexer.svg?maxAge=2592000)](https://waffle.io/ontohub/ontohub-backend?source=ontohub%2Findexer)

# Indexer
Indexes data for quick searching

# Usage
Run
```
bin/indexer
```
to start the listener.
Whenever it receives a job via RabbitMQ, it fetches the data from the PostgreSQL database and stores relevant data in the Elasticsearch index.

# Development
Run
```
bin/console
```
to open an interactive console that has the Indexer booted.

# Dependencies
You need to install the following packages
* RabbitMQ
