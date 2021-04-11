#pragma once

#include <fenix/types/base.h>

class Numeric;
class Integer;
class Integer8;
class Integer16;
class Integer32;
class Integer64;


class Numeric: public BaseType {
public:
    const unsigned int __bytes__ = 0;
};


class Integer: public Numeric {
public:
    const unsigned int __bytes__ = 0;
};

class Integer8: public Integer {
public:
    const unsigned int __bytes__ = 1;
    int8_t value = 1;

    /* constructor */

    Integer8(int8_t value) {
        this->value = value;
    }

    Integer8(int16_t value) {
        this->value = static_cast<int8_t>(value);
    }

    Integer8(int32_t value) {
        this->value = static_cast<int8_t>(value);
    }

    Integer8(int64_t value) {
        this->value = static_cast<int8_t>(value);
    }

    /* methods */

    bool check();

    /* operators */

    Integer8 operator+(const Integer8& other) const;
    Integer16 operator+(const Integer16& other);
    Integer32 operator+(const Integer32& other);
    Integer64 operator+(const Integer64& other);

};

class Integer16: public Integer {
public:
    const unsigned int __bytes__ = 2;
    int16_t value;

    /* constructor */

    Integer16(int8_t value) {
        this->value = value;
    }

    Integer16(int16_t value) {
        this->value = static_cast<int8_t>(value);
    }

    Integer16(int32_t value) {
        this->value = static_cast<int8_t>(value);
    }

    Integer16(int64_t value) {
        this->value = static_cast<int8_t>(value);
    }

    /* operators */

    Integer16 operator+(const Integer8& other);
    Integer16 operator+(const Integer16& other);
    Integer32 operator+(const Integer32& other);
    Integer64 operator+(const Integer64& other);

};

class Integer32: public Integer {
public:
    const unsigned int __bytes__ = 4;
    int32_t value;

    /* constructor */

    Integer32(int8_t value) {
        this->value = static_cast<int32_t>(value);
    }

    Integer32(int16_t value) {
        this->value = static_cast<int32_t>(value);
    }

    Integer32(int32_t value) {
        this->value = value;
    }

    Integer32(int64_t value) {
        this->value = static_cast<int32_t>(value);
    }

    /* operators */

    Integer32 operator+(const Integer8& other);
    Integer32 operator+(const Integer16& other);
    Integer32 operator+(const Integer32& other);
    Integer64 operator+(const Integer64& other);
};

class Integer64: public Integer {
public:
    const unsigned int __bytes__ = 8;
    int64_t value;

    /* constructor */

    Integer64(int8_t value) {
        this->value = static_cast<int64_t>(value);
    }

    Integer64(int16_t value) {
        this->value = static_cast<int64_t>(value);
    }

    Integer64(int32_t value) {
        this->value = static_cast<int64_t>(value);
    }

    Integer64(int64_t value) {
        this->value = value;
    }

    /* operators */

    Integer64 operator+(const Integer8& other);
    Integer64 operator+(const Integer16& other);
    Integer64 operator+(const Integer32& other);
    Integer64 operator+(const Integer64& other);
};
