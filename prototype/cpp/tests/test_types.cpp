#include <iostream>
#include <string>

#include <fenix/types/numeric.h>
#include <gtest/gtest.h>



/* Integer8 */

TEST(TestNumeric, int8_create) {
    int raw_value = 1;
    Integer8 result = Integer8(raw_value);
    EXPECT_EQ(result.value, raw_value);
}


// TEST(TestNumeric, int8_add_int8) {
//     int raw_value = 1;
//     Integer8 result = Integer8(raw_value) + Integer8(raw_value);
//     EXPECT_EQ(result.value, (raw_value + raw_value));
// }

// TEST(TestNumeric, int8_check) {
//     int raw_value = 1;
//     Integer8 result = Integer8(raw_value);
//     EXPECT_EQ(result.check(), true);
// }

/* Integer16 */

TEST(TestNumeric, int16_create) {
    int raw_value = 1;
    Integer16 result = Integer16(raw_value);
    EXPECT_EQ(result.value, raw_value);
}


/* Integer32 */

TEST(TestNumeric, int32_create) {
    int raw_value = 1;
    Integer32 result = Integer32(raw_value);
    EXPECT_EQ(result.value, raw_value);
}


/* Integer64 */

TEST(TestNumeric, in64_create) {
    int raw_value = 1;
    Integer64 result = Integer64(raw_value);
    EXPECT_EQ(result.value, raw_value);
}
