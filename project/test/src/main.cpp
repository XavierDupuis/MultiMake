/**
 * @file main.cpp
 * @author Xavier Dupuis / Olivier Saint-Cyr
 * @brief 
 * @version 0.1
 * @date 2021-03-24
 * 
 * @copyright Copyright (c) 2021
 */

#define CATCH_CONFIG_MAIN
#include "catch.hpp"
//#include "../../src/.hpp"

using namespace std;

// TEST CASE
TEST_CASE( "Test Case", "[test_case]" ) {
     REQUIRE( 1 == 2);
}