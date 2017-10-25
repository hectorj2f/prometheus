package com.mesosphere.sdk.prometheus.scheduler;

import com.mesosphere.sdk.testing.ServiceTestRunner;
import org.junit.Test;

public class ServiceTest {

    @Test
    public void testSpecBase() throws Exception {
        new ServiceTestRunner("svc.yml").run();
    }
}
