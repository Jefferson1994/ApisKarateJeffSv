package apisprueba.get;

import com.intuit.karate.junit5.Karate;

public class petstoreDataGetRunner {
    @Karate.Test
    Karate geographicalDataGet(){
        return Karate.run().relativeTo(getClass());
    }
}