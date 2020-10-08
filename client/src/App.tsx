import '@enterprise-oss/ant-theme';

import { OssoProvider } from '@enterprise-oss/osso';
import { withProfiler } from '@sentry/react';
import { Layout } from 'antd';
import posthog from 'posthog-js';
import React, { ReactElement, useEffect } from 'react';
import { Route, Switch, useLocation } from 'react-router-dom';

import styles from './App.module.css';
import Header from './components/Header';
import Sidebar from './components/Sidebar';
import DeveloperConfig from './pages/developerConfiguration';
import EnterpriseAccount from './pages/enterpriseAccount';
import EnterpriseAccounts from './pages/enterpriseAccounts';
import OauthClientConfig from './pages/oauthClientConfig';

function App(): ReactElement {
  const location = useLocation();

  useEffect(() => {
    if (!process.env.POSTHOG_API_KEY) return;

    posthog.capture('$pageview');
  }, [location]);

  return (
    <OssoProvider>
      <Layout>
        <Sidebar />
        <Layout className={styles.main}>
          <Header />
          <Layout.Content className={styles.content}>
            <Switch>
              <Route exact path="/enterprise" component={EnterpriseAccounts} />
              <Route path="/enterprise/:domain" component={EnterpriseAccount} />
              <Route exact path="/config" component={DeveloperConfig} />
              <Route path="/config/:id" component={OauthClientConfig} />
            </Switch>
          </Layout.Content>
        </Layout>
      </Layout>
    </OssoProvider>
  );
}

export default withProfiler(App);
