package org.myproject;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class MainTest {
    @Test
    void testAdd() {
        assertEquals(5, Main.add(2,3));
    }
}
