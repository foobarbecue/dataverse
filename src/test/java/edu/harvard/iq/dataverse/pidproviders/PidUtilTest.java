package edu.harvard.iq.dataverse.pidproviders;

import edu.harvard.iq.dataverse.util.json.JsonUtil;
import java.io.IOException;
import javax.json.JsonObjectBuilder;
import org.junit.Test;
import org.junit.Ignore;

/**
 * Useful for testing but requires DataCite credentials, etc.
 */
public class PidUtilTest {

    @Ignore
    @Test
    public void testGetDoi() throws IOException {
        String username = System.getenv("DataCiteUsername");
        String password = System.getenv("DataCitePassword");
        String baseUrl = "https://api.test.datacite.org";
        String pid = "";
        pid = "doi:10.70122/QE5A-XN55";
        JsonObjectBuilder result = PidUtil.queryDoi(pid, baseUrl, username, password);
        String out = JsonUtil.prettyPrint(result.build());
        System.out.println("out: " + out);
    }

    @Ignore
    @Test
    public void testDeleteDoi() throws IOException {
        String username = System.getenv("DataCiteUsername");
        String password = System.getenv("DataCitePassword");
        String baseUrl = "https://api.test.datacite.org";
        String pid = "";
        pid = "doi:10.70122/FK2/UAESPI";
        int result = PidUtil.deleteDoi(pid, baseUrl, username, password);
        System.out.println("out: " + result);
    }

}
