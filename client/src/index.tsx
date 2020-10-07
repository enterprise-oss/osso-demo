import './index.css';

import * as Sentry from '@sentry/react';
import { Integrations } from '@sentry/tracing';
import * as React from 'react';
import * as ReactDOM from 'react-dom';
import { BrowserRouter as Router } from 'react-router-dom';

import App from './App';

if (process.env.CLIENT_SENTRY_DSN) {
  Sentry.init({
    dsn: process.env.CLIENT_SENTRY_DSN,
    integrations: [new Integrations.BrowserTracing()],
  });
}

ReactDOM.render(
  <Router basename="/admin">
    <App />
  </Router>,
  document.getElementById('root'),
);

if (module.hot) {
  module.hot.accept();
}
