import os
import sys
from time import sleep
import requests
import json
from datadog_api_client.v1 import ApiClient, ApiException, Configuration
from datadog_api_client.v1.api import monitors_api
from datadog_api_client.v1.models import *
from rich.console import Console

lab_user_email = os.getenv("LABUSER")
api_key = os.getenv("DD_API_KEY")
app_key = os.getenv("DD_APP_KEY")
# dashboard_json_path = "/root/storedog-frontend-dashboard.json"
configuration = Configuration()

# Enter a context with an instance of the API client
with ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = monitors_api.MonitorsApi(api_client)
    body = Monitor(
        message="message_example",
        name="name_example",
        options=MonitorOptions(
            enable_logs_sample=True,
            escalation_message="none",
            evaluation_delay=1,
            groupby_simple_monitor=True,
            include_tags=True,
            locked=True,
            min_failure_duration=0,
            min_location_failed=1,
            new_group_delay=1,
            new_host_delay=300,
            no_data_timeframe=1,
            notify_audit=False,
            notify_no_data=False,
            renotify_interval=1,
            renotify_occurrences=1,
            renotify_statuses=[
                MonitorRenotifyStatusType("alert"),
            ],
            require_full_window=True,
            silenced={
                "key": 1,
            },
            synthetics_check_id="synthetics_check_id_example",
            threshold_windows=MonitorThresholdWindowOptions(
                recovery_window="recovery_window_example",
                trigger_window="trigger_window_example",
            ),
            thresholds=MonitorThresholds(
                critical=3.14,
                critical_recovery=3.14,
                ok=3.14,
                unknown=3.14,
                warning=3.14,
                warning_recovery=3.14,
            ),
            timeout_h=1,
        ),
        priority=1,
        query="avg(last_5m):sum:system.net.bytes_rcvd{host:host0} > 100",
        restricted_roles=[
            "restricted_roles_example",
        ],
        tags=[
            "tags_example",
        ],
        type=MonitorType("metric alert"),
    )  # Monitor | Create a monitor request body.
