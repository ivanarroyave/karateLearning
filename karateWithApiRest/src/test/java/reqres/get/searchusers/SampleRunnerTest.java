package reqres.get.searchusers;

import com.intuit.karate.junit5.Karate;

public class SampleRunnerTest {
    @Karate.Test
    Karate test(){
        return Karate.run("search-users.feature").relativeTo(this.getClass());
    }
}
