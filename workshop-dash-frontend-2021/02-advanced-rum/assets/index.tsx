import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';

import { datadogRum } from '@datadog/browser-rum';

datadogRum.init({
  applicationId: process.env.REACT_APP_DD_APPLICATION_ID || '',
  clientToken: process.env.REACT_APP_DD_CLIENT_TOKEN || '',
  site: 'datadoghq.com',
  service: 'storedog-microsite',
  version: '1.1',
  sampleRate: 100,
  trackInteractions: true,
  allowedTracingOrigins: [
    /https:\/\/.*\.environments.katacoda\.com/,
    'http://localhost:3001',
  ],
});

datadogRum.startSessionReplayRecording();

// set global context to be able to track user actions
datadogRum.setRumGlobalContext({ 'usr.handle': 'john@storedog.com' });

if (window.location.href.includes('utm')) {
  // if coming from a marketing campaign, set the context
  datadogRum.addRumGlobalContext({ fromUtm: true });
}

ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('root')
);

reportWebVitals();
