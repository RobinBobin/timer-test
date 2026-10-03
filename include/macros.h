#define MODIFY_BITS(VALUE, RESET, SET, SHIFT) \
  (VALUE) & ~((RESET) << (SHIFT)) | ((SET) << (SHIFT))
