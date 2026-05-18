package cn.ac.ios.Bean;

/**
 * @author pqc
 */
public enum AttackType {
    // 指数
    EXPONENT,
    // 多项式
    POLYNOMIAL,
    // 不确定是指数还是多项式, unsure poly or exp
    EXPONENT_OR_POLYNOMIAL,
    //栈溢出, overflow
    STACK_ERROR
}
