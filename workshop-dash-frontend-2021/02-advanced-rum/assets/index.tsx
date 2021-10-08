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

// set context for the user
datadogRum.setUser({
  id: '1234',
  name: 'John Doe',
  email: 'john.doe@storedog.com',
  plan: 'premium',
});

// if coming from main storedog website, set a global context value
if (window.location.search.includes('storedog')) {
  datadogRum.addRumGlobalContext('fromStoredog', true);
}

ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('root')
);

reportWebVitals();