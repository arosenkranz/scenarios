# Curl command
curl -X PUT "https://api.datadoghq.com/api/v1/notebooks/${NOTEBOOK_ID}" \
-H "Content-Type: application/json" \
-H "DD-API-KEY: ${DD_API_KEY}" \
-H "DD-APPLICATION-KEY: ${DD_APP_KEY}" \
-d @- << EOF
{
  "data": {
    "attributes": {
      "name": "Frontend Service Weekly Report",
      "cells": [
        {
          "attributes": {
            "definition": {
              "type": "query_value",
              "requests": [
                {
                  "formulas": [{ "formula": "query1" }],
                  "response_format": "scalar",
                  "queries": [
                    {
                      "query": "avg:trace.rack.request.duration{env:my-environment,service:store-frontend}",
                      "data_source": "metrics",
                      "name": "query1",
                      "aggregator": "avg"
                    }
                  ]
                }
              ],
              "autoscale": true,
              "precision": 2,
              "title": "Avg Request Duration"
            },
            "graph_size": "m",
            "time": null
          },
          "type": "notebook_cells",
        },
        {
          "attributes": {
            "definition": {
              "show_legend": true,
              "yaxis": { "scale": "linear" },
              "type": "timeseries",
              "requests": [
                {
                  "formulas": [{ "formula": "query1" }],
                  "style": {
                    "line_width": "normal",
                    "palette": "dog_classic",
                    "line_type": "solid"
                  },
                  "response_format": "timeseries",
                  "on_right_yaxis": false,
                  "display_type": "bars",
                  "queries": [
                    {
                      "search": { "query": "service:store-frontend" },
                      "data_source": "logs",
                      "compute": { "interval": 30000, "aggregation": "count" },
                      "name": "query1",
                      "indexes": ["*"],
                      "group_by": [
                        {
                          "facet": "status",
                          "sort": { "aggregation": "count", "order": "desc" },
                          "limit": 10
                        }
                      ]
                    }
                  ]
                }
              ],
              "title": "Logs"
            },
            "graph_size": "l",
            "split_by": { "keys": [], "tags": [] },
            "time": null
          },
          "type": "notebook_cells",
        },
        {
          "attributes": {
            "definition": { "text": "## Release Notes\n", "type": "markdown" }
          },
          "type": "notebook_cells",
        },
        {
          "attributes": {
            "definition": { 
              "text": "\n### Week of: ${date -d "$date -7 days" +"%Y-%m-%d"}\n\n#### Added\n\n- Added a new advertisements image [#123](#)\n- Added margin around product images [#128](#)\n- Added discount code display area [#139](#)\n\n#### Fixed\n\n- Applied all the latest security updates to frontend service\n- Removed lingering debugging logs [#137](#)\n\n#### Changed\n\n- Updated the logging payload in frontend service [#120](#)\n\n", 
              "type": "markdown" }
          },
          "type": "notebook_cells",
        }
      ],
      "time": { "live_span": "1w" }
    }
    "type": "notebooks"
  }
}
EOF
