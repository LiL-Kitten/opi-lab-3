package cringe.lab3;

import cringe.lab3.entity.Point;
import cringe.lab3.service.commands.AreaChecker;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;


public class PointTest {

    @Test
    void checkCondition() {
        Point p1 = new Point(1, 2, 3);
        Point p2 = new Point(0, 0, 4);
        Point p3 = new Point(-1, -1, 5);

        AreaChecker checker = new AreaChecker();
        checker.action(List.of(p1, p2, p3));

        assertFalse(p1.isCondition(), "точка 1 не попадает в область");
        assertTrue(p2.isCondition(), "точка 2 попадает в область");
        assertTrue(p3.isCondition(), "точка 3 попадает в область");
    }
}
