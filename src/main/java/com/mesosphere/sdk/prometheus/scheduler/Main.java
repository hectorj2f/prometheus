package com.mesosphere.sdk.prometheus.scheduler;

import com.mesosphere.sdk.scheduler.SchedulerConfig;
import com.mesosphere.sdk.scheduler.SchedulerRunner;
import com.mesosphere.sdk.specification.yaml.RawServiceSpec;

import java.io.File;

/**
 * Filebeat service.
 */
public class Main {
    public static void main(String[] args) throws Exception {
        if (args.length > 0) {
            File yamlSpecFile = new File(args[0]);
            SchedulerRunner.fromRawServiceSpec(
                    RawServiceSpec.newBuilder(yamlSpecFile).build(),
                    SchedulerConfig.fromEnv(),
                    yamlSpecFile.getParentFile()).run();
        }
    }
}
