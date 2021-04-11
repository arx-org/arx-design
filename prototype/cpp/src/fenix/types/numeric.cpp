#include <cstdint>

#include <fenix/types/base.h>
#include <fenix/types/numeric.h>


/* Integer8 */
Integer8 Integer8::operator+(const Integer8& other) const {
    return Integer8(this->value + other.value);
}

Integer16 Integer8::operator+(const Integer16& other) {
    return Integer16(this->value) + other;
}

/* Integer16 */
Integer16 Integer16::operator+(const Integer16& other) {
    return Integer16(this->value + other.value);
}
